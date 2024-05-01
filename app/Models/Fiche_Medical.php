<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Fiche_Medical extends Model
{
    use HasFactory;

    protected $fillable = [
        'Description',
        // todo id_patient
        'statut',
    ];
}
