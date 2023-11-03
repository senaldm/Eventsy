<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Service;

class ServicesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Service::create([
            'serviceName' => 'Event Planning',
        ]);

        Service::create([
            'serviceName' => 'Venue Booking',
        ]);

        // Add more services if needed
    }
}
