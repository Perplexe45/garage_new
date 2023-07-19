<?php

namespace App\Entity;

use App\Repository\EvocationRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: EvocationRepository::class)]
class Evocation
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $nom = null;

    #[ORM\Column(nullable: true)]
    private ?float $prix = null;

    #[ORM\ManyToOne(inversedBy: 'evocations')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Service $IDservice = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): self
    {
        $this->nom = $nom;

        return $this;
    }

    public function getPrix(): ?float
    {
        return $this->prix;
    }

    public function setPrix(?float $prix): self
    {
        $this->prix = $prix;

        return $this;
    }

    public function getIDservice(): ?Service
    {
        return $this->IDservice;
    }

    public function setIDservice(?Service $IDservice): self
    {
        $this->IDservice = $IDservice;

        return $this;
    }
}
