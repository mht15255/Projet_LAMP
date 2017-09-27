<?php
/**
 * Page d'acceuil du site Libauto
 *
 * Cette fonction dit bonjour. Si l'utilisateur n'a pas indiqué son nom,
 * world
 * @param string $name Le nom de l'utilisateur
 * @return string Une phrase saluant l'utilisateur
 */
include('Abonne.php');
if ( is_session_started() === FALSE ) session_start();//démarrage d'une session si elle n'est pas deja demarre

if (isset($_SESSION['CONNEXION']) && !empty($_SESSION['CONNEXION']) && ($_SESSION['CONNEXION'] === 'ok'))
  {
    // affichage du header et footer si l'utilisateur n'est pas connecté
    include('vue_header_connecte.php');
    include('vue_basdepage.php');
    // include('vue_mon_compte.php');//affiche la page perso de l'abonné s'il est connecté
  }
  else
  {
    // affichage du header et footer si l'utilisateur n'est pas connecté
    include('vue_header_deconnecte.php');
    include('vue_basdepage.php');
  }

if ((isset($_GET['connexion'])) && ($_GET['connexion'] === 'demande_deconnexion'))
  {
    // déconnnexion de l'utilisateur s'il demande à se déconnecte
    $user = new Abonne;
    $user->logout();
  }
?>
