

<?php

include('Abonne.php');//contient la fonction is_session_started()
if ( is_session_started() === FALSE ) session_start(); //démarrage d'une session si elle n'est pas deja demarre
// traitement des donées envoyé dans le formulaire d'inscription et enregistrement d'un nouvel abonné dans la bd
if((isset($_POST['EMAIL'])) && (isset($_POST['PASS'])))
  {
    if(empty($_POST['EMAIL']) || empty($_POST['PASS']))
    {
      include('vue_header_deconnecte.php');  //  template header html
      include('vue_erreur_insc.php'); //  template erreur authentification
      include('vue_basdepage.php');  //  template footer html
    }
    else
    {
      $abonne = new Abonne;

      // on transforme les entités html pour éviter les problèmes lors de la requete, par exemple des quotes dans la saisie
      $EMAIL = htmlspecialchars($_POST['EMAIL']);
      $PASS = htmlspecialchars($_POST['PASS']);
      $NOM = htmlspecialchars($_POST['NOM']);
      $PRENOM = htmlspecialchars($_POST['PRENOM']);
      $ADRESSE = htmlspecialchars($_POST['ADRESSE']);
      $IBAN = htmlspecialchars($_POST['IBAN']);
      $abonne_data = $abonne->add_abonne($NOM,$PRENOM,$EMAIL, $PASS,$ADRESSE, $IBAN) ;
      include('vue_header_deconnecte.php');  //  template header html
      echo '<br><p>'.'Votre compte a bien été créé'.'</p>';
      echo '<br><p><a href="form_connexion.php">Retour au formulaire de connexion</a></p><br>';
      include('vue_basdepage.php');  //  template footer html
    }
  }
 else
   {
   include('vue_header_deconnecte.php');  //  template header html
   include('vue_erreur_insc.php'); //  template erreur authentification
   include('vue_basdepage.php');  //  template footer html
  }

?>
