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
    // fonction qui desative un medecin
    public function desactiverMedecin($id)
    {
        $medecin = Medecin::find($id);

        if(!$medecin){
            return response()->json(['message' => 'Medecin introuvable'], 404);
        }


        $medecin->update([
            'Statut' => 0
        ]);

        return response()->json(['message' => 'Medecin desactive avec succes'], 200);
    }
    // fonction qui active un medecin
    public function activerMedecin($id)
    {
        $medecin = Medecin::find($id);

        if (!$medecin) {
            return response()->json(['message' => 'Medecin introuvable'], 404);
        }


        $medecin->update([
            'Statut' => 1
        ]);

        return response()->json(['message' => 'Medecin desactive avec succes'], 200);
    }
}
