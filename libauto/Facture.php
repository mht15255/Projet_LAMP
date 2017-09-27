<?php

class Facture
{
  public $mysqli;
  function __construct()
  {
    $this->mysqli=new mysqli('localhost','root','','libautodb');
  }
  function get_facture($NB_BADGE)
  {$i=0;
    $posts=array();
    $result=$this->mysqli->query('SELECT  * FROM facture_tp where NB_BADGE = ' . $NB_BADGE . ';');
    while($row=$result->fetch_array())
    {
        $posts[$row['ID_TP']]=$row;
        $i++;
    }
    return $posts;
  }
}

?>
