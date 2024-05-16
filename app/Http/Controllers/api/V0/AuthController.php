<?php

namespace App\Http\Controllers\api\V0;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\Medecin;
use App\Models\Patient;
use App\Models\Role;
use App\Notifications\signupSuccessNotification;
// use GuzzleHttp\Psr7\Response;
use Illuminate\Http\Request;
use Illuminate\Http\Response as HttpResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Symfony\Component\HttpFoundation\Response;

class AuthController extends Controller
{
    // send email

    public function sendEmail($id, $userType)
    {

        switch ($userType) {
            case 'Admin':
                $user = Admin::find($id);
                $user->notify(new signupSuccessNotification($user->nom, 'Admin', $user->email, $user->code));
                break;
            case 'Patient':
                $user = Patient::find($id);
                $user->notify(new signupSuccessNotification($user->Nom, 'Patient', $user->email, $user->code));
                break;
            case 'Medecin':
                $user = Medecin::find($id);
                $user->notify(new signupSuccessNotification($user->Nom, 'Medecin', $user->email, $user->code));
                break;
            default:
                return response()->json(['message' => 'Invalid user type'], Response::HTTP_BAD_REQUEST);
        }


        if (!$user) {
            return response()->json(['message' => 'User not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json(['message' => 'email sent'], Response::HTTP_OK);
    }



    //creer la fonction registerMedecin et registerPatient et leur logout
    public function registerPatient(Request $request)
    {

        $role = Role::where('libelle', 'patient')->first();
        $code = substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, 10);
        // verifier si l'email n'est pas encore enregistre dans la bdd
        $email = $request->email;
        $emailExistAmongPatient = Patient::where('email', $email)->first();
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
            'email' => $request->email,
            'Antecedent' => $request->Antecedent,
            'Adresse' => $request->Adresse,
            'Statut' => 1,
            'photo' => $photoName,
            'Motdepasse' => Hash::make($request->Motdepasse),

        ]);
        if ($user) {
            // envoyer email
            $this->sendEmail($user->id, 'Patient');
            // response de succes
            return Response(
                ['message' => 'medecin saved check your email'],
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
        $email = $request->email;
        $emailExistAmongPatient = Patient::where('email', $email)->first();
        $emailExistAmongAdmin = Admin::where('email', $email)->first();
        $emailExistAmongMedecin = Medecin::where('email', $email)->first();
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
            'email' => $request->email,
            'AdresseCab' => $request->AdresseCab,
            'Statut' => 1,
            'photo' => $photoName,
            'Motdepasse' => Hash::make($request->password),
        ]);

        if ($user) {
            // envoyer email
            $this->sendEmail($user->id, 'Medecin');
            // response de succes
            return Response(
                ['message' => 'medecin saved'],
                HttpResponse::HTTP_CREATED
            );
        } else {
            return response(['message' => 'error'], HttpResponse::HTTP_UNAUTHORIZED);
        }
    }

    // register admin
    public function registerAdmin(Request $request)
    {
        $role = Role::where('libelle', 'admin')->first();
        $code = substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, 10);
        // verifier si l'email n'est pas encore enregistre dans la bdd
        $email = $request->email;
        $emailExistAmongPatient = Patient::where('email', $email)->first();
        $emailExistAmongAdmin = Admin::where('email', $email)->first();
        $emailExistAmongMedecin = Medecin::where('email', $email)->first();
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
            // envoyer email
            $this->sendEmail($user->id, 'Admin');
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
        $credentials = $request->only('email', 'password');

        // Check in Medecin model
        $medecin = Medecin::where('email', $credentials['email'])->first();
        if ($medecin && Hash::check($credentials['password'], $medecin->Motdepasse)) {
            $token = $medecin->createToken('token')->plainTextToken;
            $cookie = cookie('jwt', $token, 60 * 24); // 1 day
            return response([
                'jwt' => $token,
                'role' => 'medecin'
            ])->withCookie($cookie);
        }

        // Check in Administrateur model
        $administrateur = Admin::where('email', $credentials['email'])->first();
        if ($administrateur && Hash::check($credentials['password'], $administrateur->password)) {
            $token = $administrateur->createToken('token')->plainTextToken;
            $cookie = cookie('jwt', $token, 60 * 24); // 1 day
            return response([
                'jwt' => $token,
                'role' => 'administrateur'
            ])->withCookie($cookie);
        }

        // Check in Patient model
        $patient = Patient::where('email', $credentials['email'])->first();
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
