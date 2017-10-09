<?php
namespace AppBundle\Form\DataTransformer;

use AppBundle\Entity\Tag;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Form\DataTransformerInterface;
use Symfony\Component\Form\Exception\TransformationFailedException;
use Doctrine\Common\Collections\ArrayCollection;

class TagsToStringTransformer implements DataTransformerInterface
{
    private $manager;

    public function __construct(ObjectManager $manager)
    {
        $this->manager = $manager;
    }

    /**
    *
    * @param  ArrayCollection $tags
    * @return string
    */
    public function transform($tags)
    {
        if (null === $tags) {
            return '';
        }

        $tagsNamesArray = [];
        foreach($tags as $tag){
            $tagsNamesArray[] = $tag->getName();
        }

        return implode(", ", $tagsNamesArray);
    }

    /**
    * @param  string $tagsString
    * @return ArrayCollection
    */
    public function reverseTransform($tagsString)
    {
        $tagsArray = [];
        $tagsNamesArray = explode(",", $tagsString);
        $tagsNamesArray = array_map("trim", $tagsNamesArray);

        foreach($tagsNamesArray as $tagName){
            if(!$tag = $this->manager->getRepository("AppBundle:Tag")->findOneBy(["name" => $tagName])){
                $tag = new Tag;
                $tag->setName($tagName);
                $this->manager->persist($tag);
            }
            $tagsArray[] = $tag;
        }

        return new ArrayCollection($tagsArray);
    }
}