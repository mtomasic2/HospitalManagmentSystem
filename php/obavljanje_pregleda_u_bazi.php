<?php
    $redirect = false;

    if($_SESSION['user'] == 'admin'){
        if($_GET['id_pregleda']!=null){
            
            $id_pregleda = $_GET['id_pregleda'];
            $sql_postojeci_pregled = "SELECT * FROM pregled WHERE id_pregleda=$id_pregleda";
            $result_postojeci_pregled = $conn->query($sql_postojeci_pregled)->fetch_assoc();
            $pregled_status = $result_postojeci_pregled['Status_pregleda_id_statusa_pregleda'];

            if($result_postojeci_pregled && $pregled_status==2){
                $sql_pregled = "SELECT pa.ime, pa.prezime, pr.datum_termina_pregleda FROM pacijent pa 
                JOIN pregled pr ON pr.pacijent_id_pacijenta = pa.id_pacijenta
                WHERE pr.id_pregleda = $id_pregleda"; 
                $sql_simptomi = "SELECT * FROM simptom";
                $sql_lijekovi = "SELECT * FROM lijek";

                $result_pregled = ($conn->query($sql_pregled))->fetch_assoc();
                $result_simptom = $conn->query($sql_simptomi);  
                $result_lijek = $conn->query($sql_lijekovi);
            
?>
                <section class="p-5">
                    <div class="container p-0 m-0">
                        <div class="row p-0 m-0">
                            <div class="col-md-7 p-0 m-0">
                                <form class="w-md-100" action="./php/rad_sa_bazom/obavi_pregled_db.php" method="POST">
                                    <h2>Pregled pod brojem <?php echo $_GET['id_pregleda']; ?> </h2>
                                    <div class="form-group my-3">
                                        <input class="form-control" type="hidden" name="id_pregleda" value="<?php echo $id_pregleda;?>">
                                    </div>
                                    <div class="form-group my-3">
                                        <label for="datum">Datum pregleda:</label>
                                        <input class="form-control" type="date" name="datum" value="<?php echo $result_pregled['datum_termina_pregleda'];?>" disabled>
                                    </div>
                                    <div class="form-group my-3">
                                        <label for="ime">Ime:</label>
                                        <input class="form-control" type="text" name="ime" value="<?php echo $result_pregled['ime'];?>" disabled>
                                    </div>
                                    <div class="form-group my-3">
                                        <label for="prezime">Prezime:</label>
                                        <input class="form-control" type="text" name="prezime" value="<?php echo $result_pregled['prezime'];?>" disabled>
                                    </div>
                                    <div class="form-group my-3">
                                        <label for="simptomi">Simptomi:</label><br>
                                        <select data-placeholder="Unesite simptome" multiple class="form-control chosen-select"  name="simptomi[]">
                                            <?php 
                                            while($row = $result_simptom->fetch_assoc()) {
                                            ?>
                                                <option class="form-control" value="<?php echo $row['id_simptoma'];?>"><?php echo $row['naziv'];?></option>
                                            <?php 
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <div class="form-group my-3">
                                        <label for="dijagnoza_naziv">Dijagnoza:</label>
                                        <input class="form-control" type="text" name="dijagnoza_naziv">
                                    </div>
                                    <div class="form-group my-3">
                                        <label for="dijagnoza_misljenje">Misljenje:</label>
                                        <input class="form-control" type="text" name="dijagnoza_misljenje">
                                    </div>
                                    <div class="form-group my-3">
                                        <label for="simptomi">Lijekovi:</label><br>
                                        <select data-placeholder="Unesite lijekove" multiple class="form-control chosen-select"  name="lijekovi[]">
                                            <?php 
                                            while($row = $result_lijek->fetch_assoc()) {
                                            ?>
                                                <option class="form-control" value="<?php echo $row['id_lijeka'];?>"><?php echo $row['naziv'];?></option>
                                            <?php 
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <div class="form-group my-3">
                                        <input type="submit" name="submit" value="Obavi pregled" class="btn btn-primary">
                                    </div>
                                </form>
                            </div>
                        </div>      
                    </div>
                </section> 
<?php   

            }else{
                header('Location: ./pregledi.php');
            }
        }
        else{
            $redirect = true;
        }
    }else{
        $redirect = true;
    }

    if($redirect){
        header('Location: ./index.php');
    }
?>