<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use App\Service\EventService;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Entity\Event;
use App\Form\EventType;
use App\Entity\Users;
use Doctrine\Common\Persistence\ObjectManager;

class EventsController extends AbstractController
{

    private $numPrec;
    private $numSuiv;
    private $max;


    /**
     * @Route("/event", name="eventList")
     */
    public function eventList(EventService $events, Request $request)
    {   
        $value = $request->query->get('search');        
        $sort = $request->query->get('sort') == null ? 'startDate': $request->query->get('sort');
        $page = $request->query->get('page') == null ? '1' : $request->query->get('page');

        $this->numPrec = $page - 1;
        $this->numSuiv = $page + 1;
        $this->max = ceil(count($events->getAll()) / 6);


        return $this->render('events/eventList.html.twig', [             
            'events' => $events->getEvents($value, $sort, $page),
            'page' => $page,
            'numPrec' => $this->numPrec,
            'numSuiv' => $this->numSuiv,
            'max' => $this->max
        ]);
        
    }

    
    /**
     * @Route("/event/{id}", name="eventSolo", requirements={"id"="\d+"})
     */
    public function eventSolo(EventService $events, $id )
    {
        return $this->render('events/eventSolo.html.twig', [                    
            'event' => $events->getById($id),
        ]);       
        
    }

    /**
     * @Route("/event/add", name="eventAdd")
     * 
     */
    public function eventAdd(Request $request, ObjectManager $em, EventService $eventService)
    {
        $event = new Event();
        $event->setStartDate( new \DateTime() );   
        $form = $this->createForm( EventType::class, $event );

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {

            if ($this->getUser()) {
                $eventService->addEvent($event);            
    
                $this->addFlash(
                    'notice',
                    'L\'événement "'. $event->getName() .'" a bien été ajouté'
                );
    
                return $this->redirectToRoute('eventList');
            }
            
        }
        
        return $this->render('events/eventAdd.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/event/{id}/join", name="eventJoin", requirements={"id"="\d+"})
     */
    public function eventJoin( $id )
    {
        return $this->render('events/eventJoin.html.twig', [
            'controller_name' => 'EventsController',
        ]);
    }
}
