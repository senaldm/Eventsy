<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Notifications\Notifiable;


class Planner extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $primaryKey = 'plannerID';


    protected $fillable = [
        'plannerID',
        'name',
        'location',
        'dob',
        'password',
        'rate',
        'profileIMG',
        'image1',
        'image2',
        'image3',
        'image4',
        'image5',
        'contact',
        'email',
        'description',
        'services'
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function services()
    {
        return $this->belongsToMany(Service::class, 'planner_services', 'plannerID', 'serviceID');
    }

    public function friends()
    {
        return $this->belongsToMany(Planner::class, 'friends', 'plannerID', 'friendPlannerID',)->withPivot('status'); // Correct line
        //return $this->belongsToMany(Friend::class)->withPivot('status');
        //return $this->hasMany(Friend::class, 'plannerID', 'plannerID');

    }
    public function favourites()
    {
        return $this->belongsToMany(Planner::class, 'favourites', 'plannerID', 'favouritePlannerID',); // Correct line

    }

    
}
