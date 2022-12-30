<?php
    if($_SESSION['user'] == 'admin'){
        if($_GET['id_pacijenta']!=null){
            $id_pacijenta = $_GET['id_pacijenta'];

            $sqlPacijent = "SELECT * FROM pacijent WHERE id_pacijenta={$id_pacijenta}";
            $sqlLijecnik = "SELECT id_lijecnika, ime, prezime, specijalizacija.naziv as specijalizacija
                            FROM lijecnik, specijalizacija
                            WHERE lijecnik.Specijalizacija_id_specijalizacije=specijalizacija.id_specijalizacije";

            $resultPacijent = ($conn->query($sqlPacijent))->fetch_assoc();
            $resultLijecnik = $conn->query($sqlLijecnik);
            

            
?>

<section class="p-5">
    <div class="container p-0 m-0">
        <div class="row p-0 m-0">
            <div class="col-md-7 p-0 m-0">
                <form class="w-md-100" action="./php/rad_sa_bazom/unos_pregleda_db.php" method="POST">
                    <h2>Unos pregleda pacijenta</h2>
                    <input type="hidden" name="id_pacijenta" value="<?php echo $resultPacijent['id_pacijenta'];?>">
                    <div class="form-group my-3">
                        <label for="ime">Ime:</label>
                        <input class="form-control " type="text" name="ime" value="<?php echo $resultPacijent['ime'];?>" readonly>
                    </div>
                    <div class="form-group my-3">
                        <label for="prezime">Prezime:</label>
                        <input class="form-control" type="text" name="prezime" value="<?php echo $resultPacijent['prezime'];?>" readonly>
                    </div>
                    <div class="form-group my-3">
                        <label for="datum_pregleda">Datum pregleda:</label>
                        <input class="form-control" type="date" name="datum_pregleda">
                    </div>
                    <div class="form-group my-3">
                        <label for="id_lijecnika">Lijecnik:</label>
                        <select name="id_lijecnika" class="custom-select form-control">
                    
                        <?php while($row = $resultLijecnik->fetch_assoc()) { ?>

                            <option value="<?php echo $row["id_lijecnika"]; ?>"><?php echo "{$row["ime"]} {$row["prezime"]} - {$row["specijalizacija"]}" ; ?></option>

                        <?php } ?>

                        </select>
                    </div>
                    <div class="form-group my-3">
                        <input type="submit" name="submit" value="Unesi pregled" class="btn btn-primary">
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