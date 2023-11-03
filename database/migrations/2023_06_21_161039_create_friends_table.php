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
        Schema::create('friends', function (Blueprint $table) {
            $table->id('friendID');
            $table->unsignedBigInteger('plannerID');
            $table->unsignedBigInteger('friendPlannerID');
            $table->enum('status', ['pending', 'confirmed'])->default('pending');
            //$table->string('status')->default('pending');
            $table->foreign('plannerID')->references('plannerID')->on('planners');
            $table->foreign('friendPlannerID')->references('plannerID')->on('planners');
            $table->unique(['plannerID', 'friendPlannerID']);
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
        Schema::dropIfExists('friends');
    }
};
