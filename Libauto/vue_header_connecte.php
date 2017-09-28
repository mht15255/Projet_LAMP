<?php

include('Abonne.php');//contient la fonction is_session_started()
if ( is_session_started() === FALSE ) session_start(); //démarrage d'une session si elle n'est pas deja demarre

?>
<!-- Entête ou header du menu connecté -->
<!DOCTYPE html>
<html lang="fr">
 <head>
   <title>Libauto</title>
   <meta charset="UTF-8">
   <!-- Lien pour utilisé bootstrap -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 </head>
<body>
  <div class="container"> <!-- ouverture du container corps de page -->
  <!-- Bandeau -->
  <div class="row">
    <div class="col-md-4"></div>
    <div class="col-md-4" width="100%" style="text-align: center;">
      <a href="index.php"><img alt="logo_site" width="250px" height="250px" src="./images/libauto-logo.png"></a>
    </div>
    <div class="col-md-4"></div>
  </div>
  <!-- Menu -->
  <div class="container-fluid">
    <ul class="nav nav-justified">
      <li class="active"><a href="index.php"><i class="glyphicon glyphicon-home"></i> Accueil </a></li>
      <li class="active"><a href="vue_mon_compte.php"><i class="glyphicon glyphicon-user"></i> Mon compte </a></li>
      <li class="active"><a href="process_facture.php"><i class="glyphicon glyphicon-road"></i> Trajets et factures </a></li>
      <li><p><a href="index.php?connexion=demande_deconnexion"><i class="glyphicon glyphicon-off"></i> Déconnexion </a></p></li>
    </ul>
  </div>
