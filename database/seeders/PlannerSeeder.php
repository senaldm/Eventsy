<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Planner;
use Illuminate\Support\Facades\Hash;
use DB;

class PlannerSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //

        $planner1 = Planner::create([
        'name'=>'Jashmin',
        'location'=>'Jaffna',
        'dob'=>'1999-07-25',
        'password'=>Hash::make('12345'),
        'rate'=>5,
        'profileIMG'=>'https://picsum.photos/250?image=29',
        'image1'=>'https://picsum.photos/250?image=20',
        'image2'=>'https://picsum.photos/250?image=21',
        'image3'=>'https://picsum.photos/250?image=22',
        'image4'=>'https://picsum.photos/250?image=40',
        'image5'=>'https://picsum.photos/250?image=41',
        'contact'=>'+9477896078',
        'email'=>'jashmi@gmail.com',
        'description'=>'i have experience in so many thing',
        'services' => 'Event booking,Event planning,Birthday decorations',
        ]);

        $planner2 = Planner::create([
            'name'=>'Diron',
            'location'=>'Hatton',
            'dob'=>'1999-11-01',
            'password'=>Hash::make('12345'),
            'rate'=>3,
            'profileIMG'=>'https://picsum.photos/250?image=25',
            'image1'=>'https://picsum.photos/250?image=23',
            'image2'=>'https://picsum.photos/250?image=24',
            'image3'=>'https://picsum.photos/250?image=26',
            'image4'=>'https://picsum.photos/250?image=27',
            'image5'=>'https://picsum.photos/250?image=28',
            'contact'=>'+94750248108',
            'email'=>'dirond@gmail.com',
            'description'=>'i have experience in so many thing',
            'services' => 'Hall booking,Event planning,Hall decorations',
            ]);

            $planner3 = Planner::create([
                'name'=>'Piratheepan',
                'location'=>'Colombo',
                'dob'=>'2005-02-15',
                'password'=>Hash::make('12345'),
                'rate'=>4,
                'profileIMG'=>'https://picsum.photos/250?image=1',
                'image1'=>'https://picsum.photos/250?image=2',
                'image2'=>'https://picsum.photos/250?image=3',
                'image3'=>'https://picsum.photos/250?image=4',
                'image4'=>'https://picsum.photos/250?image=5',
                'image5'=>'https://picsum.photos/250?image=6',
                'contact'=>'+94773915572',
                'email'=>'piradeepan@gmail.com',
                'description'=>'I am selva piratheepan',
                'services' => 'Transport,Venue booking',
                ]);

        //$planner1->friends()->attach($planner2);
        //$planner2->friends()->attach($planner1);

    }
}
