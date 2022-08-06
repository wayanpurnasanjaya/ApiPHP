<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
include "koneksi.php";
$queryResult = $connect->query("SELECT * FROM tb_berita");
$result = array();
while ($fetch_data = $queryResult->fetch_assoc()) {
	$result[]=$fetch_data;
}
echo json_encode($result);
?>