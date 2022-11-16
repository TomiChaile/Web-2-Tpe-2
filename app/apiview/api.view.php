<?php

class apiView {

    /**
     * Responde cualquier coleccion de objetos en formato JSON.
     */
    public function response($data, $status) {
      //avisa que manda contenido en formato json
        header("Content-Type: application/json");
        header("HTTP/1.1 {$status} " . $this->_requestStatus($status));
        echo json_encode($data);
    }

    /**
     * Asocia un mensaje a un codigo de respuesta.
     */
    private function _requestStatus($code){
        $status = array(
          200 => "OK",
          201 => "Created",
          404 => "Not found",
          400 => "Bad Request",
          500 => "Internal Server Error"
        );
        return (isset($status[$code]))? $status[$code] : $status[500];
      }
  
}
