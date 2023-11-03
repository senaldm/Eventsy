<?php

namespace App\Http\Controllers;

use App\Models\Planner;
use App\Models\Service;
use App\Models\Friend;
use Illuminate\Http\Request;
use App\Models\Favourite;
use DB;

class PlannerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Planner::with('friends')->get(); // correct code 
        return $data;
    }

    public function getCurrentPlanner($currentPlannerId)
    {
       $currentPlanner = Planner::with('friends')->find($currentPlannerId);
       return $currentPlanner;
    }

    public function addFriend($currentId,$plannerId)
    {
        $friendId = $plannerId;
        $currentUser = Planner::find($currentId);
        $friend = Planner::find($friendId);
        $currentUser->friends()->attach($friend);
        
        return response()->json(['message' => 'Friend request sent.', 'status' => 'pending']);
    }

    public function updateProfile(Request $request,$plannerId)
    {
        $user = Planner::find($plannerId);

        if(!$user){
            return response()->json(['error'=>'User not found'],404);
        }

        $validatedData = $request->validate([
            'name' => 'string',
            'profileIMG' => 'url',
            'location' => 'string',
            'dob' => 'date',
            'image1' => 'url',
            'image2' => 'url',
            'image3' => 'url',
            'image4' => 'url',
            'image5' => 'url',
            'email' => 'email',
            'contact' => 'string',
            'description' => 'string',
            'services' => 'string',
        ]);

        if($user->update($validatedData)){
            return response()->json(['message' => 'Profile updated Successfully']);
        }        
    }

    public function getRequests($currentPlannerId)
    {
        $pendingRequests = Friend::join('planners', 'friends.PlannerID', '=', 'planners.plannerID')
        ->where('friends.friendplannerID', $currentPlannerId)
        ->where('friends.status', 'pending')
        ->select('friends.*', 'planners.*') // Select all columns from both tables
        ->get();

        return response()->json($pendingRequests); // correct code
    }

    public function getFriends($currentPlannerId)
    {
        $confirmedRequests = Friend::join('planners', 'friends.PlannerID', '=', 'planners.plannerID')
        ->where('friends.friendplannerID', $currentPlannerId)
        ->where('friends.status', 'confirmed')
        ->select('friends.*', 'planners.*') // Select all columns from both tables
        ->get();

        return response()->json($confirmedRequests); // correct code
    }

    public function acceptFriend(Request $request,$friendId)
    {
        $friend = DB::table('friends')->where('friendID', $friendId)->first();

        if (!$friend) {
            return response()->json(['error' => 'Friend ID not found'], 404);
        }

        $result = DB::table('friends')
        ->where('friendID', $friendId)
        ->update(['status' => 'confirmed']);

        if ($result) {
            return response()->json(['message' => 'Request updated successfully']);
        } else {
            return response()->json(['error' => 'Failed to update the request'], 500);
        }
    }

    public function deleteFriend($friendId)
    {
        $data = DB::table('friends')->where('friendID',$friendId);
        $data->delete();
        return response()->json(['message'=>'successfully deleted']);
    }

    public function addToFavourite($currentId,$plannerId)
    {
        $favouritePlannerID = $plannerId;
        $currentUser = Planner::find($currentId);
        $favouritePlanner = Planner::find($favouritePlannerID);
        $currentUser->favourites()->attach($favouritePlanner);
        
        return response()->json(['message' => 'Added to Favourite']);
    }

    public function getFavourites($currentPlannerId)
    {
        $favourites = Favourite::join('planners', 'favourites.favouritePlannerID', '=', 'planners.plannerID')
        ->where('favourites.plannerID', $currentPlannerId)
        ->select('favourites.*', 'planners.*') // Select all columns from both tables
        ->get();

        return response()->json($favourites); // correct code
    }

    public function deleteFavourite($favouriteId)
    {
        $data = DB::table('favourites')->where('favouriteID',$favouriteId);
        $data->delete();
        return response()->json(['message'=>'successfully deleted']);
    }

    public function create()
    {
        //
    }
    public function store(Request $request)
    {
        //
    }
    public function show(Planner $planner)
    {
        //
    }
    public function edit(Planner $planner)
    {
        //
    }
    public function update(Request $request, Planner $planner)
    {
        //
    }
    public function destroy(Planner $planner)
    {
        //
    }
}
