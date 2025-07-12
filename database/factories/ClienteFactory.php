<?php

namespace Database\Factories;

use App\Models\Cliente;
use Illuminate\Database\Eloquent\Factories\Factory;

class ClienteFactory extends Factory
{
    protected $model = Cliente::class;

    public function definition(): array
    {
        return [
            'nome' => $this->faker->name,
            'cpf' => $this->faker->numerify('###.###.###-##'),
            'data_nascimento' => $this->faker->date('Y-m-d', '-18 years'),
            'sexo' => $this->faker->randomElement(['M', 'F']),
            'cidade_id' => \App\Models\Cidade::inRandomOrder()->first()?->id ?? \App\Models\Cidade::factory(),
        ];
    }
}

