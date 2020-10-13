<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class HolidayCheckController extends AbstractController
{
    /**
     * @Route("/holiday/check", name="holiday_check")
     */
    public function index()
    {
        $em = $this->getDoctrine()->getManager();
        $employeeRepo = $em->getRepository('App:Employee');
        $tabEmployees = $employeeRepo->findAll();

        return $this->render('holiday_check/index.html.twig', [
            'controller_name' => 'HolidayCheckController',
            'employees' => $tabEmployees
        ]);
    }
}
