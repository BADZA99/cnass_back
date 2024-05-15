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
    public function __construct(
        string $name,
        string $role,
        string $email,
        string $code
    )
    {
        $this->name = $name;
        $this->role = $role;
        $this->email = $email;
        $this->code = $code;
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
            ->greeting('Bonjour ' . $this->name . ', 👋')
            ->line('Nous sommes ravis de vous informer que votre inscription sur Cnass s\'est bien passée.')
            ->line('Votre rôle est : ' . $this->role)
            ->line('Votre email est : ' . $this->email)
            ->line('Votre code est : ' . $this->code)
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
