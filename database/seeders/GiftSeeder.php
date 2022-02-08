<?php

namespace Database\Seeders;
use Illuminate\Database\Seeder;
use Faker\Generator;
use App\Models\Gift;


class GiftSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(Generator $faker)
    {
        $giftOne = Gift::create([
            'name'              => 'Iphone 13 Promax',
            'quantity'          => 10,
            'ratio'             => 5
        ]);

        $giftOne = Gift::create([
            'name'              => '1 triệu tiên mặt',
            'quantity'          => 30,
            'ratio'             => 30
        ]);

        $giftOne = Gift::create([
            'name'              => 'Vé xem phim',
            'quantity'          => 60,
            'ratio'             => 65
        ]);
    }
}
