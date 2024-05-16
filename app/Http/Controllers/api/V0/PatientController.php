<?php

namespace App\Http\Controllers\api\v0;

use App\Http\Controllers\Controller;
use App\Models\Fiche_Medical;
use App\Models\Patient;
use App\Notifications\SuppressionPatientReussiNotification;
use Illuminate\Http\Request;

class PatientController extends Controller
{
     //cree la fonction qui liste tous les patients
        public function AllPatients()
        {
            $patients = Patient::all();
            return $patients;
        }

        // upadte patient
        public function updatePatient(Request $request, $id)
        {
            $patient = Patient::find($id);

            if(!$patient){
                return response()->json(['message' => 'Patient introuvable'], 404);
            }
        //  mettre a jour le Nom,Prenom,Adresse,Antecedent,Description
        $patient->update([
            'Nom' => $request->Nom,
            'Prenom' => $request->Prenom,
            'Adresse' => $request->Adresse,
            'Antecedent' => $request->Antecedent,
            'Description' => $request->Description,
        ]);
        // envoyer message erreur si la maj s'est mal passer
        if(!$patient){
            return response()->json(['message' => 'Erreur lors de la mise a jour'], 500);
        }
        // retourner un message de succes
        return response()->json(['message' => 'Patient mis a jour avec succes'], 200);
        }

        // supprimer un patient
        public function deletePatient($id)
        {
            // supprimer d'abord sa fiche medicale
            $fiche = Fiche_Medical::where('id_patient', $id)->delete();
            if($fiche){
                $patient = Patient::find($id);
                if(!$patient){
                    return response()->json(['message' => 'Patient introuvable'], 404);
                }else{
                // notifier le patient a suuprimer par email
                $patient->notify(new SuppressionPatientReussiNotification(
                    $patient->Nom,
                    $patient->Prenom,
                ));
                    $deleted=$patient->delete();
                    
                    if ($deleted) {
                        return response()->json(['message' => 'Patient supprime avec succes'], 200);
                    } else {
                    return response()->json(['message' => 'erreur lors de la suppresion du patient'], 404);
                
                    }
                    
                }
            }
        }

        // desactiver un patient
        public function desactiverPatient($id)
        {
            $patient = Patient::find($id);

            if(!$patient){
                return response()->json(['message' => 'Patient introuvable'], 404);
            }

            $patient->update([
            'Statut' => 0
            ]);

            return response()->json(['message' => 'Patient desactivé avec succes'], 200);
        }

        // activer un patient
        public function activerPatient($id)
        {
            $patient = Patient::find($id);

            if(!$patient){
                return response()->json(['message' => 'Patient introuvable'], 404);
            }

            $patient->update([
                'Statut' => 1
            ]);

            return response()->json(['message' => 'Patient activé avec succes'], 200);
        }
    
}
