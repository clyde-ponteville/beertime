<?php
namespace App\Service;

use Doctrine\ORM\EntityManagerInterface;
use App\Repository\EventRepository;
use Symfony\Component\Security\Core\Security;



class EventService{

    private $em;
    private $security;

    public function __construct(EntityManagerInterface $em, Security $security)
    {
        $this->em = $em;
        $this->security = $security;
    }

    public function getAll()
    {        
        return $this->em->getRepository('App:Event')->findAll();      
    }

    public function getById($id)
    {
        return $this->em->getRepository('App:Event')->find($id);
    }

    public function getEvents($value, $sort, $page)
    {            
        return $this->em->getRepository('App:Event')->findByValue($value, $sort, $page);
    }

    public function addEvent($event){

        $user = $this->security->getUser();        
        $event->setOwner($user);

        $this->setupMedia($event);

        $this->em->persist( $event );
        $this->em->flush();
    }

    private function setupMedia($event){
        if (!empty( $event->getPosterUrl() )) {
            return $event->setPoster($event->getPosterUrl());            
        }

        $file = $event->getPosterFile();
        $filename = md5(uniqid()) .'.'. $file->guessExtension();

        $file->move( 'assets/img', $filename );

        return $event->setPoster($filename);
    }
    

}
?>
