<table class="table">
<thead>
<tr>
 <th>Nom Entree</th>
 <th>Date Entree</th>
 <th>Nom Sortie</th>
 <th>Date Sortie</th>
 <th>Distance du trajet</th>
 <th>Prix du trajet</th>
</tr>
</thead>
<?php $i=1;
foreach($tab as $ind => $var)
{
echo '<tr>';
     echo '<th>' . $var['nom_e'] . '</th>';
     echo '<th>' . $var['DATE_E'] . '</th>';
     echo '<th>' . $var['nom_s'] . '</th>';
     echo '<th>' . $var['DATE_S'] . '</th>';
     echo '<th>' . $var['DISTANCE'] . '</th>';
     echo '<th>' . $var['PRIX'] . '</th>';
echo '</tr>';
$i=$i+1;
}
echo '</table>';
?>
