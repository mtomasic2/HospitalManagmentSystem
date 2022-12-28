<?php
    if($_SESSION['user'] == 'admin'){

        $sqlSobe = "SELECT * FROM soba";
        $sqlSpol = "SELECT * FROM spol";
        $resultSobe = $conn->query($sqlSobe);
        $resultSpol = $conn->query($sqlSpol);
?>

<section>
    <form action="./php/rad_sa_bazom/unos_pacijenta_u_bazu_db.php" method="POST">
        <div>
            <label for="ime">Ime:</label>
            <input type="text" name="ime">
        </div>
        <div>
            <label for="prezime">Prezime:</label>
            <input type="text" name="prezime">
        </div>
        <div>
            <label for="datum">Datum rođenja:</label>
            <input type="date" name="datum">
        </div>
        <div>
            <label for="adresa">Adresa stanovanja:</label>
            <input type="text" name="adresa">
        </div>
        <div>
            <label for="kontakt_broj">Kontakt broj:</label>
            <input type="text" name="kontakt_broj">
        </div>
        <div>
            <label for="kontakt_email">Kontakt email:</label>
            <input type="text" name="kontakt_email">
        </div>
        <div>
            <label for="soba_id">Soba:</label>
            <select name="soba_id">
        
            <?php while($row = $resultSobe->fetch_assoc()) { ?>

                <option value="<?php echo $row["id_sobe"]; ?>"><?php echo $row["id_sobe"]; ?></option>

            <?php } ?>

            </select>
        </div>
        <div>
            <label for="spol_id">Spol:</label>
            <select name="spol_id">
        
            <?php while($row = $resultSpol->fetch_assoc()) { ?>

                <option value="<?php echo $row["id_spola"]; ?>"><?php echo $row["naziv"]; ?></option>

            <?php } ?>

            </select>
        </div>
        <input type="submit" name="submit" value="Unesi pacijenta">
    </form>
</section>

<?php
}else{
    header('Location: index.php');
}
?>