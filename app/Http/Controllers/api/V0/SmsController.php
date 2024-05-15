<?php

namespace App\Http\Controllers\api\v0;

use App\Http\Controllers\Controller;
use App\Models\Patient;
use Illuminate\Http\Request;

class SmsController extends Controller
{
    public function SendSms(){
        $basic  = new \Vonage\Client\Credentials\Basic("3e2c6303", "ey76dyPGm8tdkHDQ");
        $client = new \Vonage\Client($basic);

        $response = $client->sms()->send(
            new \Vonage\SMS\Message\SMS("221774327640", 'CnassApp', 'A text message sent using the Nexmo SMS API')
        );

        $message = $response->current();

        if ($message->getStatus() == 0) {
            echo "The message was sent successfully\n";
        } else {
            echo "The message failed with status: " . $message->getStatus() . "\n";
        }
    }

}











?>