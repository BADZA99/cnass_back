<?php

use App\Http\Controllers\api\v0\AdminController;
use App\Http\Controllers\api\V0\AuthController;
use App\Http\Controllers\api\v0\MedecinController;
use App\Http\Controllers\api\v0\PatientController;
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


// medecins
Route::get('/medecins', [MedecinController::class, 'AllMedecins']);


// patients
Route::get('/patients', [PatientController::class, 'AllPatients']);
Route::put('/UpdatePatient/{id}', [PatientController::class, 'updatePatient']);
Route::delete('/patients/{id}', [PatientController::class, 'deletePatient']);


// admin
Route::get('/admins', [AdminController::class, 'AllAdmins']);


// roles 
Route::get('/roles', [RoleController::class, 'AllRoles']);


// specilaites
Route::get('/specialites', [SpecialitesController::class, 'AllSpecialites']);
