<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('ecom_admin_user', function (Blueprint $table) {
            $table->string('otp_code')->nullable(); 
        });
    }

    public function down()
    {
        Schema::table('ecom_admin_user', function (Blueprint $table) {
            $table->dropColumn('otp_code'); 
        });
    }
};
