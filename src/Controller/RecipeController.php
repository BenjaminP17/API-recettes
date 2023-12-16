<?php

namespace App\Controller;

use App\Repository\RecipeRepository;
use App\Repository\QuantityRepository;
use App\Repository\IngredientRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;


class RecipeController extends AbstractController
{
    // Route qui renvoi la liste de toute les recettes (titre et description)
    #[Route('/api/recipes', name: 'app_all_recipes', methods: ['GET'])]
    public function getAllRecipe(RecipeRepository $RecipeRepository, SerializerInterface $serializer): JsonResponse
    {
        $recipesList = $RecipeRepository->findAll();
        
        $jsonRecipesList = $serializer->serialize($recipesList, 'json', ['groups'=>'show_recipe']);
        
        return new JsonResponse($jsonRecipesList, Response::HTTP_OK, [], true);
    }

    // Route qui renvoi une recette
    #[Route('/api/recipe/{id}', name: 'app_one_recipe', methods: ['GET'])]
    public function getOneRecipe($id, RecipeRepository $RecipeRepository, IngredientRepository $IngredientRepository, QuantityRepository $QuantityRepository, SerializerInterface $serializer): JsonResponse
    {
        $recipe = $RecipeRepository->find($id);

        $JsonRecipe = $serializer->serialize($recipe,'json', ['groups'=>'details']);

        return new JsonResponse($JsonRecipe, Response::HTTP_OK, [], true);
    }
        
        
}


