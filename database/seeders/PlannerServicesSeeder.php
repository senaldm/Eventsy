<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Planner;
use App\Models\Service;

class PlannerServicesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $planner = Planner::find(1); // Assuming the first planner created has ID 1
        $service = Service::find(1); // Assuming the first service created has ID 1

        if ($planner && $service) {
            $planner->services()->attach($service);
        }
        // Attach more services to planners if needed
    }
}
