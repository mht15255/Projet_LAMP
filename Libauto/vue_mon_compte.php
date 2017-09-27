
<?php

include('Abonne.php');//contient la fonction is_session_started()

include('vue_header_connecte.php'); //  template header html

// instanciation de la classe : on crée l'objet $abonne pour accéder à la méthode get_abonne()
$abonne = new Abonne;
$abonne_data = $abonne->get_abonne($_SESSION['EMAIL']);
$_SESSION['NB_BADGE'] = $abonne_data['NB_BADGE'];//initialisation de la variable de session NB_BADGE

echo '<br>';
echo '<ul>';
  echo '<li>' . $abonne_data['NOM'] .'</li>';
  echo '<li>' . $abonne_data['PRENOM'] .'</li>';
  echo '<li>' . $abonne_data['EMAIL'] .'</li>';
  echo '<li>' . $abonne_data['ADRESSE'] .'<a href="form_update_abonne.php?modif=ADRESSE">Modifier</a></li>';
  echo '<li>' . $abonne_data['NB_BADGE'] .'</li>';
  echo '<li>' . $abonne_data['IBAN'] .'<a href="form_update_abonne.php?modif=IBAN">Modifier</a></li>';
echo '</ul>';
//ajout de nouvelles variables de session
$_SESSION['ADRESSE'] = $abonne_data['ADRESSE'];
$_SESSION['IBAN'] = $abonne_data['IBAN'];

include('vue_basdepage.php'); //template footer html
?>
