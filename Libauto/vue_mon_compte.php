<?php

include('Abonne.php');//contient la fonction is_session_started()

include('vue_header_connecte.php'); //  template header html

// instanciation de la classe : on crée l'objet $abonne pour accéder à la méthode get_abonne()
$abonne = new Abonne;
$abonne_data = $abonne->get_abonne($_SESSION['EMAIL']);
$_SESSION['NB_BADGE'] = $abonne_data['NB_BADGE'];//initialisation de la variable de session NB_BADGE

echo '<br>';
echo '<br>';
  echo '<h4><b>Nom : </b></h4>' . $abonne_data['NOM'] .'';
  echo '<br>';
  echo '<br>';
  echo '<h4><b>Prénom : </b></h4>' . $abonne_data['PRENOM'] .'';
  echo '<br>';
  echo '<br>';
  echo '<h4><b>Email : </b></h4>' . $abonne_data['EMAIL'] .'';
  echo '<br>';
  echo '<br>';
  echo '<h4><b>Adresse : </b></h4>' . $abonne_data['ADRESSE'] .'<a href="form_update_abonne.php?modif=ADRESSE"> modifier</a>';
  echo '<br>';
  echo '<br>';
  echo '<h4><b>Numéro de badge : </b></h4>' . $abonne_data['NB_BADGE'] .'';
  echo '<br>';
  echo '<br>';
  echo '<h4><b>IBAN : </b></h4>' . $abonne_data['IBAN'] .'<a href="form_update_abonne.php?modif=IBAN"> modifier</a>';

echo '<br>';
echo '<br>';
echo '<br>';
echo '<br>';
//ajout de nouvelles variables de session
$_SESSION['ADRESSE'] = $abonne_data['ADRESSE'];
$_SESSION['IBAN'] = $abonne_data['IBAN'];

include('vue_basdepage.php'); //template footer html
?>
