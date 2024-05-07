<?php

namespace App\Http\Controllers\api\v0;

use App\Http\Controllers\Controller;
use App\Models\Medecin;
use Illuminate\Http\Request;

class MedecinController extends Controller
{
    //cree la fonction qui liste tous les medecins
    public function AllMedecins()
    {
        $medecins = Medecin::all();
        return $medecins;
    }
}
