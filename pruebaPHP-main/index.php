<h1>Bienvenidos a mi web</h1>

<?php
    
    require_once 'controllers/UsuarioController.php';

    $controlador= new UsuarioController();

    $controlador->mostrartodos();