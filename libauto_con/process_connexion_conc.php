<?php
session_start();
$tgest='gest';
$indexurl='index.php';
$title='Hello!';
include('model_con.php');
include('vue_header.php');
if(isset($_POST['pass']))//si le mdp est dans post tester s'il est bon, sinon aller à la page d'acceuil
{
  $pass=$_POST['pass'];
  $gestionn=new Gestionnaire($usrm,$passm);
  $T=$gestionn->verify_gest('concessionnaire',$pass);
  if($T)
  {
  include('home_page_connecte_conc.php');
  $_SESSION[$tgest]='conc';
  // $trajet=Trajet($usrm,$passm);
  }
  else 
  {
    include('view_false_pass.php');
  }
}
else
{
  header('Location: '. $indexurl . '');
  exit;
}
include('vue_basdepage.php');

  ?>
