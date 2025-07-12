<?php

namespace Database\Factories;

use App\Models\Cidade;
use Illuminate\Database\Eloquent\Factories\Factory;

class CidadeFactory extends Factory
{
    protected $model = Cidade::class;

    public function definition(): array
    {
        return [
            'nome' => $this->faker->city,
            'estado_id' => \App\Models\Estado::inRandomOrder()->first()?->id,
        ];
    }
}

