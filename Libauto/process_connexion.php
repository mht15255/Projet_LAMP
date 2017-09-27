<?php
include('Abonne.php');//contient la fonction is_session_started()
if ( is_session_started() === FALSE ) session_start(); //démarrage d'une session si elle n'est pas deja demarre

if((isset($_POST['EMAIL'])) && !empty($_POST['EMAIL']) && (isset($_POST['PASS'])) && !empty($_POST['PASS']))
  {
    // la vérification du contenu posté par l'utilisateur est ici réduite à la simple vérification de l'existence des deux informations car on fait ensuite un simple SELECT qui vérifie l'existence ds informations dans la base.


    // on transforme les entités  html pour éviter les problèmes lors de la requete, par exemple des quotes dans la saisie
    $email        = htmlspecialchars($_POST['EMAIL']);
    $password     = htmlspecialchars($_POST['PASS']);
    // instanciation de la classe : on crée l'objet $user pour accéder à la méthode verify_abonne()
    $user         = new Abonne;
    $user_verify  = $user->verify_abonne($email, $password) ;

    if($user_verify)
      {
        // session_start(); //démarrage d'une session
        $_SESSION['EMAIL'] = $email; //initialisation de la variable de session email
        $_SESSION['CONNEXION'] = 'ok'; //initialisation de la variable de session connexion
        $_SESSION['NB_BADGE'] = ''; //initialisation de la variable de session numéro de badge
        include ('vue_mon_compte.php'); // affiche la page perso de l'utilisateur
        // echo '<br><p>Bonjour, vous êtes connecté(e).</p><br>';
      }
      else
      {
        include('vue_header_deconnecte.php');  //  template header html
        include('vue_erreur_auth.php'); //  template erreur authentification
        include('vue_basdepage.php');  //  template footer html
      }
  }
else
  {
    include('form_connexion.php');   // template formulaire de connexion
  }
?>
