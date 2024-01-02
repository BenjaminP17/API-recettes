<?php

namespace App\Entity;

use App\Repository\IngredientRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

#[ORM\Entity(repositoryClass: IngredientRepository::class)]
class Ingredient
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255, unique: true)]
    #[Groups(['details'])]
    private ?string $name = null;

    #[ORM\ManyToMany(targetEntity: Recipe::class, mappedBy: 'ingredient')]
    private Collection $recipes;

    #[ORM\ManyToMany(targetEntity: Quantity::class, inversedBy: 'ingredients', cascade:['persist'])]
    #[Groups(['details'])]
    private Collection $quantity;

    public function __construct()
    {
        $this->recipes = new ArrayCollection();
        $this->quantity = new ArrayCollection();
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

    /**
     * @return Collection<int, Recipe>
     */
    public function getRecipes(): Collection
    {
        return $this->recipes;
    }

    public function addRecipe(Recipe $recipe): static
    {
        if (!$this->recipes->contains($recipe)) {
            $this->recipes->add($recipe);
            $recipe->addIngredient($this);
        }

        return $this;
    }

    public function removeRecipe(Recipe $recipe): static
    {
        if ($this->recipes->removeElement($recipe)) {
            $recipe->removeIngredient($this);
        }

        return $this;
    }

    /**
     * @return Collection<int, Quantity>
     */
    public function getQuantity(): Collection
    {
        return $this->quantity;
    }

    public function addQuantity(Quantity $quantity): static
    {
        if (!$this->quantity->contains($quantity)) {
            $this->quantity->add($quantity);
        }

        return $this;
    }

    public function removeQuantity(Quantity $quantity): static
    {
        $this->quantity->removeElement($quantity);

        return $this;
    }
}
