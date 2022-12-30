<?php
    if($_SESSION['user'] == 'admin'){
?>
    <section class="p-5">
        <h2>Pacijenti</h2>
        <?php
        //$sql = "SELECT * FROM pacijent";
        //$sql = "SELECT id_pacijenta, ime, prezime, naziv as spol FROM pacijent INNER JOIN spol";
        $sql = "SELECT id_pacijenta, ime, prezime, spol.naziv as spol, id_sobe, kat 
                FROM pacijent, spol, soba 
                WHERE pacijent.Spol_id_spola=spol.id_spola AND pacijent.Soba_id_sobe=soba.id_sobe 
                ORDER BY pacijent.id_pacijenta ASC";
        $result = $conn->query($sql);
        echo "<table class='table table-striped'>";
        if ($result->num_rows > 0) {
            echo 
                "<thead>
                    <tr>
                        <th scope='col'></th>
                        <th scope='col'>ID</th>
                        <th scope='col'>Ime</th>
                        <th scope='col'>Prezime</th>
                        <th scope='col'>Spol</th>
                        <th scope='col'>Soba</th>
                        <th scope='col'>Kat</th>
                        <th scope='col'></th>
                        <th scope='col'></th>
                        <th scope='col'></th>
                    </tr>
                </thead><tbody>";
            while($row = $result->fetch_assoc()) {
                //print_r($row);
                echo 
                    "<tr>
                        <td> </td>
                        <td> {$row["id_pacijenta"]} </td> 
                        <td> {$row["ime"]} </td> 
                        <td> {$row["prezime"]} </td> 
                        <td> {$row["spol"]} </td>
                        <td> {$row["id_sobe"]} </td>
                        <td> {$row["kat"]}. kat </td>"?>
                        <td> <a class='text-dark' onclick='return confirm("Jeste li sigurni da ovog pacijenta želite poslati kući?")' href='./php/rad_sa_bazom/posalji_kuci_db.php?id_pacijenta=<?php echo"{$row["id_pacijenta"]}'><i class='bi bi-house-down-fill'></i></a> </td>
                        <td> <a class='text-dark' href='./izmjeni_pacijenta.php?id_pacijenta={$row["id_pacijenta"]}'><i class='bi bi-pencil-square'></i></a> </td>
                        <td> <a class='text-dark' href='./unos_pregleda_pacijenta.php?id_pacijenta={$row["id_pacijenta"]}'><i class='bi bi-journal-medical'></i></a> </td>
                    <tr>";
            }
        } else {
            echo "0 redova";
        }
        echo "</tbody></table>";
        ?>
        <a href="./unos_pacijenta.php" class="btn btn-primary my-2">Unesi pacijenta</a>
    </section>

<?php
}else{
    header('Location: index.php');
    //header($_SERVER["SERVER_PROTOCOL"]." 404 Not Found", true, 404);
}
?>


