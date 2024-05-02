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
        //ajoute la colonne photo dans medecins et patients 
        Schema::table('patients', function (Blueprint $table) {
            $table->string('photo')->nullable();
        });

        Schema::table('medecins', function (Blueprint $table) {
            $table->string('photo')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //inverse
        Schema::table('patients', function (Blueprint $table) {
            $table->dropColumn('photo');
        });
        Schema::table('medecins', function (Blueprint $table) {
            $table->dropColumn('photo');
        });

    }
};
