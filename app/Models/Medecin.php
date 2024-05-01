<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Medecin extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $fillable = [
        'Nom',
        'Prenom',
        'sexe',
        'code',
        'role_id',
        'id_specialite',
        'HoraireConsultation',
        'Email',
        'Motdepasse',
        'Tel',
        'AdresseCab',
        'statut',
    ];

    protected $table = 'medecins';
}
