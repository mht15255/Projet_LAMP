<?php
session_start();
$indexurl='index.php';
//url à appeler seulement avec la variable 'action' passée dans l'url, sinon il ira à la page d'acceuil
// $usrm='prestataire';
// $passm='';
$usrm='root';
$passm='';
$tgest='gest';
$title='Hello BDD!';
$indexurl='index.php';
include('vue_header.php');
include('model_con.php');
if(isset($_SESSION[$tgest]))//si l'un des utilisateur est connecté
{
  if($_SESSION[$tgest]!='conc')//si concessionnaire n'est pas connecté aller à la page d'acceuil, sinon continuer
  {
    header('Location: '. $indexurl . '');//
  }
}
else//si la session ne contient pas $tgest aller à la page d'acceuil
{
    header('Location: '. $indexurl . '');//
}
if(isset($_GET['action']))// si $GET_['action'] exist
{
  if($_GET['action']=='logout')// si l'action est logout, deconnecter et aller à la page d'acceuil
  {
    session_unset();
    session_destroy();
     header('Location: '. $indexurl . '');
    exit;
  }
  elseif($_GET['action']=='bilan')// si l'action est Bilan, mettre la table vue_bilan_conc qui contient le bilan de traffic dans le corps

  {
    include ('vue_bilan_conc.php');
  }
else //si action n'est ni login ni bilan, aller à la page d'acceuil
{
     header('Location: '. $indexurl . '');
  exit;
}
}
else// si $GET_['action'] n'existe pas, aller à la page d'acceuil
{
  header('Location: '. $indexurl . '');
  exit;
}
include('vue_basdepage.php');// bas de page à la fin
  ?>
