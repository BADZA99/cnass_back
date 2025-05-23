<?php

namespace App\Http\Controllers\api\v0;

use App\Http\Controllers\Controller;
use App\Models\Fiche_Medical;
use App\Models\Patient;
use App\Notifications\CreationFicheMedecalReussiNotification;
use App\Notifications\UpdateFicheMedecalReussiNotification;
use Illuminate\Http\Request;

class FicheMedicalController extends Controller
{
    // fonction qui va envoyer le mail notifiant la creation de la fiche medical

    //fonction qui cree une fiche medical 
    public function createFicheMedical(Request $request)
    {
        $fiche = new Fiche_Medical();
        $fiche->id_patient = $request->id_patient;
        $fiche->Poids = $request->Poids;
        $fiche->Taille = $request->Taille;
        $fiche->Tension = $request->Tension;
        $fiche->Description = $request->Description;

        if ($fiche->save()) {
            $patient = Patient::find($fiche->id_patient);

            if($patient){
                $patient->notify(new CreationFicheMedecalReussiNotification(
                    $patient->Nom,
                    $patient->Prenom,
                    $fiche->Taille,
                    $fiche->Poids,
                    $fiche->Tension,
                    $fiche->Description
                ));
                return response()->json(['message' => 'Fiche medical cree avec succes'], 201);
            }else{
                return response()->json([
                    'message' => 'patient not found'
                    ], 404);
            }

            return response()->json(['message' => 'Fiche medical cree avec succes mais email pas envoye'], 201);
        } else{
            return response()->json(['message' => 'Erreur lors de la creation de la fiche medical'], 400);
        }
        
    }

    // update
    public function updateFicheMedical(Request $request, $idPatient)
    {
        $fiche = Fiche_Medical::where('id_patient', $idPatient)->first();
        $fiche->id_patient = $request->id_patient;
        $fiche->Poids = $request->Poids;
        $fiche->Taille = $request->Taille;
        $fiche->Tension = $request->Tension;
        $fiche->Description = $request->Description;

        if($fiche->save()){
            $patient = Patient::find($fiche->id_patient);
            if($patient){
                $patient->notify(new UpdateFicheMedecalReussiNotification(
                    $patient->Nom,
                    $patient->Prenom,
                    $fiche->Taille,
                    $fiche->Poids,
                    $fiche->Tension,
                    $fiche->Description
                ));
                return response()->json(['message' => 'Fiche medical modifie avec succes'], 200);
            }else{
                return response()->json([
                    'message' => 'patient not found'
                    ], 404);
            }
        }else{
            return response()->json(['message' => 'Erreur lors de la modification de la fiche medical'], 400);
        }
       
    }

    
    // delete
    public function deleteFicheMedical($idPatient)
    {
        $fiche = Fiche_Medical::where('id_patient', $idPatient)->first();
        if($fiche->delete()){
            return response()->json(['message' => 'Fiche medical supprime avec succes'], 200);
        }else{
            return response()->json(['message' => 'Erreur lors de la suppression de la fiche medical'], 400);
        }
    }

    // tous les fiches
    public function AllFicheMedicals(){
        $fiche = Fiche_Medical::all();
        return response()->json($fiche, 200);
    }

       
}
