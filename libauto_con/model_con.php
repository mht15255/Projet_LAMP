<?php
// Class pour chercher le traffic
// $usrm='consessionnaire';
// $passm='concess';
// $usrm='prestataire';
// $passm='';
$usrm='prestataire';
$passm='prestataire';
// $usrm='root';
// $passm='';
class Trajet
{
  public $mysqli;
  function __construct($usr,$pass)
  {
    $this->mysqli=new mysqli('localhost',$usr,$pass,'libautodb');
  }
  function read_list()
  {$i=1;
    $data=array();
    $result=$this->mysqli->query('SELECT  * FROM trajet;');
    while($row=$result->fetch_array())
    {
        $data[$i]=$row;
        $i++;
    }

    return $data;
  }
  function sum_traffic()
  {
    $i=1;
      $data=array();
      $result=$this->mysqli->query('SELECT  count(*) FROM trajet;');
      while($row=$result->fetch_array())
      {
          $data[$i]=$row;
          $i++;
      }
      return $data;
  }
}
class Traffic
{
  public $mysqli;
  function __construct($usr,$pass)
  {
    $this->mysqli=new mysqli('localhost',$usr,$pass,'libautodb');
  }
  function read_list()
  {$i=1;
    $data=array();
    $result=$this->mysqli->query('SELECT  * FROM traffic_mois_heur;');
    while($row=$result->fetch_array())
    {
        $data[$i]=$row;
        $i++;
    }
    return $data;
  }
  function sum_traffic()
  {
    $i=1;
      $data=array();
      $result=$this->mysqli->query('SELECT  count(*) FROM traffic_mois_heur;');
      while($row=$result->fetch_array())
      {
          $data[$i]=$row;
          $i++;
      }
      return $data;
  }
  function hpointe()
  {
    $i=1;
      $data=array();
      $result=$this->mysqli->query('SELECT  HOUR_VAL, compte FROM traffic_heur WHERE compte= (select max(compte) from traffic_heur);');
      while($row=$result->fetch_array())
      {
          $data[$i]=$row;
          $i++;
      }
      return $data;
  }

}

class Gestionnaire
{
  public $mysqli;
  function __construct($usr,$pass)
  {
    $this->mysqli=new mysqli('localhost',$usr,$pass,'libautodb');
  }
  function verify_gest($usr,$pass)
  {
    // echo 'SELECT NOM FROM gestionnaire WHERE NOM ="'. $usr .'" && PASS="'. $pass .'"';
    $result = $this->mysqli->query('SELECT NOM FROM gestionnaire WHERE NOM ="'. $usr .'" && PASS="'. $pass .'"');
    $row = $result->fetch_array();
    //var_dump($row);
    return !is_null($row);
  }
  function change_pass($usr,$pass)
  {
    echo  'UPDATE gestionnaire WHERE NOM ="'. $usr .'" SET PASS = " . $pass . "';
    // $result = $this->mysqli->query('UPDATE gestionnaire WHERE NOM ="'. $usr .'" SET PASS = " . $pass . "');
    $row = $result->fetch_array();
    //var_dump($row);
    return !is_null($row);
  }
}

?>
