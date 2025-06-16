<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Years extends Model
{
    protected $table = 'exam_years';
    protected $primaryKey = 'id';

    public $timestamps = true;

    protected $casts = [
        'year' => 'integer',
        'deleted_flag' => 'boolean',
    ];

    protected $fillable = [
        'year',
        'created_by',
        'updated_by',
        'deleted_flag',
    ];
}
