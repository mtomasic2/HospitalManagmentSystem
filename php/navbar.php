<?php
    if($_SESSION['user'] == 'admin'){
      include_once "php/navbar-admin.php";
    }else{
      include_once "php/navbar-korisnik.php";
    }
?>