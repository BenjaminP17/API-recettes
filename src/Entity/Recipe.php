<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use App\Repository\RecipeRepository;
use Symfony\Component\Serializer\Annotation\Groups;

#[ORM\Entity(repositoryClass: RecipeRepository::class)]
class Recipe
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    public ?int $id = null;

    #[ORM\Column(length: 255, unique: true)]
    #[Groups(['show_recipe','details'])]
    public ?string $name = null;

    #[ORM\Column(length: 2083, nullable: true)]
    #[Groups(['show_recipe','details'])]
    public ?string $picture = null;

    #[ORM\Column(type: Types::TEXT)]
    #[Groups(['show_recipe','details'])]
    public ?string $description = null;

    #[ORM\Column(length: 10)]
    #[Groups(['details'])]
    public ?string $cook_time = null;

    #[ORM\Column]
    #[Groups(['details'])]
    public ?int $servings = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE)]
    public ?\DateTimeInterface $created_at = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE)]
    public ?\DateTimeInterface $updated_at = null;

    #[ORM\ManyToMany(targetEntity: Ingredient::class, inversedBy: 'recipes', cascade:['persist'])]
    #[Groups(['details'])]
    public Collection $ingredient;

    #[ORM\ManyToMany(targetEntity: Step::class, inversedBy: 'recipes', cascade:['persist'])]
    #[Groups(['details'])] 
    public Collection $steps;

    // cascade persist permet d'ajouter de la données à une entité reliée à Recipe
    #[ORM\ManyToMany(targetEntity: Category::class, inversedBy: 'recipes', cascade:['persist'])]
    #[Groups(['details'])]
    public Collection $category;

    #[ORM\ManyToMany(targetEntity: User::class, mappedBy: 'recipe')]
    private Collection $users;

    public function __construct()
    {
        $this->ingredient = new ArrayCollection();
        $this->steps = new ArrayCollection();
        $this->category = new ArrayCollection();
        $this->users = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): static
    {
        $this->name = $name;

        return $this;
    }

    public function getPicture(): ?string
    {
        return $this->picture;
    }

    public function setPicture(?string $picture): static
    {
        $this->picture = $picture;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): static
    {
        $this->description = $description;

        return $this;
    }

    public function getCookTime(): ?string
    {
        return $this->cook_time;
    }

    public function setCookTime(string $cook_time): static
    {
        $this->cook_time = $cook_time;

        return $this;
    }

    public function getServings(): ?int
    {
        return $this->servings;
    }

    public function setServings(int $servings): static
    {
        $this->servings = $servings;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->created_at;
    }

    public function setCreatedAt(\DateTimeInterface $created_at): static
    {
        $this->created_at = $created_at;

        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeInterface
    {
        return $this->updated_at;
    }

    public function setUpdatedAt(\DateTimeInterface $updated_at): static
    {
        $this->updated_at = $updated_at;

        return $this;
    }

    /**
     * @return Collection<int, Ingredient>
     */
    public function getIngredient(): Collection
    {
        return $this->ingredient;
    }

    public function addIngredient(Ingredient $ingredient): static
    {
        if (!$this->ingredient->contains($ingredient)) {
            $this->ingredient->add($ingredient);
        }

        return $this;
    }

    public function removeIngredient(Ingredient $ingredient): static
    {
        $this->ingredient->removeElement($ingredient);

        return $this;
    }

    /**
     * @return Collection<int, Step>
     */
    public function getSteps(): Collection
    {
        return $this->steps;
    }

    public function addStep(Step $step): static
    {
        if (!$this->steps->contains($step)) {
            $this->steps->add($step);
        }

        return $this;
    }

    public function removeStep(Step $step): static
    {
        $this->steps->removeElement($step);

        return $this;
    }

    /**
     * @return Collection<int, Category>
     */
    public function getCategory(): Collection
    {
        return $this->category;
    }

    public function addCategory(Category $category): static
    {
        if (!$this->category->contains($category)) {
            $this->category->add($category);
        }

        return $this;
    }

    public function removeCategory(Category $category): static
    {
        $this->category->removeElement($category);

        return $this;
    }

    /**
     * @return Collection<int, User>
     */
    public function getUsers(): Collection
    {
        return $this->users;
    }

    public function addUser(User $user): static
    {
        if (!$this->users->contains($user)) {
            $this->users->add($user);
            $user->addRecipe($this);
        }

        return $this;
    }

    public function removeUser(User $user): static
    {
        if ($this->users->removeElement($user)) {
            $user->removeRecipe($this);
        }

        return $this;
    }
}
    
