<?php

use App\Http\Controllers\api\V0\AuthController;
use App\Http\Controllers\api\V0\RoleController;
use App\Http\Controllers\api\v0\SpecialitesController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
// authentification
Route::post('/newPatient', [AuthController::class, 'registerPatient']);
Route::post('/newMedecin', [AuthController::class, 'registerMedecin']);
Route::post('/newAdmin', [AuthController::class, 'registerAdmin']);
Route::post('/login', [AuthController::class, 'login']);
Route::middleware('auth:sanctum')->group(function () {
    Route::get('user', [AuthController::class, 'user']);
    Route::post('/logout', [AuthController::class, 'logout']);
});

// roles 
Route::get('/roles', [RoleController::class, 'AllRoles']);


// specilaites
Route::get('/specialites', [SpecialitesController::class, 'AllSpecialites']);
