<?php
    if($_SESSION['user'] == 'admin'){

        $sqlSobe = "SELECT * FROM soba";
        $sqlSpol = "SELECT * FROM spol";
        $resultSobe = $conn->query($sqlSobe);
        $resultSpol = $conn->query($sqlSpol);
?>

<section class="p-5">
    <div class="container p-0 m-0">
        <div class="row p-0 m-0">
            <div class="col-md-7 p-0 m-0">
                <form class="w-md-100" action="./php/rad_sa_bazom/unos_pacijenta_u_bazu_db.php" method="POST">
                    <h2>Unesi pacijenta</h2>
                    <div class="form-group my-3">
                        <label for="ime">Ime:</label>
                        <input class="form-control" type="text" name="ime">
                    </div>
                    <div class="form-group my-3">
                        <label for="prezime">Prezime:</label>
                        <input class="form-control" type="text" name="prezime">
                    </div>
                    <div class="form-group my-3">
                        <label for="datum">Datum rođenja:</label>
                        <input class="form-control" type="date" name="datum">
                    </div>
                    <div class="form-group my-3">
                        <label for="adresa">Adresa stanovanja:</label>
                        <input class="form-control" type="text" name="adresa">
                    </div>
                    <div class="form-group my-3">
                        <label for="kontakt_broj">Kontakt broj:</label>
                        <input class="form-control" type="text" name="kontakt_broj">
                    </div>
                    <div class="form-group my-3"> 
                        <label for="kontakt_email">Kontakt email:</label>
                        <input class="form-control" type="text" name="kontakt_email">
                    </div>
                    <div class="form-group my-3">
                        <label for="soba_id">Soba:</label>
                        <select name="soba_id" class="custom-select form-control">
                    
                        <?php while($row = $resultSobe->fetch_assoc()) { ?>

                            <option value="<?php echo $row["id_sobe"]; ?>"><?php echo "{$row["id_sobe"]} - {$row["kat"]}. kat"; ?></option>

                        <?php } ?>

                        </select>
                    </div>
                    <div class="form-group my-3">
                        <label for="spol_id">Spol:</label>
                        <select name="spol_id" class="custom-select form-control">
                    
                        <?php while($row = $resultSpol->fetch_assoc()) { ?>

                            <option value="<?php echo $row["id_spola"]; ?>"><?php echo $row["naziv"]; ?></option>

                        <?php } ?>

                        </select>
                    </div>
                    <div class="form-group my-3">
                        <input type="submit" name="submit" value="Unesi pacijenta" class="btn btn-primary">
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<?php
}else{
    header('Location: index.php');
}
?>