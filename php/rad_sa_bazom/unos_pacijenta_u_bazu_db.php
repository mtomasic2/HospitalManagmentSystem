<?php
    include_once "../db.php";
    //print_r($_POST);
    if(isset($_POST['submit'])) {
        $ime = $_POST['ime'];
        $prezime = $_POST['prezime'];
        $datum_rodjenja = $_POST['datum'];
        $adresa = $_POST['adresa'];
        $kontakt_broj = $_POST['kontakt_broj'];
        $kontakt_mail = $_POST['kontakt_email'];
        $soba_id = $_POST['soba_id'];
        $spol_id = $_POST['spol_id'];

        $sql = "INSERT INTO pacijent (ime, prezime, datum_rodjenja, adresa, kontakt_broj, kontakt_mail, Soba_id_sobe, Spol_id_spola)
        VALUES ('$ime', '$prezime', '$datum_rodjenja', '$adresa', '$kontakt_broj', '$kontakt_mail', $soba_id, $spol_id)";

        if ($conn->query($sql) === TRUE) {
            header('Location: ../../pacijenti.php');
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }

    }

    //header('Location: ../../pacijenti.php');
?> 