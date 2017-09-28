<?php
include('vue_header_deconnecte.php');//  template header html
include('Abonne.php');//contient la fonction is_session_started()

if ( is_session_started() === FALSE ) session_start(); //démarrage d'une session si elle n'est pas deja demarre

//identification dans l'URL de la variable à modifier ...
$var_modif = $_GET['modif'];
// .... et enregistrement en tant que variable de session
$_SESSION['MODIF'] = $_GET['modif'];
//récupération dans la session de la variable à modifier
$value = $_SESSION[$var_modif];

echo'
<div class="container">
  <h4 class="form-signin-heading">Modification de vos données personnelles</h4>
  <!-- formulaire de modification avec la methode post -->
  <form action="process_update_abonne.php" class="form-signin" method="POST">
    <div class="row">
    <div class="col-md-2">
    </div>
      <br>
      <div>
        <label for="inputDonnee">Données</label><br>
        <input type="text" name="'.$var_modif.'"  id="inputDonnee" value=" ' . $value . '">
      </div>
      <br>
      <div>
        <div class="offset-sm-2 col-sm-10">
          <button type="submit" class="btn btn-primary">Valider</button><br>
        </div>
      </div>
    <br>
    </div>
  </form>
</div>
<br>
<br>';

include('vue_basdepage.php');//  template footer html
?>
