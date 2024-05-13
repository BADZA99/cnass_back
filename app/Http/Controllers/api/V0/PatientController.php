<?php

namespace App\Http\Controllers\api\v0;

use App\Http\Controllers\Controller;
use App\Models\Patient;
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
            $patient = Patient::find($id);

            if(!$patient){
                return response()->json(['message' => 'Patient introuvable'], 404);
            }

            $patient->delete();

            return response()->json(['message' => 'Patient supprime avec succes'], 200);
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
}
