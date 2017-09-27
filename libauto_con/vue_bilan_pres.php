<?php
// $usrm='prestataire';
// $passm='';
// include('vue_header_prest.php');
// include('model_con.php');
$trajet=new Trajet($usrm,$passm);
$data=$trajet->read_list();
// var_dump($data);
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
echo '<div>';
if(!empty($data))
{
echo '<table class="table">
<thead>
<tr>
 <th>Entrée</th>
 <th>Date d\'entrée</th>
 <th>Sortie</th>
 <th>Date de sortie</th>
 <th>Distance du trajet</th>
 <th>Prix du trajet</th>
 <th>Moyen de payement</th>
</tr>
</thead>';
$i=1;
foreach($data as $ind => $var)
{
echo '<tr>';
    //  <th scope="row">' . $i . '</th>';
     echo '<th scope="row">' . $var['NOM_E'] . '</th>';
     echo '<th>' . $var['DATE_E'] . '</th>';
     echo '<th>' . $var['NOM_S'] . '</th>';
     echo '<th>' . $var['DATE_S'] . '</th>';
     echo '<th>' . $var['DISTANCE'] . '</th>';
     echo '<th>' . $var['PRIX'] . '</th>';
     echo '<th>' . $var['PAY'] . '</th>';


$i=$i+1;
}

}
else
{
  echo '<h1>Pas encore de traffics!</h1>';
}
echo '</table>' . PHP_EOL . '</div>';
?>
