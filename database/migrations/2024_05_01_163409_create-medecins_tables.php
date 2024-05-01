<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('medecins', function (Blueprint $table) {
            $table->increments('id');
            $table->string('Nom');
            $table->string('Prenom');
            // todo specialites,horaire_consultation,tel,email,adresseCab,motdepasse
            //   ajoute la colone id_specialite qui fait fait reference a la table specialite 
            //   ajoute la colone role_id qui fait fait reference a la table roles
            $table->unsignedInteger('role_id');
            $table->foreign('role_id')->references('id')->on('roles');
            $table->unsignedInteger('id_specialite');
            $table->foreign('id_specialite')->references('id')->on('specialites');
            $table->string('HoraireConsultation');
            $table->string('Tel');
            $table->string('Email');
            $table->string('AdresseCab');
            $table->string('Motdepasse');
            $table->string('Statut');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //le contraire
        Schema::dropIfExists('medecins');
    }
};
