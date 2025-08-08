<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
// database/migrations/xxxx_xx_xx_xxxxxx_create_posts_table.php

    public function up(): void
    {
        Schema::create('posts', function (Blueprint $table) {
            $table->id();
            $table->foreignId('cuenta_id')->constrained()->onDelete('cascade');
            $table->string('instagram_id')->unique();
            $table->enum('type', ['Video', 'Image', 'Sidecar']);
            $table->text('caption');
            $table->string('url');
            $table->unsignedInteger('comments_count');
            $table->unsignedInteger('likes_count');
            $table->unsignedInteger('video_play_count')->default(0);
            $table->string('display_url', 1024);
            $table->json('images')->nullable();
            $table->timestamp('published_at');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('posts');
    }
};
