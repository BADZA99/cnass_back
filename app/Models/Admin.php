<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Admin extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $fillable = [
        'nom',
        'prenom',
        'sexe',
        'code',
        'role_id',
        'adresse',
        'email',
        'password',
        'telephone',
        'statut',
    ];

    // LE NOM DE LA TABLE
    protected $table = 'administrateurs';
}
