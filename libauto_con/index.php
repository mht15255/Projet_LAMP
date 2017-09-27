<?php
$indexurl='index.php';
/**
 * Ce fichier "index.php" est la page d'acceuilde l'application libauto_con. il inclut (toujours) le fichier vue de l'entête vue_header.php au début de la page,
 * et le vue de bas du page vue_basdepage.php
 *
 **/
session_start();
$tgest='gest';
include('vue_header.php');//vue header, conitent le logo cliquable pour retourner à la page d'acceuil

if(isset($_SESSION[$tgest]))//si l'un des utilisateur est connecté
{
  if ($_SESSION[$tgest]=='conc')//si concessionnaire est connecté
  {
    include ('home_page_connecte_conc.php');//afficher la page du concessionnaire: home_page_connecte_conc.php, qui lui offre des fonctionnalité consacrés à lui
  }
  elseif($_SESSION[$tgest]=='prest')//si prestataire est connecté
  {
    include ('home_page_connecte_prest.php');//afficher la page du prestataire: home_page_connecte_conc.php, qui lui offre des fonctionnalité consacrés à lui
  }
  else//cette condition ne doit pas être satisfaite dans une utilisation standard de la base, le cas échéant, détruire les variables sessions et retourner à la page d'acceuil
  {
    session_unset();
    session_destroy();
    header('Location: '. $indexurl . '');
  }
}
else//si aucun des utilisateur n'est connecté, afficher la page d'acceuil déconnectée
{
include('home_page_deconnecte.php');
}



include('vue_basdepage.php');//vue footer, conitent les informations de contact


?>
