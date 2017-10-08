<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Tag;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use AppBundle\Entity\Article;

class TagController extends Controller
{
    /**
     * @Route("/tag/{name}", name="tag")
     */
    public function simpleArticleAction($name, Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        $tag = $em->getRepository("AppBundle:Tag")->findOneByName($name);

        if(!$tag instanceof Tag){
            throw $this->createNotFoundException('Такой тег не найден');
        }

        return $this->render('article/simpleArticleList.html.twig', array(
            'articles' => $em->getRepository("AppBundle:SimpleArticle")->findArticlesByTag($tag)
        ));
    }
}
