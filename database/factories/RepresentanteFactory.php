<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Representante>
 */
class RepresentanteFactory extends Factory
{
    public function definition(): array
    {
        $tipo = $this->faker->randomElement(['PF', 'PJ']);

        return [
            'nome'      => $this->faker->name(),
            'tipo'      => $tipo,
            'documento' => $this->faker->numerify('###########'),
            'email'     => $this->faker->unique()->safeEmail(),
            'telefone'  => $this->faker->phoneNumber(),
        ];
    }
}