<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
* @ORM\Entity
* @ORM\Table(
*     name="author_article"
* )
*/
class AuthorArticle extends BaseArticle
{
    /**
     * @ORM\Column(type="string", length=255)
     */
    protected $author;

    /**
     * @ORM\Column(type="string", length=255)
     */
    protected $link;

    /**
     * Set author
     *
     * @param string $author
     * @return AuthorArticle
     */
    public function setAuthor($author)
    {
        $this->author = $author;

        return $this;
    }

    /**
     * Get author
     *
     * @return string 
     */
    public function getAuthor()
    {
        return $this->author;
    }

    /**
     * Set link
     *
     * @param string $link
     * @return AuthorArticle
     */
    public function setLink($link)
    {
        $this->link = $link;

        return $this;
    }

    /**
     * Get link
     *
     * @return string 
     */
    public function getLink()
    {
        return $this->link;
    }

    /**
     * Set publishAt
     *
     * @param \DateTime $publishAt
     * @return AuthorArticle
     */
    public function setPublishAt($publishAt)
    {
        $this->publishAt = $publishAt;

        return $this;
    }

    /**
     * Get publishAt
     *
     * @return \DateTime 
     */
    public function getPublishAt()
    {
        return $this->publishAt;
    }
}
