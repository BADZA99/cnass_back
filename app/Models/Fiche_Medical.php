<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Fiche_Medical extends Model
{
    use HasFactory;

    protected $fillable = [
        'id_patient',
        'Poids',
        'Taille',
        'Tension',
        'Description',
    ];

    protected $table = 'Fiche_Medical';
}
