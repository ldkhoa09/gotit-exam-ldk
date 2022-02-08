<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\UserInfo;
use Faker\Generator;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(Generator $faker)
    {
        $demoUser = User::create([
            'first_name'        => $faker->firstName,
            'last_name'         => $faker->lastName,
            'email'             => 'demo@demo.com',
            'phone'             => $faker->phoneNumber(),
            'department_id'     => 1,
            'password'          => Hash::make('demo'),
            'email_verified_at' => now(),
        ]);

        $this->addDummyInfo($faker, $demoUser);

        $demoUser2 = User::create([
            'first_name'        => $faker->firstName,
            'last_name'         => $faker->lastName,
            'email'             => 'demo1@demo.com',
            'phone'             => $faker->phoneNumber(),
            'department_id'     => 2,
            'password'          => Hash::make('demo'),
            'email_verified_at' => now(),
        ]);

        $this->addDummyInfo($faker, $demoUser2);

        $demoUser3= User::create([
            'first_name'        => $faker->firstName,
            'last_name'         => $faker->lastName,
            'email'             => 'demo2@demo.com',
            'phone'             => $faker->phoneNumber(),
            'department_id'     => 3,
            'password'          => Hash::make('demo'),
            'email_verified_at' => now(),
        ]);

        $this->addDummyInfo($faker, $demoUser3);

    }

    private function addDummyInfo(Generator $faker, User $user)
    {
        $dummyInfo = [
            'company'  => $faker->company,
            'website'  => $faker->url,
            'language' => $faker->languageCode,
            'country'  => $faker->countryCode,
        ];

        $info = new UserInfo();
        foreach ($dummyInfo as $key => $value) {
            $info->$key = $value;
        }
        $info->user()->associate($user);
        $info->save();
    }
}
