<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\Users;
use App\Form\UserType;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class MainController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function index()
    {
        return $this->render('main/index.html.twig', [
            
        ]);
    }


     /**
     * @Route("/login", name="login")
     */
    public function login( AuthenticationUtils $autentification)
    {
        return $this->render('main/login.html.twig', [
            'lastUsername' => $autentification->getLastUsername(),
            'error' => $autentification->getLastAuthenticationError(),
        ]);
    }

    /**
     * @Route("/signin", name="signin")
     */
    public function signin( Request $request, ObjectManager $em, UserPasswordEncoderInterface $passwordEncoder )
    {
        $user = new Users();
        $form = $this->createForm( UserType::class, $user );

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {            
            
            $password = $passwordEncoder->encodePassword($user, $user->getPlainPassword());
            $user->setPassword($password);            

            $user->setRoles(['ROLE_USER']);

            $em->persist( $user );
            $em->flush();            

            $this->addFlash(
                'notice',
                'L\'utilisateur "'. $user->getUsername() .'" a bien été ajouté'
            );

            return $this->redirectToRoute('login');
        }
        
        return $this->render('main/signin.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}
