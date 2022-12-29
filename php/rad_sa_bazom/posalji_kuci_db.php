<?php
    include_once "../db.php";

    session_start();

    if($_SESSION['user'] == 'admin'){
        if(isset($_GET['id_pacijenta'])!=null){
            $id_pacijenta = $_GET['id_pacijenta'];
            $sql = "DELETE FROM `pacijent` WHERE `id_pacijenta`='$id_pacijenta'";
            $result = $conn->query($sql);
            if ($result == TRUE) {
                header('Location: ../../pacijenti.php');
           }else{
                header('Location: ../../index.php');
           }
        }
    }else{
        header('Location: ../../index.php');
    }
?>