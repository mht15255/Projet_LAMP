<?php
$indexurl='index.php';
include('vue_header.php');
include('home_page_deconnecte.php');
if($_GET['action']=='prest')
{
  $usr='prest';
}
elseif($_GET['action']=='conc')
{
  $usr='conc';
}
else {
header($indexurl);
exit;
    }
?>

<br>
<br>
<br>
<!-- formulaire de connexion avec la methode post -->
<form action="process_connexion_<?php echo $usr;?>.php" method="post" style="text-align:center;">
  <p>
  <label for="pass">Mot de Passe : </label>
  <br>
  <input type="password" name="pass" id="password" value="" />
  <br><br>
  <input type="submit" name="connexion" value="Connexion" />
  <br><br>
  </p>
</form>

<?php
include('vue_basdepage.php');
?>
