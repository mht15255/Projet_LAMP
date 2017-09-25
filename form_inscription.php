<?php
include('view_header.php');

?>

<form action="add_abonne.php" method="POST">

    <div class="container">
<div class : "row">
  <div class="col-md-6">
      <form class="form-signin">
        <h2 class="form-signin-heading"> Abonnez vous</h2>
    <p>Abonnez vous en quelques clics sur <spam class="T1"> Libauto </spam>et profitez de plus de libérté. Finie la queue au péage, le badge Libauto vous simplifie la vie et rend vos déplacements plus confortables, plus rapides et plus simples. </p>

        <label for="inputNom" class="sr-only">Nom</label>
        <input type="NOM" name="NOM" id="NOM"  placeholder="Nom" required autofocus>
<P>

        <label for="inputPrenom" class="sr-only">Prenom</label>
        <input type="PRENOM" name="PRENOM" id="Prenom"  placeholder="Prenom" required autofocus></P>
        <p>
        <label for="inputEmail" class="sr-only">Email</label>
        <input type="EMAIL" name="EMAIL" id="inputEmail"  placeholder="Adresse email" required autofocus>
        <p>
        <label for="inputPassword" class="sr-only">Mot de passe</label>
        <input type="password" name="password" id="inputPassword"  placeholder="Mot de passe" required>
          <label for="inputPassword" class="sr-only">Réteter le mot de passe</label>
        <input type="password" name="password" id="inputPassword"  placeholder="Mot de passe" required>
        <div class="checkbox"></p>
          <p>
          <label for="inputAdresse" class="sr-only">Adresse</label>
          <input type="ADRESSE" name="ADRESSE" id="inputAdresse"  placeholder="Adresse" required>

          <div class="checkbox"></p>
            <p>
            <label for="inputIBAN" class="sr-only">IBAN</label>
            <input type="IBAN" name="IBAN" id="inputIBAN"  placeholder="IBAN" required>

            <div class="checkbox"></p>


        </div>
       <button class="btn btn-lg btn-primary" type="submit">Valider</button>
      <!--     <h1 class="form-signin-heading">Pas encore membre? Inscrivez vous </h1>

          <button class="btn btn-lg btn-primary" type="submit">S'inscrire gratuitement</button> -->
      </form>


      <?php
      include('view_footer.php');

      ?>
