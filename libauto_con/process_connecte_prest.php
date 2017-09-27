<?php
session_start();
$tgest='gest';
$indexurl='index.php';
$title='Hello!';
include('vue_header.php');
include('model_con.php');
if(isset($_SESSION[$tgest]))//si l'un des utilisateur est connecté
{
  if($_SESSION[$tgest]!='prest')//si prestataire n'est pas connecté aller à la page d'acceuil, sinon continuer
  {
    header('Location: '. $indexurl . '');//
  }
}
else//si la session ne contient pas $tgest aller à la page d'acceuil
{
    header('Location: '. $indexurl . '');//
}
if(isset($_GET['action']))
{
  if($_GET['action']=='logout')
  {
    // var_dump($_SESSION);
    session_unset();
    session_destroy();
     header('Location: '. $indexurl . '');
    exit;
  }
  elseif($_GET['action']=='bilan')
  {
    include ('vue_bilan_pres.php');
  }
else 
{
     header('Location: '. $indexurl . '');
  exit;
      }
}
include('vue_basdepage.php');
  ?>
