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
}
