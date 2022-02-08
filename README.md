### LedangKhoa GotIT Exams

1. Install `Composer` dependencies.

        composer install 

   If your version php: "8.*". You should use

        composer install --ignore-platform-reqs


2. Install `NPM` dependencies.

        npm install


3. The below command will compile all the assets(sass, js, media) to public folder:

        npm run dev


4. Copy `.env.example` file and create duplicate. Use `cp` command for Linux or Max user.

        cp .env.example .env

   If you are using `Windows`, use `copy` instead of `cp`.

        copy .env.example .env


5. Create a table in MySQL database and fill the database details `DB_DATABASE` in `.env` file.


6. The below command will create tables into database using Laravel migration and seeder.

        php artisan migrate:fresh --seed

   I created 3 seeders and migrations for this exam 

   1. UserSeeder: 3 users with user_id in [1,2,3]
   2. GiftSeeder: 3 gifts 
   3. VoucherSeeder: 100 vouchers and random value user_id in [1,3,3]

   Or
       Import database by sql file in "database/exam.sql". You can test with this data

   1. Số điện thoại:  0903121123 | Mã dự thưởng : 12178, 14532, 15599, 18078 | Phòng ban 1
   2. số điện thoại:  0905141221 | Mã dự thưởng : 14023, 12906, 18572, 15045 | Phòng ban 2
   3. số điện thoại:  0902787212 | Mã dự thưởng : 16754, 19107, 10336, 16351 | Phòng ban 3

8. Generate your application encryption key:

        php artisan key:generate

9. Start the localhost server:

        php artisan serve



