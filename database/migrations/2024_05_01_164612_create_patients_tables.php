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
        Schema::create('patients', function (Blueprint $table) {
            $table->increments('id');
            $table->string('Nom');
            $table->string('Prenom');
            //todo  date naissance,tel,email,Adresse,motdepasse,adresse,description,antecedent
            $table->unsignedInteger('role_id');
            $table->foreign('role_id')->references('id')->on('roles');
            $table->date('DateNaissance');
            $table->string('Tel');
            $table->string('Email');
            $table->string('Adresse');
            $table->string('Motdepasse');
            $table->string('Description');
            $table->string('Antecedent');
            $table->string('Statut');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('patients_tables');
    }
};
