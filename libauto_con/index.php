<?php
session_start();
$tgest='gest';
include('vue_header.php');

if(isset($_SESSION[$tgest]))
{
  if ($_SESSION[$tgest]=='conc')
  {
    include ('home_page_connecte_conc.php');
  }
  elseif($_SESSION[$tgest]=='prest')
  {
    include ('home_page_connecte_prest.php');
  }
  else
  {
    header('');
  }
}
else
{
include('home_page_deconnecte.php');
}



include('vue_basdepage.php');



?>
