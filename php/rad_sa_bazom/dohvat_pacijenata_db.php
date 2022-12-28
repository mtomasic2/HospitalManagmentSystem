<?php
    if($_SESSION['user'] == 'admin'){
?>
    <section class="sekcija_pacijenti">
        <h2>Pacijenti</h2>
        <a href="./unos_pacijenta.php" class="btn btn-primary my-2">Unesi pacijenta</a>
        <?php
        //$sql = "SELECT * FROM pacijent";
        //$sql = "SELECT id_pacijenta, ime, prezime, naziv as spol FROM pacijent INNER JOIN spol";
        $sql = "SELECT id_pacijenta, ime, prezime, naziv as spol FROM pacijent, spol WHERE pacijent.Spol_id_spola=spol.id_spola";
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
                        <td> </td>
                    <tr>";
            }
        } else {
            echo "0 results";
        }
        echo "</tbody></table>";
        ?>
    </section>

<?php
}else{
    header('Location: index.php');
    //header($_SERVER["SERVER_PROTOCOL"]." 404 Not Found", true, 404);
}
?>

