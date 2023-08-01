<?php

namespace App\Controller;

use App\Form\SearchType;
use App\Repository\EquipementRepository;
use App\Repository\EquipementVoitureRepository;
use App\Repository\VoitureRepository;
use App\Model\Search;
use App\Repository\GallerieImageRepository;
use App\Repository\OptionsRepository;
use App\Repository\OptionVoitureRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;



class GalleriePhotosController extends AbstractController
{
    #[Route('/gallerie/photos', name: 'app_gallerie_photos')]
    public function index(
        Request $request,
        VoitureRepository $voitureRepository,
        GallerieImageRepository $gallerieImageRepository,
        EquipementRepository $equipementRepository,
        EquipementVoitureRepository $equipementVoitureRepository,
        OptionsRepository $optionsRepository,
        OptionVoitureRepository $optionVoitureRepository
    ): Response {
        // Récupération des données nécessaires
        $gallerieImages = $gallerieImageRepository->findAll();
        $equipementVoitures = $equipementVoitureRepository->findAll(); 
        $equipements = $equipementRepository->findAll();
        $options = $optionsRepository->findAll();
        $optionVoitures = $optionVoitureRepository->findAll();
    
        // Création du formulaire de recherche
        $search = new Search();
        $form = $this->createForm(SearchType::class, $search);
        $form->handleRequest($request);
    
        // Variables pour le filtrage des voitures
        $filteredVoitures = [];
        $kmValue = null;
        $prixValue = null;
        $anneeValue = null;
        
        // Traitement du formulaire de recherche
        if ($form->isSubmitted() && $form->isValid()) {
            if ($request->request->has('selectKm')) { //BTN submit KM
                $kmValue = $form->get('km')->getData();
                $filteredVoitures = $voitureRepository->findByCriteria($kmValue, null, null);
            } elseif ($request->request->has('selectPrix')) { //BTN submit prix
                $prixValue = $form->get('prix')->getData();
                $filteredVoitures = $voitureRepository->findByCriteria(null, $prixValue, null);
            } elseif ($request->request->has('selectAnnee')) { //BTN submit Année
                $anneeValue = $form->get('annee')->getData();
                $filteredVoitures = $voitureRepository->findByCriteria(null, null, $anneeValue);
            } elseif ($request->request->has('selectRAZ')) { //BTN submit RAZ
                return $this->redirectToRoute('app_gallerie_photos');
            }
        } else {
            // Aucun filtre spécifié, récupération de toutes les voitures
            $filteredVoitures = $voitureRepository->findAll();
        }
    
        // Vérification de la requête AJAX
        if ($request->isXmlHttpRequest()) {
            // Récupérez les valeurs des sélections depuis la requête AJAX
            $kmValue = $request->request->get('km');
            $prixValue = $request->request->get('prix');
            $anneeValue = $request->request->get('annee');
    
            // filtre les données en fonction des sélections
            $filteredVoitures = $voitureRepository->findByCriteria($kmValue, $prixValue, $anneeValue);
    
            // Retourne une réponse JSON avec les données mises à jour
            return $this->json([
                'voitures' => $filteredVoitures,
            ]);
        }
    
        // Rendu du modèle Twig avec les données récupérées
        return $this->render('gallerie_photos/index.html.twig', [
            'voitures' => $filteredVoitures,
            'gallerieImages' => $gallerieImages,
            'equipements' => $equipements,
            'equipementsVoiture' => $equipementVoitures,
            'options' => $options,
            'optionsVoiture' => $optionVoitures, 
            'form' => $form->createView()
        ]);
    }
}