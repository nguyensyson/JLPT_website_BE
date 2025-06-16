<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Difficulties extends Model
{
    protected $table = 'exam_difficulties';
    protected $primaryKey = 'id';

    public $timestamps = true;

    protected $casts = [
        'deleted_flag' => 'boolean',
    ];

    protected $fillable = [
        'label',
        'description',
        'created_by',
        'updated_by',
        'deleted_flag',
    ];
}
