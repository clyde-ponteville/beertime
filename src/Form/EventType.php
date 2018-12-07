<?php

namespace App\Form;

use App\Entity\Event;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Tests\Fixtures\Entity;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
// pour pouvoir ajouter une nouvelle option
// use Symfony\Component\Form\FormTypeInterface;
// use Symfony\Component\Form\FormView;
// use Symfony\Component\Form\FormInterface;
// use Symfony\Component\Form\ChoiceList\View\ChoiceView;
use App\Entity\Place;
use App\Entity\Categories;
use App\Entity\Users;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\MoneyType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\FileType;

class EventType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name', null, array(
                'label' => 'Titre de l\'événement',
                'attr' => array('minlength' => 3)
            ))
            ->add('startDate', DateTimeType::class, array(
                'label' => 'Date de début',
                'widget' => 'single_text',                
            ))
            ->add('endDate', DateTimeType::class, array(
                'label' => 'Date de fin',
                'widget' => 'single_text',    
            ))
            ->add('description', TextareaType::class, array( 'attr' => array('rows' => '5')))
            ->add('price', MoneyType::class, array(
                'label' => 'Prix',
                'invalid_message' => 'Le prix n\'est pas valide',                              
            ))
            // ->add('poster', TextareaType::class, array( 'attr' => array('rows' => '2')))
            ->add('posterFile', FileType::class)
            ->add('posterUrl')
            ->add('place', EntityType::class, array(
                'label' => 'Lieu de l\'événements',                
                'class' => Place::class,                
                'choice_label' => 'name',                
                
                ))
            ->add('categories', null, array(
                'label' => 'Catégories',   
                'class' => Categories::class,
                'choice_label' => 'name',
                'multiple' => true
                ))            
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Event::class,
        ]);
    }

    //ajouter une option entityType
    // public function finishView(FormView $view, FormInterface $form, array $options)
    // {
    //     $newChoice = new ChoiceView(array(), 'add', 'Saisir un lieu'); // <- new option
    //     $view->children['place']->vars['choices'][] = $newChoice;//<- adding the new option 
    // }
}
