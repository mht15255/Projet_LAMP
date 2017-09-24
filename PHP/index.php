<?php

class abonne_tp

{

  public $mysqli;

  function __construct()

  {

    $this->mysqli=new mysqli('localhost','root','CoursMySQL5.7!','libautodb');

  }



  function read_list()

  {

    $posts=array();

    $result=$this->mysqli->query('SELECT  * FROM jaafar;');

    while($row=$result->fetch_array())

    {

        $posts[$row['NB_BADGE']]=$row;

    }

    return $posts;

  }

}

$blabla=new abonne_tp();

$tab=$blabla->read_list();
echo'<!DOCTYPE html>

<html>

<head>

  <!-- CSS  -->

   <meta charset="utf-8">

   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

   <title>My titly title</title>

   </head>

   <body>   

  <table class="table">

  <thead>  

    <tr>

      <th>#</th>

      <th>NOM</th>

      <th>NB_BADGE</th>

      <th>PRENOM</th>

      <th>PASS</th>

    </tr>

  </thead>';


  $i=1;

  foreach($tab as $ind => $var)

  {

    echo '<tr>

          <th scope="row">' . $i . '</th>';
          echo '<th>' . $var['NOM'] . '</th>';
          echo '<th>' . $var['NB_BADGE'] . '</th>';
          echo '<th>' . $var['PRENOM'] . '</th>';
          echo '<th>' . $var['PASS'] . '</th>';
    echo '</tr>';

    $i=$i+1;

  }


  echo '</tbody>

  </table>';

echo '</body>

</html>';



?>
