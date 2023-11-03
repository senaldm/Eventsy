<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PlannerController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
/*
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
*/
Route::get('/planners',[PlannerController::class,'index']);
Route::get('/getCurrentPlanner/{currentPlannerId}',[PlannerController::class,'getCurrentPlanner']);
Route::post('/hire/{currentId}/{plannerId}',[PlannerController::class,'addFriend']);
Route::post('/updateProfile/{plannerId}',[PlannerController::class,'updateProfile']);
Route::get('/getRequests/{plannerId}',[PlannerController::class,'getRequests']);
Route::get('/getFriends/{plannerId}',[PlannerController::class,'getFriends']);
Route::post('/accept/{friendId}',[PlannerController::class,'acceptFriend']);
Route::post('/deleteFriend/{friendId}',[PlannerController::class,'deleteFriend']);
Route::post('/addToFavourite/{currentId}/{plannerId}',[PlannerController::class,'addToFavourite']);
Route::get('/getFavourites/{plannerId}',[PlannerController::class,'getFavourites']);
Route::post('/deleteFavourite/{favouriteID}',[PlannerController::class,'deleteFavourite']);

