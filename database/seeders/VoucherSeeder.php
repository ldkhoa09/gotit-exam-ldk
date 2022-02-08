<?php

namespace Database\Seeders;
use App\Models\Voucher;
use Faker\Generator;
use Illuminate\Database\Seeder;

class VoucherSeeder extends Seeder

{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(Generator $faker)
    {
        for ($i = 1; $i <= 100; $i++) {
            $voucher = Voucher::create([
                'user_id'              => $faker->randomElement([1,2,3]),
                'code'                 => $faker->numberBetween(10000,20000),
                'status'               => 0
            ]);
        }
    }
}
