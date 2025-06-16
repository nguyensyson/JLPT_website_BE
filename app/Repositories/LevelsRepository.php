<?php

namespace App\Repositories;

use App\Models\Levels;

class LevelRepository
{
    
    public function getAll()
    {
        return Levels::where('deleted_flag', false)
                        ->select('id', 'name')
                        ->get();
    }
}
