<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Faker\Factory as Faker;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();

        // $user = \App\Models\User::create([
        //     'username' => 'Admin',
        //     'email' => 'admin@gmail.com',
        //     'password' => Hash::make('admin')
        // ]);

        // \App\Models\Role::create([
        //     'user_id' => $user->id,
        //     'name' => 'Admin'
        // ]);

        // $user = \App\Models\User::create([
        //     'username' => 'User',
        //     'email' => 'user@gmail.com',
        //     'password' => Hash::make('user123')
        // ]);

        // \App\Models\Role::create([
        //     'user_id' => $user->id,
        //     'name' => 'User'
        // ]);
        
        // $user = \App\Models\User::create([
        //     'username' => 'Doni',
        //     'email' => 'doni@gmail.com',
        //     'password' => Hash::make('doni123')
        // ]);

        // \App\Models\Role::create([
        //     'user_id' => $user->id,
        //     'name' => 'User'
        // ]);
        $faker = Faker::create();
        for ($i=1; $i <= 50; $i++) {
            $name = $faker->firstName();
            $user = User::create([
                'username' => ucfirst($name),
                'email' => strtolower($name).'@gmail.com',
                'password' => Hash::make(strtolower(string: $name).'123')
            ]);

            \App\Models\Role::create([
                'user_id' => $user->id,
                'name' => 'User'
            ]);
        }

        // $categoriesName = ["sehat", "makanan", "teknologi", "wisata", "fashion", "lifestyle", "musik", "pengetahuan", "otomotif", "bisnis", "horor", "olahraga"];
        // foreach ($categoriesName as $category) { 
            
        // \App\Models\Category::create([
        //     'name' => $category,
        //     'slug' => Str::slug($category)
        // ]);
        // }
    }
}
