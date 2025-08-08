<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Cuenta extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'nombre_cuenta',
        'handle_instagram',
        'logo_url',
    ];

    /**
     * Get the posts for the Instagram account.
     */
    public function posts(): HasMany
    {
        return $this->hasMany(Post::class);
    }
}