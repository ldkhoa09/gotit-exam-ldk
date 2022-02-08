<?php

namespace App\Http\Controllers;

use App\Models\Gift;
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

            $voucher = Voucher::where([
                'user_id' => $user->id,
                'code' => request('code'),
                'status' => 0,
            ])->first();

            if ($voucher) {
                $items = $this->getGiftItems();

                if(!$items){
                    throw ValidationException::withMessages([
                        'items-not-exists' => 'Chương trình đã kết thúc hoặc hết quà',
                    ]);
                }

                if ($user->department_id === 1) {
                    $items = $this->setGiftRatioByDepartment($items);
                }

                // Select random gift
                $gift = $this->selectingGift($items, (float)$randomValue);

                // Update voucher status after using
                Voucher::where('id',$voucher->id)->update(['status' => 1]);
                // Update gift quantity
                Gift::where('id',$gift->id)->update([
                    'quantity' => $gift->quantity - 1,
                ]);

                return Response::json(array(
                    'success' => true,
                    'data' => $gift
                ));

            } else {
                throw ValidationException::withMessages([
                    'voucher-not-exists' => 'Voucher không tồn tại hoặc đã hết hạn',
                ]);
            }
        } else {
            throw ValidationException::withMessages([
                'user-not-exists' => 'User không tồn tại',
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
                $newItemRatio = round(($item->ratio * 100) / $sumItemsRatio);
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

        $minRatio = min(array_column($items, 'ratio'));
        $sumRatioOthers = 100 - $minRatio;
        $newRatioOthers = $sumRatioOthers - 10;
        foreach ($items as $item) {
            if ($item->ratio != $minRatio) {
                $newItemRatio = round(($item->ratio * $newRatioOthers) / $sumRatioOthers);
                $item->ratio = $newItemRatio;
            } else {
                $item->ratio = $item->ratio + 10;
            }
        }
        return $items;
    }

    private function selectingGift(array $items, float $randomValue)
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
}
