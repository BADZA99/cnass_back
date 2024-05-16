<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class SuppressionPatientReussiNotification extends Notification
{
    use Queueable;

    /**
     * Create a new notification instance.
     */
    public $nom;
    public $prenom;
    public function __construct(
        string $nom,
        string $prenom

    )
    {

        $this->prenom = $prenom;
        $this->nom = $nom;

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
        ->subject('Suppression de votre compte réussie')
        ->greeting('Bonjour ' . $this->nom . ' ' . $this->prenom . ', 👋')
        ->line('Nous vous informons que votre compte a été supprimé avec succès de nos serveurs.')
        ->line('Toutes vos informations ont également été supprimées conformément à nos politiques de confidentialité et de protection des données.')
        ->line('Si vous avez des questions ou besoin d\'aide, n\'hésitez pas à nous contacter par email au contactUd@gmail.com.')
        ->line('Merci d\'avoir utilisé notre application.');
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
