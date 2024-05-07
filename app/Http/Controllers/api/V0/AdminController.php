<?php

namespace App\Http\Controllers\api\v0;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use Illuminate\Http\Request;

class AdminController extends Controller
{
       //cree la fonction qui liste tous les administrateurs
         public function AllAdmins()
         {
              $admins = Admin::all();
              return $admins;
         }
}
