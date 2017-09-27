<?php include('vue_header_deconnecte.php');//  template header html ?>
<br>
<br>
<br>
<!-- formulaire de connexion avec la methode post -->
<form action="process_connexion.php" method="post" style="text-align:center;">
  <p>
  <label for="EMAIL">Email :</label>
  <br>
  <input name="EMAIL" type="email" id="EMAIL" />
  <br><br>
  <label for="PASS">Mot de Passe : </label>
  <br>
  <input type="password" name="PASS" id="PASS" value="" />
  <br><br>
  <input type="submit" name="connexion" value="Connexion" />
  <br><br>
  </p>
</form>
<?php include('vue_basdepage.php');//  template footer html  ?>
