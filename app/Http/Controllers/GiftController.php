<?php

namespace App\Http\Controllers;

use App\Models\Gift;
use App\Models\Result;
use App\Models\User;
use App\Models\Voucher;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Response;

class GiftController extends Controller
{
    //
    public function index()
    {
        return view('gift.index');
    }

    /**
     * @throws ValidationException
     */
    public function getGift(Request $request): \Illuminate\Http\JsonResponse
    {
        $user = User::where('phone', request('phone'))->first();
        $randomValue = (float)rand() / (float)getrandmax() * 100;
        if ($user) {

            $voucher = $this->getVoucher($user->id,request('code'));

            if ($voucher) {
                $items = $this->getGiftItems();

                if(!$items){
                    throw ValidationException::withMessages([
                        'items-not-exists' => 'Chương trình đã kết thúc hoặc hết quà tặng',
                    ]);
                }

                if ($user->department_id === 1) {
                    $items = $this->setGiftRatioByDepartment($items);
                }
                // Selecting random gift
                $gift = $this->selectingRandomGift($items, (float)$randomValue);

                $this->updateGiftResults($voucher,$user->id,$gift);

                return Response::json(array(
                    'message' => "Chúc mừng bạn đã trúng $gift->name"
                ));

            } else {
                $result = $this->getResult($user->id,request('code'));

                if($result === null) {
                    throw ValidationException::withMessages([
                        'voucher-not-exists' => "Mã dự thưởng không tồn tại",
                    ]);

                }else{
                    return Response::json(array(
                        'message' => "Mã dự thưởng đã trúng $result->name trước đó", # received gift
                    ));
                }


            }

        } else {
            throw ValidationException::withMessages([
                'user-not-exists' => 'Số điện thoại không tồn tại',
            ]);
        }
    }

    /**
     * @return array
     */
    private function getGiftItems(): array
    {
        $items = DB::table('gifts')
            ->where('quantity', '>', 0)
            ->orderBy('ratio', 'DESC')->get()->toArray();
        $sumItemsRatio = array_sum(array_column($items, 'ratio'));

        if ($sumItemsRatio < 100) {
            foreach ($items as $item) {
                $newItemRatio = ($item->ratio * 100) / $sumItemsRatio;
                $item->ratio = $newItemRatio;
            }
        }

        return $items;
    }

    /**
     * @param array $items
     * @return array
     */
    private function setGiftRatioByDepartment(array $items): array
    {
        // Get min ratio in items
        $minRatio = min(array_column($items, 'ratio'));

        $sumRatioOthers = 100 - $minRatio; # Calculate sum ratio of other items

        $newRatioOthers = $sumRatioOthers - 10; # Calculate sum ratio of other items for user in department 1

        foreach ($items as $item) {
            // Set ratio again for other items
            if ($item->ratio != $minRatio) {
                $newItemRatio = ($item->ratio * $newRatioOthers) / $sumRatioOthers;
                $item->ratio = $newItemRatio;
            } else {
                $item->ratio = $item->ratio + 10;
            }
        }

        return $items;
    }

    /**
     * @note function select random gift in
     * @param array $items
     * @param float $randomValue
     * @return mixed|null
     */
    private function selectingRandomGift(array $items, float $randomValue)
    {
        $ratio = 0;

        $gift = null;

        foreach ($items as $item) {
            $ratio += $item->ratio;
            if ($randomValue <= (float)($ratio) && (float)$item->ratio > 0) {
                $gift = $item;
                break;
            }
        }

        return $gift;
    }

    /**
     * @param $userID
     * @param $code
     * @return mixed
     */
    private function getVoucher($userID, $code){
        return Voucher::where([
            'user_id' => $userID,
            'code' => $code,
            'status' => 0,
        ])->first();
    }

    /**
     * @param $voucher
     * @param $userID
     * @param $gift
     * @return int
     */
    private function updateGiftResults($voucher,$userID,$gift): int
    {
        try {
            // Update voucher status after using
            Voucher::where('id',$voucher->id)->update(['status' => 1]);
            // Update gift quantity
            Gift::where('id',$gift->id)->update([
                'quantity' => $gift->quantity - 1,
            ]);
            // Store results
            Result::create([
                'user_id' => $userID,
                'gift_id' => $gift->id,
                'voucher_code' => $voucher->code
            ]);

            return 1;

        }catch (\Throwable $exception){
            return 0;
        }
    }

    /**
     * @param $userID
     * @param $voucherCode
     * @return null
     */
    private function getResult($userID,$voucherCode)
    {
        $receivedGift = null;

        $result = Result::where([
            'user_id' => $userID,
            'voucher_code' => $voucherCode,
        ])->first();

        if($result){
            $receivedGift = Gift::where('id',$result->gift_id)->first();
        }

        return $receivedGift;
    }
}
