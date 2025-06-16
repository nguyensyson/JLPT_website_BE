<?php

namespace App\Repositories;

use App\Models\Years;

class YearsRepository
{
    
    public function getAll()
    {
        return Years::where('deleted_flag', false)
                        ->select('id', 'year')
                        ->get();
    }
}
