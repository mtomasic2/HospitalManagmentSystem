<?php
    include_once "../db.php";
    //print_r($_POST);
    if(isset($_POST['update'])) {
        $id_pacijenta = $_POST['id_pacijenta'];
        $ime = $_POST['ime'];
        $prezime = $_POST['prezime'];
        $datum_rodjenja = $_POST['datum'];
        $adresa = $_POST['adresa'];
        $kontakt_broj = $_POST['kontakt_broj'];
        $kontakt_mail = $_POST['kontakt_email'];
        $soba_id = $_POST['soba_id'];
        $spol_id = $_POST['spol_id'];

        $sql = "UPDATE pacijent 
                SET ime='$ime', prezime='$prezime', datum_rodjenja='$datum_rodjenja', adresa='$adresa', kontakt_broj='$kontakt_broj', kontakt_mail='$kontakt_mail', Soba_id_sobe=$soba_id, Spol_id_spola=$spol_id 
                WHERE id_pacijenta=$id_pacijenta";
        if ($conn->query($sql) === TRUE) {
            header('Location: ../../pacijenti.php');
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }

    }

    //header('Location: ../../pacijenti.php');
?> 