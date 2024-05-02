<?php

namespace App\Http\Controllers\api\v0;

use App\Http\Controllers\Controller;
use App\Models\Specialites;
use Illuminate\Http\Request;

class SpecialitesController extends Controller
{
    //fonctions qui retourne toutes les specilaites
    public function AllSpecialites()
    {
        $specialites = Specialites::all();
        return $specialites;
    }
}
