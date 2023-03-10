<?php
    if($_SESSION['user'] == 'admin'){

        $sql_spol = "SELECT * FROM spol";
        $sql_sobe = "SELECT s.id_sobe,s.kat,s.kapacitet, COUNT(p.id_pacijenta) AS popunjenost
                            FROM soba s
                            LEFT JOIN pacijent p ON s.id_sobe = p.Soba_id_sobe
                            GROUP BY s.id_sobe";

        $result_spol = $conn->query($sql_spol);
        $result_sobe = $conn->query($sql_sobe);
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
                            
                                <?php while($row = $result_sobe->fetch_assoc()) { 
                                    $prikaz_slobodne_sobe = ($row["popunjenost"] >= $row["kapacitet"]) ? "d-none" : "d-block";
                                ?>
                                    <option class="<?php echo $prikaz_slobodne_sobe;?>" value="<?php echo $row["id_sobe"]; ?>"><?php echo "{$row["id_sobe"]} - {$row["kat"]}. kat ({$row["popunjenost"]}/{$row["kapacitet"]})"; ?></option>

                                <?php } ?>

                                </select>
                            </div>
                            <div class="form-group my-3">
                                <label for="spol_id">Spol:</label>
                                <select name="spol_id" class="custom-select form-control">
                            
                                <?php while($row = $result_spol->fetch_assoc()) { ?>

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