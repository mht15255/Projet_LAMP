<?php
/**
 * Classe de des fonctionnalité utilisé par les abonnés
 *
 * Elle comporte plusieurs fonctions : construct, verify_abonne, get_abonne, add_abonne, uptade_abonne, redirect, logout
 *
 * world
 *
 */
class Facture
{
  public $mysqli;

  function __construct()
    {
      $this->mysqli=new mysqli('localhost','root','','libautodb');
    }
    
  /**
  * get_facture
  * affiche les factures de l'abonne à partir d'une vue de la base de donnée
  *
  * @param $NB_BADGE
  * @return $posts
  */
  function get_facture($NB_BADGE)
    {$i=0;
      $posts=array();
      $result=$this->mysqli->query('SELECT  * FROM facture_tp where NB_BADGE = ' . $NB_BADGE . ';');
      while($row=$result->fetch_array())
      {
          $posts[$row['ID_TP']]=$row;
          $i++;
      }
      return $posts;
    }
}
?>
