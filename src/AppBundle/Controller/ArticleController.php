<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use AppBundle\Entity\Article;

class ArticleController extends Controller
{
    /**
     * @Route("/simple_articles", name="simple_articles")
     */
    public function simpleArticleAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        return $this->render('article/simpleArticleList.html.twig', array(
            'articles' => $em->getRepository("AppBundle:SimpleArticle")->findAll()
        ));
    }

    /**
     * @Route("/author_articles", name="author_articles")
     */
    public function authorArticleAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        return $this->render('article/authorArticleList.html.twig', array(
            'articles' => $em->getRepository("AppBundle:AuthorArticle")->findAll()
        ));
    }

    /**
     * @Route("/article/{slug}", name="article")
     */
    public function articleAction($slug, Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        if($article = $em->getRepository("AppBundle:BaseArticle")->findOneBy(["slug" => $slug])){
            return $this->render('article/simpleArticle.html.twig', array(
                'article' => $article
            ));
        }elseif($article = $em->getRepository("AppBundle:AuthorArticle")->findOneBy(["slug" => $slug])){
            return $this->render('article/authorArticle.html.twig', array(
                'article' => $article
            ));
        }
        else{
            throw $this->createNotFoundException('Статья не найдена');
        }

    }
}
