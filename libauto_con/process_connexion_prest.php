<?php
session_start();
$tgest='gest';
$indexurl='index.php';
$title='Bonjour Prestataire';
include('model_con.php');
include('vue_header.php');
// $usrm='prestataire';
// $passm='';
// var_dump($_POST);
if(isset($_POST['pass']))
{
  $pass=$_POST['pass'];
  $gestionn=new Gestionnaire($usrm,$passm);
  $T=$gestionn->verify_gest('prestataire',$pass);
  // echo $pass;
  // var_dump($T);
  if($T)
  {
  // echo 'success!';
  include('home_page_connecte_prest.php');
  $_SESSION[$tgest]='prest';
  // $trajet=Trajet($usrm,$passm);
  }
  else {
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
