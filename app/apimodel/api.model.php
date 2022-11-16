<?php

class apiModel {

    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;dbname=aerolineas;charset=utf8', 'root', '');
    }

    /**
     * Obtiene la lista de tareas dejando en primer lugar las que no fueron finalizadas.
     */
    public function getAll() {
        $query = $this->db->prepare('SELECT * FROM pasajesapi ORDER BY precio DESC');
        $query->execute();

        return $query->fetchAll(PDO::FETCH_OBJ);
    }
    /**
     * Retorna todas las tareas de acuerdo a la prioridad y si está finalizada o no.
     */
    public function getPasajes($clase) {
        $query = $this->db->prepare("SELECT * FROM pasajesapi WHERE id_pasajeapi = ?");
        $query->execute(array($clase));
        return $query->fetchAll();
    }

    public function ascen(){
        $query = $this->db->prepare('SELECT * FROM pasajesapi ORDER BY precio ASC');
        $query->execute();

        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function descen(){
        $query = $this->db->prepare('SELECT * FROM pasajesapi ORDER BY precio DESC');
        $query->execute();

        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    /**
     * Retorna una tarea según el id pasado.
     */
    public function get($idPasaje) {
        $query = $this->db->prepare('SELECT * FROM pasajesapi WHERE id_pasajeapi = ?');
        $query->execute(array($idPasaje));

        return $query->fetch(PDO::FETCH_OBJ);
    }


    /**
     * Guarda una tarea en la base de datos.
     */
    public function save($fecha, $ida, $vuelta,$precio,$usuario,$clase) {
        $query = $this->db->prepare('INSERT INTO pasajesapi (fecha, ida, vuelta,precio,usuario,clase) VALUES(?,?,?,?,?,?)');
        $query->execute([$fecha, $ida, $vuelta,$precio,$usuario,$clase]);

        return $this->db->lastInsertId();
    }

        /**
     * Elimina una tarea de la BBDD según el id pasado.
     */
    function delete($idpasaje) {
        $query = $this->db->prepare('DELETE FROM pasajesapi WHERE id_pasajeapi = ?');
        $query->execute([$idpasaje]); 
    }

    /**
     * Actualiza la tarea y la marca finalizada.
     */
   

    function update($id,$fecha,$ida,$vuelta,$precio,$usuario, $clase) {
        $query = $this->db->prepare('UPDATE pasajesapi SET fecha = ?, ida=?, vuelta=?, precio=?, usuario=?, clase=? WHERE id_pasajeapi = ?');
        $query->execute([$fecha,$ida,$vuelta,$precio,$usuario, $clase, $id]);
    }

}
