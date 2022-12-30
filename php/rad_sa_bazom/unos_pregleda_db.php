<?php
    include_once "../db.php";

    session_start();

    if($_SESSION['user'] == 'admin'){
        print_r($_POST);
        if(isset($_POST['submit'])) {
            $id_pacijenta = $_POST['id_pacijenta'];
            $datum_pregleda = $_POST['datum_pregleda'];
            $id_lijecnika = $_POST['id_lijecnika'];
            $status_pregleda = 2;

            $sql = "INSERT INTO pregled (datum_termina_pregleda, Status_pregleda_id_statusa_pregleda, Lijecnik_lijecnik_id, pacijent_id_pacijenta)
                    VALUES('$datum_pregleda', '$status_pregleda', $id_lijecnika, $id_pacijenta)";

            if ($conn->query($sql) === TRUE) {
                header('Location: ../../pregledi.php');
            } else {
                echo "Error: " . $sql . "<br>" . $conn->error;
            }
        }
    }else{
        header('Location: ../../index.php');
    }
    //header('Location: ../../pacijenti.php');
?> 