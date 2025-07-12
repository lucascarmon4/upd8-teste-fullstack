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
        Schema::create('representante_cidade', function (Blueprint $table) {
            $table->foreignId('representante_id')->constrained('representantes')->onDelete('cascade');
            $table->foreignId('cidade_id')->constrained('cidades')->onDelete('cascade');
            $table->primary(['representante_id', 'cidade_id']);
        });
    }


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('representante_cidade');
    }
};
