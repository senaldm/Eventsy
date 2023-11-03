<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Notifications\Notifiable;


class Friend extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $fillable = [
        'friendID',
        'plannerID',
        'friendPlannerID',
        'status',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    // comment this line
    // public function planner() {
    //     return $this->belongsTo(Planner::class, 'plannerID', 'plannerID');
    // }
    
}
