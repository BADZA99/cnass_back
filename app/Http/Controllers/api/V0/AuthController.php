<?php

namespace App\Http\Controllers\api\V0;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\Medecin;
use App\Models\Patient;
use App\Models\Role;
use GuzzleHttp\Psr7\Response;
use Illuminate\Http\Request;
use Illuminate\Http\Response as HttpResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    //creer la fonction registerMedecin et registerPatient et leur logout
    public function registerPatient(Request $request)
    {

        $role = Role::where('libelle', 'patient')->first();
        $code = substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, 10);
        // verifier si l'email n'est pas encore enregistre dans la bdd
        $email = $request->Email;
        $emailExistAmongPatient = Medecin::where('Email', $email)->first();
        $emailExistAmongAdmin = Admin::where('email', $email)->first();
        $emailExistAmongMedecin = Medecin::where('Email', $email)->first();
        $emailExist = $emailExistAmongPatient || $emailExistAmongAdmin || $emailExistAmongMedecin;

        if ($emailExist) {
            return response(['message' => 'email already exist'], HttpResponse::HTTP_UNAUTHORIZED);
        }
        if ($request->hasFile('photo')) {
            $photo = $request->file('photo');
            $extension = $photo->getClientOriginalExtension();
            $photoName = time() . '.' . $extension;
            $photo->move('photos_patients', $photoName);
        } else {
            $photoName = null;
        }
        $user = Patient::create([
            'Nom' => $request->Nom,
            'Prenom' => $request->Prenom,
            'DateNaissance' => $request->DateNaissance,
            'Description' => $request->Description,
            'Tel' => $request->Tel,
            'sexe' => $request->sexe,
            'code' => $code,
            'role_id' => $request->role_id,
            'Email' => $request->Email,
            'Antecedent' => $request->Antecedent,
            'Adresse' => $request->Adresse,
            'statut' => 1,
            'photo' => $photoName,
            'Motdepasse' => Hash::make($request->Motdepasse),

        ]);
        if ($user) {
            // response de succes
            return Response(
                ['message' => 'medecin saved'],
                HttpResponse::HTTP_CREATED
            );
        } else {
            return response(['message' => 'error'], HttpResponse::HTTP_UNAUTHORIZED);
        }
    }

    // register medecin
    public function registerMedecin(Request $request)
    {
        $role = Role::where('libelle', 'medecin')->first();
        $code = substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, 10);
        if ($request->hasFile('photo')) {
            $photo = $request->file('photo');
            $extension = $photo->getClientOriginalExtension();
            $photoName = time() . '.' . $extension;
            $photo->move('photos_medecins', $photoName);
        } else {
            $photoName = null;
        }

        // verifier si l'email n'est pas encore enregistre dans la bdd
        $email = $request->Email;
        $emailExistAmongPatient = Medecin::where('Email', $email)->first();
        $emailExistAmongAdmin = Admin::where('email', $email)->first();
        $emailExistAmongMedecin = Medecin::where('Email', $email)->first();
        $emailExist = $emailExistAmongPatient || $emailExistAmongAdmin || $emailExistAmongMedecin;
        
        if ($emailExist) {
            return response(['message' => 'email already exist'], HttpResponse::HTTP_UNAUTHORIZED);
        }
        $user = Medecin::create([
            'Nom' => $request->Nom,
            'Prenom' => $request->Prenom,
            'id_specialite' => $request->id_specialite,
            'sexe' => $request->sexe,
            'code' => $code,
            'HoraireConsultation' => $request->HoraireConsultation,
            'Tel' => $request->Tel,
            'role_id' => $request->role_id,
            'Email' => $request->Email,
            'AdresseCab' => $request->AdresseCab,
            'statut' => 1,
            'photo' => $photoName,
            'Motdepasse' => Hash::make($request->password),
        ]);

        if($user){
            // response de succes
             return Response(['message'=>'medecin saved'],
             HttpResponse::HTTP_CREATED);
        }else{
            return response(['message' => 'error'], HttpResponse::HTTP_UNAUTHORIZED);
        }
    }

    // register admin
    public function registerAdmin(Request $request)
    {
        $role = Role::where('libelle', 'admin')->first();
        $code = substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, 10);
        // verifier si l'email n'est pas encore enregistre dans la bdd
        $email = $request->Email;
        $emailExistAmongPatient = Medecin::where('Email', $email)->first();
        $emailExistAmongAdmin = Admin::where('email', $email)->first();
        $emailExistAmongMedecin = Medecin::where('Email', $email)->first();
        $emailExist = $emailExistAmongPatient || $emailExistAmongAdmin || $emailExistAmongMedecin;

        if ($emailExist) {
            return response(['message' => 'email already exist'], HttpResponse::HTTP_UNAUTHORIZED);
        }
        $user = Admin::create([
            'nom' => $request->nom,
            'prenom' => $request->prenom,
            'adresse' => $request->adresse,
            'sexe' => $request->sexe,
            'code' => $code,
            'telephone' => $request->telephone,
            'role_id' => $request->role_id,
            'email' => $request->email,
            'statut' => 1,
            'password' => Hash::make($request->password),
        ]);
        if ($user) {
            // response de succes
            return Response(
                ['message' => 'admin saved'],
                HttpResponse::HTTP_CREATED
            );
        } else {
            return response(['message' => 'error'], HttpResponse::HTTP_UNAUTHORIZED);
        }
    }

  



public function login(Request $request)
{
    $credentials = $request->only('Email', 'password');

    // Check in Medecin model
    $medecin = Medecin::where('Email', $credentials['Email'])->first();
    if ($medecin && Hash::check($credentials['password'], $medecin->Motdepasse)) {
        $token = $medecin->createToken('token')->plainTextToken;
        $cookie = cookie('jwt', $token, 60 * 24); // 1 day
        return response([
            'jwt' => $token,
            'role' => 'medecin'
        ])->withCookie($cookie);
    }

    // Check in Administrateur model
    $administrateur = Admin::where('Email', $credentials['Email'])->first();
    if ($administrateur && Hash::check($credentials['password'], $administrateur->password)) {
        $token = $administrateur->createToken('token')->plainTextToken;
        $cookie = cookie('jwt', $token, 60 * 24); // 1 day
        return response([
            'jwt' => $token,
            'role' => 'administrateur'
        ])->withCookie($cookie);
    }

    // Check in Patient model
    $patient = Patient::where('Email', $credentials['Email'])->first();
    if ($patient && Hash::check($credentials['password'], $patient->Motdepasse)) {
        $token = $patient->createToken('token')->plainTextToken;
        $cookie = cookie('jwt', $token, 60 * 24); // 1 day
        return response([
            'jwt' => $token,
            'role' => 'patient'
        ])->withCookie($cookie);
    }

    // Authentication failed...
    return response(['message' => 'mot de passe et/ou email incorrect'], 401);
}



    // logged user
    public function user(Request $request)
    {
        return $request->user();
    }

    // logout function
    public function logout()
    {
        $cookie = Cookie::forget('jwt');
        return \response([
            'message' => 'success'
        ])->withCookie($cookie);
    }

    

}
