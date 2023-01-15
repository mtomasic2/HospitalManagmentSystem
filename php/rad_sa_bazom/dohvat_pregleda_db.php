<?php
    if($_SESSION['user'] == 'admin'){
?>
    <section class="p-5">
        <?php

            $sql_nadolazeci_pregledi = "SELECT pr.id_pregleda, pr.datum_termina_pregleda as datum_pregleda, s_p.naziv as status_pregleda, l.ime as ime_lijecnika, l.prezime as prezime_lijecnika,p.ime as ime_pacijenta, p.prezime as prezime_pacijenta 
                    FROM pregled as pr, status_pregleda as s_p, lijecnik as l, pacijent as p
                    WHERE CURDATE() <= pr.datum_termina_pregleda AND pr.Status_pregleda_id_statusa_pregleda=2 AND pr.Status_pregleda_id_statusa_pregleda=s_p.id_statusa_pregleda AND pr.Lijecnik_lijecnik_id=l.id_lijecnika AND pr.pacijent_id_pacijenta=p.id_pacijenta
                    ORDER BY datum_pregleda ASC";

            $sql_obavljeni_pregledi = "SELECT pr.id_pregleda, pr.datum_termina_pregleda as datum_pregleda, s_p.naziv as status_pregleda, l.ime as ime_lijecnika, l.prezime as prezime_lijecnika,p.ime as ime_pacijenta, p.prezime as prezime_pacijenta 
                    FROM pregled as pr, status_pregleda as s_p, lijecnik as l, pacijent as p
                    WHERE pr.Status_pregleda_id_statusa_pregleda=1 AND pr.Status_pregleda_id_statusa_pregleda=s_p.id_statusa_pregleda AND pr.Lijecnik_lijecnik_id=l.id_lijecnika AND pr.pacijent_id_pacijenta=p.id_pacijenta
                    ORDER BY datum_pregleda desc";

            $result_nadolazeci_pregledi = $conn->query($sql_nadolazeci_pregledi);
            $result_obavljeni_pregledi = $conn->query($sql_obavljeni_pregledi);
        ?>
        <h2>Nadolazeći pregledi</h2>
        <?php
            echo "<table class='table table-striped'>";
            if ($result_nadolazeci_pregledi->num_rows > 0) {
                echo 
                    "<thead>
                        <tr>
                            <th scope='col'></th>
                            <th scope='col'>Datum pregleda</th>
                            <th scope='col'>Ime pacijenta</th>
                            <th scope='col'>Prezime pacijenta</th>
                            <th scope='col'>Liječnik</th>
                            <th scope='col'>Status pregleda</th>
                            <th scope='col'></th>
                            <th scope='col'></th>
                        </tr>
                    </thead><tbody>";
                while($row = $result_nadolazeci_pregledi->fetch_assoc()) {
                    $timestamp = strtotime($row["datum_pregleda"]);
                    $formattedDate = date("d. m. Y", $timestamp);
                    //print_r($row);
                    echo 
                        "<tr>
                            <td> </td>
                            <td> {$formattedDate} </td> 
                            <td> {$row["ime_pacijenta"]} </td> 
                            <td> {$row["prezime_pacijenta"]} </td> 
                            <td> {$row["ime_lijecnika"]} {$row["prezime_lijecnika"]} </td>
                            <td> {$row["status_pregleda"]} </td>
                            <td> <a href='./obavljanje_pregleda.php?id_pregleda={$row['id_pregleda']}' class='text-dark'><i class='bi bi-check-square'></i></a> </td>
                            <td>  </td>
                        <tr>";
                }
        }
            echo "</tbody></table>";
        ?>

        <h2>Obavljeni pregledi</h2>
        <?php
            echo "<table class='table table-striped'>";
            if ($result_obavljeni_pregledi->num_rows > 0) {
                echo 
                    "<thead>
                        <tr>
                            <th scope='col'></th>
                            <th scope='col'>Datum pregleda</th>
                            <th scope='col'>Ime pacijenta</th>
                            <th scope='col'>Prezime pacijenta</th>
                            <th scope='col'>Liječnik</th>
                            <th scope='col'>Status pregleda</th>
                            <th scope='col'></th>
                            <th scope='col'></th>
                        </tr>
                    </thead><tbody>";
                while($row = $result_obavljeni_pregledi->fetch_assoc()) {
                    $timestamp = strtotime($row["datum_pregleda"]);
                    $formattedDate = date("d. m. Y", $timestamp);
                    //print_r($row);
                    echo 
                        "<tr>
                            <td> </td>
                            <td> {$formattedDate} </td> 
                            <td> {$row["ime_pacijenta"]} </td> 
                            <td> {$row["prezime_pacijenta"]} </td> 
                            <td> {$row["ime_lijecnika"]} {$row["prezime_lijecnika"]} </td>
                            <td> {$row["status_pregleda"]} </td>
                            <td> <a href='./obavljanje_pregleda.php?id_pregleda={$row['id_pregleda']}' class='text-dark'><i class='bi bi-check-square'></i></a> </td>
                            <td>  </td>
                        <tr>";
                }
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