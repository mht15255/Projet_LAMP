<?php
Class Concess // déclaration de la classe en fonction du nom de la table de la DB
{
    private $mysqli ; // cet attribut sert à stocker la connexion à la base de données
    /*
    le constructeur ici sert à créer la connexion à la base de données et
    à l'assigner à l'attribut $mysqli grace à la méta-variable "$this" utilisée comme suit : $this->mysqli
    Ainsi la connexion à la base de données est déclarée seulement une fois et est donc
    simplement et rapidement modifiable
    */
    public function __construct()
    {
        $this->mysqli = new mysqli('localhost', 'concess', '', 'libautodb');
        $this->mysqli->query("SET NAMES 'utf8'");
    }
    /**
    * @return array
    */
    /**
    * verify_abonne
    *
    * verifie dans la table 'Abonne' l'existence d'un enregistrement dont les colonnes email et password contiennent les valeurs passées en argument.
    *
    * @param none
    * @return array || FALSE
    */
    public function verify_concess($NOM, $PASS) // déclaration de la méthode
    {
        // on utilise l'atribut $mysqli pour récupérer la connexion à la base de données
        // au moyen de la méta-variable "$this" utilisée comme suit : $this->mysqli
        $result = $this->mysqli->query('SELECT NB_BADGE FROM abonne_tp WHERE EMAIL ="'. $EMAIL .'" && PASS="'. $PASS .'"');
        $row = $result->fetch_array();
        //var_dump($row);//pour vérif
        return !is_null($row);
    }
    /**
    * get_abonne
    *
    * afficher les donnes de l'abonne.
    *
    * @param none
    * @return array || FALSE
    */
    public function get_abonne($EMAIL)
    {
        // création de la requete MySQL
        $sql = 'SELECT  * FROM abonne_tp WHERE EMAIL = ' . $EMAIL ;
        // echo $sql ;
        // on utilise l'atribut $mysqli pour récupérer la connexion à la base de données
        // au moyen de la méta-variable "$this" utilisée comme suit : $this->mysqli$result = $this->mysqli->query($sql);
        $result = $this->mysqli->query($sql);
        // var_dump($result);
        if(TRUE == $result)
        {
            $row = $result->fetch_array();
            $data['NB_BADGE']    = $row['NB_BADGE'];
            $data['NOM']    = $row['NOM'];
            $data['PRENOM']  = $row['PRENOM'];
            $data['PRENOM'] = $row['PRENOM'];
            $data['EMAIL'] = $row['EMAIL'];
            $data['ADRESSE'] = $row['ADRESSE'];
            $data['IBAN'] = $row['IBAN'];
            return $data ;
        }
        else
        {
            return FALSE ;
        }
    }
    /**
    * @return array
    */
    /**
    * add_abonne
    *
    * ajouter  dans la table 'abonne' les valeurs passées en argument.
    *
    * @param none
    * @return array || FALSE
    */
    public function add_abonne($NOM,$PRENOM,$EMAIL, $PASS,$ADRESSE, $IBAN) // déclaration de la méthode
    {
        // on utilise l'atribut $mysqli pour récupérer la connexion à la base de données
        // au moyen de la méta-variable "$this" utilisée comme suit : $this->mysqli
        // création de la requete MySQL
        $sql = 'INSERT INTO abonne_tp (NOM,PRENOM,EMAIL, PASS,ADRESSE, IBAN ) VALUES ("'.$NOM.'","' .$PRENOM .'","'.$EMAIL.'","' .$PASS .'","' .$ADRESSE .'","' .$IBAN .'");';
        $result = $this->mysqli->query($sql);
        if($result)
        {
            return TRUE ;
        }
        else
        {
            return FALSE ;
        }
    }
    /**
    * @return array
    */

    /**
    * @return array
    */
    /**
    * uptade_abonne  permet à l'abonne de mofidier son mot de pass,adresse et /ou son iban.
    *
    * @param $NB_BADGE
    * @return $NB_BADGE cré ou false
    */
    public function update_abonne($NB_BADGE, $att, $val)
    {
        $sql = ('UPDATE abonne_tp SET  '. $att .'="'.$val. '" WHERE NB_BADGE ='.$NB_BADGE);
        //echo $sql;
        // echo $sql ;
        // on utilise l'atribut $mysqli pour récupérer la connexion à la base de données
        // au moyen de la méta-variable "$this" utilisée comme suit : $this->mysqli$result = $this->mysqli->query($sql);
        $result = $this->mysqli->query($sql);
      //  var_dump($result);
    //à vérifier si c'est FALSE ou NULL
        if(FALSE == $result)
        {
            return FALSE ;
        }
        else
        {
            return TRUE ;
        }
    }
    /**
    * redirect
    *
    * redirection header location en fonction de la valeur $url
    *
    * @param string $id
    * @return array or false
    */
    public function redirect($url)
    {
        header('index.php:' . $url);
    }

    /**
    * logout
    *
    * vide puis supprime les variables de sessions
    *
    * @param string $id
    * @return array or false
    */
    public function logout()
    {
      session_start();
      session_unset();
      session_destroy();
      $this->redirect('index.php');
    }


} // fin de la création de la classe
