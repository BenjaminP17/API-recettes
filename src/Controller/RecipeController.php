<?php

namespace App\Controller;

use App\Repository\RecipeRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

// Route qui renvoi la liste de toutes les recettes (titre et description)

class RecipeController extends AbstractController
{
    #[Route('/api/recipes', name: 'app_recipe', methods: ['GET'])]
    public function getAllRecipe(RecipeRepository $RecipeRepository, SerializerInterface $serializer): JsonResponse
    {
        $recipesList = $RecipeRepository->findall();

        $jsonRecipesList = $serializer->serialize($recipesList, 'json');

        return new JsonResponse([$jsonRecipesList, Response::HTTP_OK, [], true]);
    }
}
