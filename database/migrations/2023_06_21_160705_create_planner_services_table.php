<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('planner_services', function (Blueprint $table) {
            $table->unsignedBigInteger('plannerID');
            $table->unsignedBigInteger('serviceID');
            $table->foreign('plannerID')->references('plannerID')->on('planners');
            $table->foreign('serviceID')->references('serviceID')->on('services');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('planner_services');
    }
};
