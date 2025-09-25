<?php

class database{
    public static function conectar (){
        $conexion = new mysqli ("localhost","root","","barcaa");
        $conexion->query ("SET NAMES 'utf8'");
    }
}