<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints\DateTime;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\HttpFoundation\File\File;

/**
 * @ORM\Entity(repositoryClass="App\Repository\EventRepository")
 */
class Event
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Place", inversedBy="events")
     * @ORM\JoinColumn(nullable=false)
     * @Assert\NotBlank(message = "Veuillez saisir un lieu")
     */
    private $place;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\NotBlank(message = "Veuillez saisir un titre")
     * @Assert\Length(
     *      min = 3,     
     *      minMessage = "Votre titre doit faire au moins {{ limit }} characters",  
     * )
     */
    private $name;

    /**
     * @ORM\Column(type="datetime")
     */
    private $createdDate;

    /**
     * @ORM\Column(type="datetime")
     * @Assert\NotBlank(message = "Veuillez saisir une date de début")
     * @Assert\GreaterThanOrEqual(
     *      "today",
     *       message = "Votre date doit être dans le future",
     * )
     */
    private $startDate;

    /**
     * @ORM\Column(type="datetime")
     * @Assert\NotBlank(message = "Veuillez saisir une date de fin")
     * @Assert\GreaterThan(
     *       propertyPath = "startDate",
     *       message = "La fin de l'événement ne peut être avant le début de l'événement"
     * )
     */
    private $endDate;

    /**
     * @ORM\Column(type="text")
     * @Assert\NotBlank(message = "Veuillez saisir une description")
     */
    private $description;

    /**
     * @ORM\Column(type="float", nullable=true)
     * @Assert\Type(
     *     type = "numeric",
     *     message = "Le prix {{ value }} n'est pas valide"
     * )
     */
    private $price;

    /**
     * @ORM\Column(type="text")
     */
    private $poster;

    /**
     * @Assert\Url(
     *    message = "L'url '{{ value }}' n'est pas valide",
     * )
    */
    private $posterUrl;

    /**
     * @Assert\Expression(
     *     "this.getPosterUrl() or this.getPosterFile()",
     *      message="Vous devez saisir une URL ou charger une image"
     * )
     * @Assert\Image(
     *     maxSize = "2048k",   
     *     mimeTypesMessage = "Please upload a valid image"
     * )
     */
    private $posterFile;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\Categories", inversedBy="events")
     * @Assert\NotBlank(message = "Veuillez saisir au minimum une catégories")
    
     */
    private $categories;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Users", inversedBy="events")
     * @ORM\JoinColumn(nullable=false)     
     */
    private $owner;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Participation", mappedBy="event", orphanRemoval=true)
     */
    private $participations;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Comment", mappedBy="event")
     */
    private $comments;


    public function __construct()
    {
        $this->categories = new ArrayCollection();
        $this->participations = new ArrayCollection();
        $this->comments = new ArrayCollection();        
        $this->createdDate = new \DateTime('now');     
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPlace(): ?Place
    {
        return $this->place;
    }

    public function setPlace(?Place $place): self
    {
        $this->place = $place;

        return $this;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getCreatedDate(): ?\DateTimeInterface
    {
        return $this->createdDate;
    }

    public function setCreatedDate(): self
    {
        // $this->createdDate = $createdDate;

        return $this;
    }

    public function getStartDate(): ?\DateTimeInterface
    {
        return $this->startDate;
    }

    public function setStartDate(?\DateTimeInterface $startDate): self
    {
        $this->startDate = $startDate ;

        return $this;
    }

    public function getEndDate(): ?\DateTimeInterface
    {
        return $this->endDate;
    }

    public function setEndDate(?\DateTimeInterface $endDate): self  // ? <= si DateTimeInterface ok sinon autre 
    {
        $this->endDate = $endDate;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getPrice(): ?float
    {
        return $this->price;
    }

    public function setPrice(float $price): self
    {
        $this->price = $price;

        return $this;
    }

    public function getPoster(): ?string
    {
        return $this->poster;
    }

    public function setPoster(string $poster): self
    {
        $this->poster = $poster;

        return $this;
    }

    /**
     * @return Collection|Categories[]
     */
    public function getCategories(): Collection
    {
        return $this->categories;
    }

    public function addCategory(Categories $category): self
    {
        if (!$this->categories->contains($category)) {
            $this->categories[] = $category;
        }

        return $this;
    }

    public function removeCategory(Categories $category): self
    {
        if ($this->categories->contains($category)) {
            $this->categories->removeElement($category);
        }

        return $this;
    }

    public function getOwner(): ?Users
    {
        return $this->owner;
    }

    public function setOwner(?Users $owner): self
    {
        $this->owner = $owner;

        return $this;
    }

    /**
     * @return Collection|Participation[]
     */
    public function getParticipations(): Collection
    {
        return $this->participations;
    }

    public function addParticipation(Participation $participation): self
    {
        if (!$this->participations->contains($participation)) {
            $this->participations[] = $participation;
            $participation->setEvent($this);
        }

        return $this;
    }

    public function removeParticipation(Participation $participation): self
    {
        if ($this->participations->contains($participation)) {
            $this->participations->removeElement($participation);
            // set the owning side to null (unless already changed)
            if ($participation->getEvent() === $this) {
                $participation->setEvent(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Comment[]
     */
    public function getComments(): Collection
    {
        return $this->comments;
    }

    public function addComment(Comment $comment): self
    {
        if (!$this->comments->contains($comment)) {
            $this->comments[] = $comment;
            $comment->setEvent($this);
        }

        return $this;
    }

    public function removeComment(Comment $comment): self
    {
        if ($this->comments->contains($comment)) {
            $this->comments->removeElement($comment);
            // set the owning side to null (unless already changed)
            if ($comment->getEvent() === $this) {
                $comment->setEvent(null);
            }
        }

        return $this;
    }

    

    
    public function getPosterUrl()
    {
        return $this->posterUrl;
    }

    
    public function setPosterUrl($posterUrl)
    {
        $this->posterUrl = $posterUrl;

        return $this;
    }

    public function getPosterFile()
    {
        return $this->posterFile;
    }

    public function setPosterFile($posterFile)
    {
        $this->posterFile = $posterFile;

        return $this;
    }
}
