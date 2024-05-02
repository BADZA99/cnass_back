<?php

namespace App\Http\Controllers\api\V0;

use App\Http\Controllers\Controller;
use App\Models\Role;
use Illuminate\Http\Request;

class RoleController extends Controller
{
    //fonction qui liste tous les roles
    public function AllRoles()
    {
        $roles = Role::all();
        return $roles;
    }

}
