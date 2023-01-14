<?php
    if($_SESSION['user'] == 'admin'){

        if($_GET['id_pacijenta']!=null){
            $id_pacijenta = $_GET['id_pacijenta'];

            $sql_pacijent = "SELECT * FROM pacijent WHERE id_pacijenta={$id_pacijenta}";
            $sql_spol = "SELECT * FROM spol";
            $sql_sobe = "SELECT s.id_sobe,s.kat,s.kapacitet, COUNT(p.id_pacijenta) AS popunjenost
                            FROM soba s
                            LEFT JOIN pacijent p ON s.id_sobe = p.Soba_id_sobe
                            GROUP BY s.id_sobe";
    
            $result_pacijent = ($conn->query($sql_pacijent))->fetch_assoc();
            $result_sobe = $conn->query($sql_sobe);
            $result_spol = $conn->query($sql_spol);
        
?>

    <section class="p-5">
        <div class="container p-0 m-0">
            <div class="row p-0 m-0">
                <div class="col-md-7 p-0 m-0">
                    <form class="w-md-100" action="./php/rad_sa_bazom/izmjena_pacijenta_u_bazi_db.php" method="POST">
                        <h2>Izmjeni pacijenta</h2>
                        <input type="hidden" name="id_pacijenta" value="<?php echo $result_pacijent['id_pacijenta'];?>">
                        <div class="form-group my-3">
                            <label for="ime">Ime:</label>
                            <input class="form-control" type="text" name="ime" value="<?php echo $result_pacijent['ime'];?>">
                        </div>
                        <div class="form-group my-3">
                            <label for="prezime">Prezime:</label>
                            <input class="form-control" type="text" name="prezime" value="<?php echo $result_pacijent['prezime'];?>">
                        </div>
                        <div class="form-group my-3">
                            <label for="datum">Datum rođenja:</label>
                            <input class="form-control" type="date" name="datum" value="<?php echo $result_pacijent['datum_rodjenja'];?>">
                        </div>
                        <div class="form-group my-3">
                            <label for="adresa">Adresa stanovanja:</label>
                            <input class="form-control" type="text" name="adresa" value="<?php echo $result_pacijent['adresa'];?>">
                        </div>
                        <div class="form-group my-3">
                            <label for="kontakt_broj">Kontakt broj:</label>
                            <input class="form-control" type="text" name="kontakt_broj" value="<?php echo $result_pacijent['kontakt_broj'];?>">
                        </div>
                        <div class="form-group my-3"> 
                            <label for="kontakt_email">Kontakt email:</label>
                            <input class="form-control" type="text" name="kontakt_email" value="<?php echo $result_pacijent['kontakt_mail'];?>">
                        </div>
                        <div class="form-group my-3">
                            <label for="soba_id">Soba:</label>
                            <select name="soba_id" class="custom-select form-control">
                        
                            <?php while($row = $result_sobe->fetch_assoc()) { 
                                $prikaz_slobodne_sobe = (($row["popunjenost"] < $row["kapacitet"]) || ($result_pacijent["Soba_id_sobe"] == $row["id_sobe"])) ? "d-block" : "d-none";
                                $odabrana_soba = ($result_pacijent["Soba_id_sobe"] == $row["id_sobe"]) ? ' selected="selected"' : '';
                            ?>

                                <option class="<?php echo $prikaz_slobodne_sobe;?>" value="<?php echo $row["id_sobe"]; ?>" <?php echo $odabrana_soba;?> ><?php echo "{$row["id_sobe"]} - {$row["kat"]}. kat ({$row["popunjenost"]}/{$row["kapacitet"]})"; ?></option>

                            <?php } ?>

                            </select>
                        </div>
                        <div class="form-group my-3">
                            <label for="spol_id">Spol:</label>
                            <select name="spol_id" class="custom-select form-control">
                        
                            <?php while($row = $result_spol->fetch_assoc()) { ?>

                                <option value="<?php echo $row["id_spola"]; ?>" <?php if ($result_pacijent["Spol_id_spola"] == $row["id_spola"]) echo ' selected="selected"'; ?>><?php echo $row["naziv"]; ?></option>

                            <?php } ?>

                            </select>
                        </div>
                        <div class="form-group my-3">
                            <input type="submit" name="update" value="Izmjena pacijenta" class="btn btn-primary">
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
    }else{
        header('Location: index.php');
    }
?>