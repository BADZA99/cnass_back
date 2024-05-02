<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Patient extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $fillable = [
        'Nom',
        'Prenom',
        'DateNaissance',
        'Description',
        'Email',
        'Motdepasse',
        'Tel',
        'sexe',
        'code',
        'role_id',
        'Adresse',
        'Antecedent',
        'Sexe',
        'photo',
        'statut',
    ];
    protected $table = 'patients';
}
