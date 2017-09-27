<?php
include('Abonne.php');//contient la fonction is_session_started()
if ( is_session_started() === FALSE ) session_start(); //démarrage d'une session si elle n'est pas deja demarre

// on inclue le fichier qui contient la classe
include('Facture.php');

include('vue_header_connecte.php'); //  template header html

// instanciation de la classe : on crée l'objet $user pour accéder à la méthode verify_abonne()
$facture= new Facture();
$NB_BADGE =$_SESSION['NB_BADGE'];

$tab=$facture->get_facture($NB_BADGE);

//affichage des factures et trajets de l'abonné s'il en a
if (empty($tab))
  {
    echo '<h1>Vous n\'avez pas de trajets<h1>';
  }
else
  {
    include ('vue_facture.php');
  }

include('vue_basdepage.php'); // template footer html
?>
