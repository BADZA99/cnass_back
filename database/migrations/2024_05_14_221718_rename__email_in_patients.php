<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('patients', function (Blueprint $table) {
            //reneme Email en email
       
          DB::statement('ALTER TABLE patients CHANGE Email email VARCHAR(25)');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('patients', function (Blueprint $table) {
            //inverse
            DB::statement('ALTER TABLE patients CHANGE email Email VARCHAR(25)');
        });
    }
};
