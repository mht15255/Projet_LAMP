<?php
include('Abonne.php');
if ( is_session_started() === FALSE ) session_start();//démarrage d'une session si elle n'est pas deja demarre
if (isset($_SESSION['CONNEXION']) && !empty($_SESSION['CONNEXION']) && ($_SESSION['CONNEXION'] === 'ok'))
{
  // var_dump($_SESSION);
  // include('vue_header_connecte.php');
  include('vue_mon_compte.php');
}
else
{
  include('vue_header_deconnecte.php');
  include('vue_basdepage.php');
}

if ((isset($_GET['connexion'])) && ($_GET['connexion'] === 'demande_deconnexion'))
  {
    $user = new Abonne;
    $user->logout();
  }




?>
