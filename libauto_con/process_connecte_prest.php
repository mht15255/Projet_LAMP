<?php
session_start();
$indexurl='index.php';
// $usrm='prestataire';
// $passm='';
$title='Hello!';
include('vue_header.php');
include('model_con.php');
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
else {
     header('Location: '. $indexurl . '');
  exit;
      }
}
include('vue_basdepage.php');
  ?>
