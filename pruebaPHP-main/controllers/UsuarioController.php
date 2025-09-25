<?php

//Aca mostramos todas las acciones que puede hacer un controlador

class UsuarioController {

    public function mostrartodos(){

    require_once 'models/UsuarioModel.php';

    $usuario = new usuario();

    $todos_los_usuarios = $usuario->conseguirTodos();

    require_once 'views/usuario/mostrar-todos.php';


}
}   