<?php

namespace App\Entity;

use App\Repository\HolidayRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=HolidayRepository::class)
 */
class Holiday
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=Employee::class, inversedBy="holidays")
     * @ORM\JoinColumn(nullable=false)
     */
    private $employee;

    /**
     * @ORM\Column(type="date")
     */
    private $startDate;

    /**
     * @ORM\Column(type="date")
     */
    private $endDate;

    /**
     * @ORM\ManyToOne(targetEntity=HolidayKind::class)
     * @ORM\JoinColumn(nullable=false)
     */
    private $kind;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmployee(): ?Employee
    {
        return $this->employee;
    }

    public function setEmployee(?Employee $employee): self
    {
        $this->employee = $employee;

        return $this;
    }

    public function getStartDate(): ?\DateTimeInterface
    {
        return $this->startDate;
    }

    public function setStartDate(\DateTimeInterface $startDate): self
    {
        $this->startDate = $startDate;

        return $this;
    }

    public function getEndDate(): ?\DateTimeInterface
    {
        return $this->endDate;
    }

    public function setEndDate(\DateTimeInterface $endDate): self
    {
        $this->endDate = $endDate;

        return $this;
    }

    public function getKind(): ?HolidayKind
    {
        return $this->kind;
    }

    public function setKind(?HolidayKind $kind): self
    {
        $this->kind = $kind;

        return $this;
    }
}
