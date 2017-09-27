<?php
// $usrm='prestataire';
// $passm='';
// include('vue_header_prest.php');
// include('model_con.php');
$traffic=new Traffic($usrm,$passm);//instancier la classe traffic pour chercher le bilan des traffic de la BDD
$data=$traffic->read_list();//lire toute la table traffic
$datamax=$traffic->hpointe();//calculer l'heure du pointe

echo '
<div class="row">
  <div class="col-md-4">
  </div>
  <div class="col-md-4" width="100%" style="text-align: center;">
  <ul class="nav nav-justified">
      <li class="active"><a href="process_connecte_conc.php?action=logout"><i class="glyphicon glyphicon-user"> </i> Déconnexion </a></li>
  </ul>
  </div>
    <div class="col-md-4">
    </div>
</div>';
if(!empty($data))//si le table n'est pas vide,afficher les donner dans un format tableau
{
echo '<table class="table">
<thead>
<tr>

 <th>Mois</th>
 <th>Heur</th>
 <th>Passages</th>
</tr>
</thead>';
$i=1;
foreach($data as $ind => $var)
{
echo '<tr>';
     echo '<th scope="row">' . $var['MONTH_VAL'] . '</th>';
     echo '<th>' . $var['HOUR_VAL'] . '</th>';
     echo '<th>' . $var['COMPTE'] . '</th>';
$i=$i+1;
}
echo '</tr>';
echo '<tr><th scope="row">heure de pointe:</th>
<th scope="row">' . $datamax[1]['HOUR_VAL'] . 'h.</th>
</tr>';
echo '</tr>';
echo '<tr><th scope="row">passage pendant l\'heure du pointe:</th>
<th scope="row">' . $datamax[1]['compte'] . '</th>
</tr>';
}
else//si la table est vide, afficher une message "Pas encore de traffics!"
{
  echo '<h1>Pas encore de traffics!</h1>';
}
echo '</table>';
?>
