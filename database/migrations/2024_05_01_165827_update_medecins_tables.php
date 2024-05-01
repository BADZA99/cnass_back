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
        //ajoute la colonne sexe et code
        Schema::table('medecins', function (Blueprint $table) {
            $table->string('sexe');
            $table->string('code');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //inverse
        Schema::table('medecins', function (Blueprint $table) {
            $table->dropColumn('sexe');
            $table->dropColumn('code');
        });
    }
};
