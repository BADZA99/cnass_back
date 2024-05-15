<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class CreationFicheMedecalReussiNotification extends Notification
{
    use Queueable;

    /**
     * Create a new notification instance.
     */
    // cree les variable taille,poids,tension et description
    public $nom;
    public $prenom;
    public $taille;
    public $poids;
    public $tension;
    public $description;


    public function __construct(
        $nom,
        $prenom,
        $taille,
        $poids,
        $tension,
        $description
    )
    {
        //
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->taille = $taille;
        $this->poids = $poids;
        $this->tension = $tension;
        $this->description = $description;
        
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
        ->line('Bonjour '.$this->nom.' '.$this->prenom)
            ->line('Votre fiche médicale a été créée avec succès.')
            ->line('Voici les détails de votre fiche médicale:')
            ->line('Taille: ' . $this->taille.'cm')
            ->line('Poids: ' . $this->poids.'Kg')
            ->line('Tension: ' . $this->tension. 'mmHg')
            ->line('Description: ' . $this->description)
            ->line('Vous pouvez consulter votre fiche médicale en vous connectant à notre application.')
            ->action('Accéder à l\'application', url('/'))
            ->line('Merci d\'utiliser notre application!');
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
