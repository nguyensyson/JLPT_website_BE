<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Levels extends Model
{
    protected $table = 'exam_levels';
    protected $primaryKey = 'id';

    public $timestamps = true;

    protected $casts = [
        'deleted_flag' => 'boolean',
    ];

    protected $fillable = [
        'name',
        'created_by',
        'updated_by',
        'deleted_flag',
    ];
}
