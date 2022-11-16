<?php
require_once("app/apimodel/api.model.php");
require_once("app/apiview/api.view.php");

class PasajeApiController {

    private $model;
    private $view;

    private $data;

    public function __construct() {
        $this->model = new apiModel();
        $this->view = new apiView();
       $this->data = file_get_contents("php://input");
    }

    //devuelve el body del request
    private function getData() {
        return json_decode($this->data);
    }

   // public function  getPasajes() {
        //$tareas = $this->model->getAll();
       // $this->view->response($tareas, 200);
    //}

    public function getPasajes($params = []){
        if (isset ($_GET['order']) && isset ($_GET ['sort'])){
            if (($_GET ['sort']=='precio')){
                if (($_GET ['order'] == 'asc')){
                    $pasaje = $this->model->ascen();
                }
                elseif (($_GET['order'] == 'desc')){
                    $pasaje = $this->model->descen();
                }
            }
            return $this->view->response($pasaje, 200);
        }
    }

    public function getPasaje($params = []) {
        $idPasaje = $params[':ID'];
        
        $pasaje = $this->model->get($idPasaje);        
        if ($pasaje){
            $this->view->response($pasaje, 200);
        }else{
            $this->view->response("El pasaje con el id=$idPasaje no existe", 400);
        }
    } 

    public function deletePasaje($params = null) {
        $id = $params[':ID'];
        $pasaje = $this->model->get($id);
        if ($pasaje) {
            $this->model->delete($id);
            $this->view->response("El pasaje fue borrado con exito.", 200);
        } else
            $this->view->response("El pasaje con el id=$id no existe", 400);
    }

    public function addPasaje($params = null) {
        //obtengo body
        $data = $this->getData();

        $idPasaje = $this->model->save($data->fecha, $data->ida, $data->vuelta, $data->precio, $data->usuario, $data->clase);
        
        $pasaje = $this->model->get($idPasaje);
        if ($pasaje)
            $this->view->response("Se inserto pasaje con el id=$idPasaje", 201);
        else
            $this->view->response("El pasaje no fue creado", 404);

    }

    public function updatePasaje($params = null) {
        $idPasaje = $params[':ID'];
        $data = $this->getData();
        
        $pasaje = $this->model->get($idPasaje);
        if ($pasaje) {
            $this->model->update($idPasaje, $data->fecha, $data->ida, $data->vuelta, $data->precio, $data->usuario, $data->clase);
            $this->view->response("El pasaje fue modificado con exito.", 200);
        } else
            $this->view->response("El pasaje con el id=$idPasaje no existe", 400);
    }
}
