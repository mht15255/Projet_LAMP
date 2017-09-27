<?php

include('Abonne.php');//contient la fonction is_session_started()
if ( is_session_started() === FALSE ) session_start(); //démarrage d'une session si elle n'est pas deja demarre

// récupération des variables de session à passer en paramètre
$NB_BADGE = $_SESSION['NB_BADGE'];
$att = $_SESSION['MODIF'];
$val = $_POST[$att];

// instanciation de la classe : on crée l'objet $user pour accéder à la méthode verify_abonne()
$abonne = new Abonne;
$abonne_data = $abonne->update_abonne($NB_BADGE, $att, $val);

if(TRUE==$abonne_data)
  {
    include ('vue_header_connecte.php');//  template header html
    echo '<br><p>'.'Votre modification a bien été prise en compte'.'</p><br>';
    include ('vue_basdepage.php');// template footer html
  }
  else
  {
    include ('vue_header_connecte.php');//  template header html
    echo '<br><p>'.'Votre modification a échouée '.'</p><br>';
    include ('vue_basdepage.php');// template footer html
  }
?>
