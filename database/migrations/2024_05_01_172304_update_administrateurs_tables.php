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
        //ajoute la colonne statut 
        Schema::table('administrateurs', function (Blueprint $table) {
            $table->string('statut');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //inverse
        Schema::table('administrateurs', function (Blueprint $table) {
            $table->dropColumn('statut');
        });
    }
};
