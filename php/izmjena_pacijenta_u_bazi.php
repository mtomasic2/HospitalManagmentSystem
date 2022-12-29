<?php
    if($_SESSION['user'] == 'admin'){

        if($_GET['id_pacijenta']!=null){
            $id_pacijenta = $_GET['id_pacijenta'];

            $sqlPacijent = "SELECT * FROM pacijent WHERE id_pacijenta={$id_pacijenta}";
            $sqlSobe = "SELECT * FROM soba";
            $sqlSpol = "SELECT * FROM spol";
    
            $resultPacijent = ($conn->query($sqlPacijent))->fetch_assoc();
            $resultSobe = $conn->query($sqlSobe);
            $resultSpol = $conn->query($sqlSpol);
        
?>

<section class="p-5">
    <div class="container p-0 m-0">
        <div class="row p-0 m-0">
            <div class="col-md-7 p-0 m-0">
                <form class="w-md-100" action="./php/rad_sa_bazom/izmjena_pacijenta_u_bazi_db.php" method="POST">
                    <h2>Izmjeni pacijenta</h2>
                    <input type="hidden" name="id_pacijenta" value="<?php echo $resultPacijent['id_pacijenta'];?>">
                    <div class="form-group my-3">
                        <label for="ime">Ime:</label>
                        <input class="form-control" type="text" name="ime" value="<?php echo $resultPacijent['ime'];?>">
                    </div>
                    <div class="form-group my-3">
                        <label for="prezime">Prezime:</label>
                        <input class="form-control" type="text" name="prezime" value="<?php echo $resultPacijent['prezime'];?>">
                    </div>
                    <div class="form-group my-3">
                        <label for="datum">Datum rođenja:</label>
                        <input class="form-control" type="date" name="datum" value="<?php echo $resultPacijent['datum_rodjenja'];?>">
                    </div>
                    <div class="form-group my-3">
                        <label for="adresa">Adresa stanovanja:</label>
                        <input class="form-control" type="text" name="adresa" value="<?php echo $resultPacijent['adresa'];?>">
                    </div>
                    <div class="form-group my-3">
                        <label for="kontakt_broj">Kontakt broj:</label>
                        <input class="form-control" type="text" name="kontakt_broj" value="<?php echo $resultPacijent['kontakt_broj'];?>">
                    </div>
                    <div class="form-group my-3"> 
                        <label for="kontakt_email">Kontakt email:</label>
                        <input class="form-control" type="text" name="kontakt_email" value="<?php echo $resultPacijent['kontakt_mail'];?>">
                    </div>
                    <div class="form-group my-3">
                        <label for="soba_id">Soba:</label>
                        <select name="soba_id" class="custom-select form-control">
                    
                        <?php while($row = $resultSobe->fetch_assoc()) { ?>

                            <option value="<?php echo $row["id_sobe"]; ?>" <?php if ($resultPacijent["Soba_id_sobe"] == $row["id_sobe"]) echo ' selected="selected"'; ?> ><?php echo "{$row["id_sobe"]} - {$row["kat"]}. kat"; ?></option>

                        <?php } ?>

                        </select>
                    </div>
                    <div class="form-group my-3">
                        <label for="spol_id">Spol:</label>
                        <select name="spol_id" class="custom-select form-control">
                    
                        <?php while($row = $resultSpol->fetch_assoc()) { ?>

                            <option value="<?php echo $row["id_spola"]; ?>" <?php if ($resultPacijent["Spol_id_spola"] == $row["id_spola"]) echo ' selected="selected"'; ?>><?php echo $row["naziv"]; ?></option>

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