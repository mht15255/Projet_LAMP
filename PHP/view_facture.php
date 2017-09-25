<?php
$nb_badge=30;
class Facture
{
  public $mysqli;
  function __construct()
  {
    $this->mysqli=new mysqli('localhost','root','','libautodb');
  }
  function read_list($nb_badge)
  {$i=0;
    $posts=array();
    $result=$this->mysqli->query('SELECT  * FROM facture where nb_badge = ' . $nb_badge . ';');
    while($row=$result->fetch_array())
    {
        $posts[$row['ID_TP']]=$row;

        $i++;
    }
    return $posts;
  }
}

$facture= new Facture();
$tab=$facture->read_list($nb_badge);
echo'<!DOCTYPE html>
<html>
<head>
  <!-- CSS  -->
   <meta charset="utf-8">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
   <title>My titly title</title>
   </head>
   <body>';
   if (empty($tab))
   {echo '<h1>Vous n\'avez pas des trajets<h1>';}
   else
   {
     var_dump($tab);
   echo '  <table class="table">
  <thead>
    <tr>
      <th>#</th>
      <th>Nom Entree</th>
      <th>Date Entree</th>
      <th>Nom Sortie</th>
      <th>Date Sortie</th>
      <th>Distance du trajet</th>
      <th>Prix du trajet</th>
    </tr>
  </thead>';
  $i=1;
  foreach($tab as $ind => $var)
  {
    echo '<tr>
          <th scope="row">' . $i . '</th>';
          echo '<th>' . $var['nom_e'] . '</th>';
          echo '<th>' . $var['DATE_E'] . '</th>';
          echo '<th>' . $var['nom_s'] . '</th>';
          echo '<th>' . $var['DATE_S'] . '</th>';
          echo '<th>' . $var['distance'] . '</th>';
          echo '<th>' . $var['prix'] . '</th>';
    echo '</tr>';
    $i=$i+1;
  }
  echo '</tbody>
  </table>';
   }
echo '</body>
</html>';
?>
