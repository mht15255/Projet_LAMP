<?php
session_start();
$tgest='gest';
$indexurl='index.php';
$title='Bonjour Concessionnaire';
include('model_con.php');
include('vue_header.php');
// $usrm='prestataire';
// $passm='';
// $usrm='root';
// $passm='';
// var_dump($_POST);
if(isset($_POST['pass']))
{
  $pass=$_POST['pass'];
  $gestionn=new Gestionnaire($usrm,$passm);
  $T=$gestionn->verify_gest('consessionnaire',$pass);
  // echo $pass;
  // var_dump($T);
  if($T)
  {
  // echo 'success!';
  include('home_page_connecte_conc.php');
  $_SESSION[$tgest]='conc';
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
