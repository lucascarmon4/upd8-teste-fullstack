<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Estado;

class EstadoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Estado::insert([
            ['sigla' => 'SP', 'nome' => 'São Paulo'],
            ['sigla' => 'RJ', 'nome' => 'Rio de Janeiro'],
            ['sigla' => 'MG', 'nome' => 'Minas Gerais'],
            ['sigla' => 'PR', 'nome' => 'Paraná'],
            ['sigla' => 'SC', 'nome' => 'Santa Catarina'],
            ['sigla' => 'RS', 'nome' => 'Rio Grande do Sul'],
        ]);
    }
}
