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
        Schema::create('fiche_medical', function (Blueprint $table) {
            $table->increments('id');
            // todo id_patient et autres attributs
            $table->unsignedInteger('id_patient');
            $table->foreign('id_patient')->references('id')->on('patients');
            $table->string('Poids');
            $table->string('Taille');
            $table->string('Tension');
            $table->string('Description');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('fiche_medical');
    }
};
