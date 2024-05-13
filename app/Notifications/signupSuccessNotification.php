<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class signupSuccessNotification extends Notification
{
    use Queueable;

    public $name;
    public $role;
    public $email;
    public $code;
    public function __construct()
    {
        // $this->name = $name;
        // $this->role = $role;
        // $this->email = $email;
        // $this->code = $code;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
    public function via(object $notifiable): array
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     */
    public function toMail(object $notifiable): MailMessage
    {
        return (new MailMessage)
            ->subject('Inscription réussie')
            ->greeting('Bonjour, ' . ' 👋')
            ->line('Nous sommes ravis de vous informer que votre inscription sur UD s\'est bien passée.')
            ->line('Votre rôle est : ' )
            ->line('Votre email est : ' )
            ->line('Votre code est : ' )
            // ->action('Visitez notre site', url('/'))
            ->line('Merci d\'avoir choisi notre application!');
    }

    /**
     * Get the array representation of the notification.
     *
     * @return array<string, mixed>
     */
    public function toArray(object $notifiable): array
    {
        return [
            //
        ];
    }
}
