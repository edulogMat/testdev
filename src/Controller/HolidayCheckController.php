<?php

namespace App\Controller;

use App\Entity\Holiday;
use App\Form\CheckHolidayType;
use App\Repository\HolidayRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HolidayCheckController extends AbstractController
{
    /**
     * @Route("/holiday/check", name="holiday_check")
     * @param Request $request
     * @param HolidayRepository $holidayRepository
     * @return Response
     */
    public function index(Request $request, HolidayRepository $holidayRepository):Response
    {
        $em = $this->getDoctrine()->getManager();
        $employeeRepo = $em->getRepository('App:Employee');
        $tabEmployees = $employeeRepo->findAll();

        $form = $this->createForm(CheckHolidayType::class);
        $form->handleRequest($request);


        if ($form->isSubmitted() && $form->isValid()){
            $data = $form->getData();
            if ($data === null) {
                $results = null;
            } else {
                $holiday = $this->getDoctrine()->getRepository(Holiday::class)->findBy(['startDate'=>$data]);
                if ($holiday === null){
                    $results = null;
                } else {
                    $results = $holiday->getEmployee();
                }
            }
        } else {
            $results = null;
        }

        return $this->render('holiday_check/index.html.twig', [
            'controller_name' => 'HolidayCheckController',
            'employees' => $tabEmployees,
            'results' => $results,
            'form' => $form->createView()
        ]);
    }
}
