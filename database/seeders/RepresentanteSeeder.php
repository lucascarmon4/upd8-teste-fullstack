<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Representante;
use App\Models\Cidade;

class RepresentanteSeeder extends Seeder
{
    public function run(): void
    {
        Representante::factory()
            ->count(10)
            ->create()
            ->each(function ($representante) {
                $cidades = Cidade::inRandomOrder()->take(rand(1, 5))->pluck('id');
                $representante->cidades()->attach($cidades);
            });
    }
}