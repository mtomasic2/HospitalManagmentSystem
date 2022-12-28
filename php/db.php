<?php
include_once "php/functions.php";

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "hotelmanagmentsystem";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}else{
  //echo "Connected successfully\n";
  //print_r($conn);
}
?>