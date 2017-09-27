<?php include('vue_header_deconnecte.php');//  template header html?>
<div class="container">
  <h2 class="form-signin-heading"> Abonnez vous</h2>
  <p>Abonnez vous en quelques clics sur <spam class="T1"> Libauto </spam>et profitez de plus de libérté. Finie la queue au péage, le badge Libauto vous simplifie la vie et rend vos déplacements plus confortables, plus rapides et plus simples. </p>
<!-- formulaire d'inscription avec la methode post -->
  <form action="process_add_abonne.php" class="form-signin" method="POST">
    <div class="row">
      <div class="col-md-5">
        <label for="inputNom">Nom</label><br>
        <input type="NOM" name="NOM"  id="inputNom">
      </div>
      <br>
      <div class="col-md-5">
        <label for="inputPrenom">Prenom</label><br>
        <input type="text" name="PRENOM" id="inputPrenom">
      </div>
      <br>
      <div class="col-md-5">
        <label for="inputEmail">Email</label><br>
        <input type="text" name="EMAIL" id="inputEmail">
      </div>
      <br>
      <div class="col-md-5">
        <label for="inputPassword">Mot de passe</label><br>
        <input type="text" name="PASS" id="inputPassword">
      </div>
      <br>
      <div class="col-md-5">
        <label for="inputAdresse">Adresse</label><br>
        <input type="text" name="ADRESSE" id="inputAdresse">
      </div>
      <br>
      <div class="col-md-5">
        <label for="inputIBAN">IBAN</label><br>
        <input type="text" name="IBAN" id="inputIBAN">
      </div>
      <br>
      <div class="col-md-5">
        <div class="offset-sm-2 col-sm-10">
          <button type="submit" class="btn btn-primary">Valider</button><br>
        </div>
      </div>
    <br>
    </div>
  </form>
</div>
<?php include('vue_basdepage.php');//  template footer html ?>
