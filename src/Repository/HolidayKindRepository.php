<?php

namespace App\Repository;

use App\Entity\HolidayKind;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method HolidayKind|null find($id, $lockMode = null, $lockVersion = null)
 * @method HolidayKind|null findOneBy(array $criteria, array $orderBy = null)
 * @method HolidayKind[]    findAll()
 * @method HolidayKind[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class HolidayKindRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, HolidayKind::class);
    }

    // /**
    //  * @return HolidayKind[] Returns an array of HolidayKind objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('h')
            ->andWhere('h.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('h.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?HolidayKind
    {
        return $this->createQueryBuilder('h')
            ->andWhere('h.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
