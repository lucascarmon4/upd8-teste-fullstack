<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\Cidade;

class CidadeSeeder extends Seeder
{
    public function run(): void
    {
        Cidade::factory()->count(30)->create();
    }
}

