<?php
    include_once "../db.php";

    session_start();

    if($_SESSION['user'] == 'admin'){
        print_r($_POST);

        if($_POST['id_pregleda']!=null){
            $id_pregleda = $_POST['id_pregleda'];
            $dijagnoza_naziv = $_POST['dijagnoza_naziv'];
            $dijagnoza_misljenje = $_POST['dijagnoza_misljenje'];
            $simptomi = $_POST['simptomi'];
            $lijekovi = $_POST['lijekovi'];
            
            $valid_insert = false;
            $dijagnoza_id = null;
    
            $sql_dijagnoza = "INSERT INTO dijagnoza(naziv, misljenje, pregled_id_pregleda) VALUES('$dijagnoza_naziv', '$dijagnoza_misljenje','$id_pregleda')";
            $sql_obavi_pregled = "UPDATE pregled SET Status_pregleda_id_statusa_pregleda=1  WHERE id_pregleda=$id_pregleda";
            if($conn->query($sql_dijagnoza)=== TRUE){
                $valid_insert = true;
                $dijagnoza_id = $conn->query("SELECT LAST_INSERT_ID()")->fetch_assoc()['LAST_INSERT_ID()'];
            }
    
            foreach ($simptomi as $k => $v){
                $sql_simptom_pregled = "INSERT INTO simptom_has_pregled(Simptom_id_simptoma, Pregled_id_pregleda) VALUES($v,$id_pregleda)";
                $valid_insert = false;
                if ($conn->query($sql_simptom_pregled) === TRUE) {
                    $valid_insert = true;
                }
            }
    
            if($dijagnoza_id != null){
                foreach ($lijekovi as $k => $v){
                    $sql_lijek_dijagnoza = "INSERT INTO lijek_has_dijagnoza(Lijek_id_lijeka, Dijagnoza_id_dijagnoze) VALUES($v, $dijagnoza_id)";
                    $valid_insert = false;
                    if ($conn->query($sql_lijek_dijagnoza) === TRUE) {
                        $valid_insert = true;
                    }
                }
            }
    
            if($valid_insert){
                $conn->query($sql_obavi_pregled);
                header('Location: ../../pregledi.php');
            }else{
                header('Location: ../../index.php');
            }
        }
    }else{
        header('Location: ../../index.php');
    }
    //header('Location: ../../pacijenti.php');
?> 