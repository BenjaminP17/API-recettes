<?php

namespace App\Controller;

use App\Repository\RecipeRepository;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;


class RecipeController extends AbstractController
{
    #[Route('/api/recipes', name: 'app_recipe', methods: ['GET'])]
    public function getAllRecipe(RecipeRepository $RecipeRepository, SerializerInterface $serializer): JsonResponse
    {
        $recipesList = $RecipeRepository->findall();
        return new JsonResponse([
            'recipes' => $recipesList,
            
        ]);
    }
}
