<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserNotification extends Model
{
    public function notification()
    {
        return $this->hasone(Notification::class, 'id', 'notification_id');
    }
}
