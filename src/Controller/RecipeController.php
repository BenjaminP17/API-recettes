<?php

namespace App\Controller;

use App\Entity\Recipe;
use App\Repository\RecipeRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class RecipeController extends AbstractController
{
    // Route qui renvoi la liste de toute les recettes (titre et description)
    #[Route('/api/recipes', name: 'all_recipes', methods: ['GET'])]
    public function getAllRecipe(RecipeRepository $RecipeRepository, SerializerInterface $serializer): JsonResponse
    {
        $recipesList = $RecipeRepository->findAll();
        
        $jsonRecipesList = $serializer->serialize($recipesList, 'json', ['groups'=>'show_recipe']);
        
        return new JsonResponse($jsonRecipesList, Response::HTTP_OK, [], true);
    }

    // Route qui renvoi une recette
    #[Route('/api/recipe/{id}', name: 'one_recipe', methods: ['GET'])]
    public function getOneRecipe($id, RecipeRepository $RecipeRepository, SerializerInterface $serializer): JsonResponse
    {
        $recipe = $RecipeRepository->find($id);

        $JsonRecipe = $serializer->serialize($recipe,'json', ['groups'=>'details']);

        return new JsonResponse($JsonRecipe, Response::HTTP_OK, [], true);
    }

    // Route pour créer une nouvelle recette.
    #[Route('/api/create', name: 'create_recipe', methods: ['POST'])]
    public function createRecipe(Request $Request, EntityManagerInterface $em, SerializerInterface $serializer): JsonResponse
    {
        //!! TODO Gérer données "unique" sur category et ingredient
        $recipe = $serializer->deserialize($Request->getContent(), Recipe::class, 'json');
        
        $em->persist($recipe);
        $em->flush();

        $jsonRecipe = $serializer->serialize($recipe, 'json', ['groups'=>'details']);

        return new JsonResponse($jsonRecipe, Response::HTTP_CREATED, [], true);
    }

    
        
        
}


