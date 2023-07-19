<?php

namespace App\Controller;

use App\Entity\Employe;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class LoginPersonnelController extends AbstractController
{
    
    #[Route(path: '/connexion', name: 'app_connexion')]
   
    public function login(AuthenticationUtils $authenticationUtils): Response
    {
        // get the login error if there is one
        $error = $authenticationUtils->getLastAuthenticationError();
        // last username entered by the user
        $lastUsername = $authenticationUtils->getLastUsername();
         return $this->render('security/loginEmploye.html.twig', ['last_username' => $lastUsername, 'error' => $error]);
    }

    #[Route(path: '/deconnexion', name: 'app_deconnexion')]
    public function logout(Security $security,SessionInterface $session): RedirectResponse
    {
        // On remet le booléen à false pour que l'employé ne devienne pas administrateur
        $employe = $security->getUser();
        if ($employe instanceof Employe) {
            $session->set('isAdmin', false);
        }

        //throw new \LogicException('This method can be blank - it will be intercepted by the logout key on your firewall.');
        return $this->redirectToRoute('home');
    }
}
