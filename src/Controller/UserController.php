<?php

namespace App\Controller;

use App\Entity\User;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class UserController extends AbstractController
{
    #[Route('/api/user/register', name: 'user_register', methods:'POST')]
    public function register(Request $request,
    UserPasswordHasherInterface $passwordHasher,
    EntityManagerInterface $em, UserRepository $userRepository): JsonResponse
    {
        $user = new User();

        $data = json_decode($request->getContent(), true);

        $email = $data['mail'];
        $password = $data['password'];
        $nickname = $data['nickname'];

        $hashedPassword = $passwordHasher->hashPassword(
            $user,
            $password
        );

        $user->setEmail($email);
        $user->setPassword($hashedPassword);
        $user->setNickname($nickname);

        $em->persist($user);
        $em->flush();

        return new JsonResponse($user, Response::HTTP_CREATED, [], true);
    }
}
