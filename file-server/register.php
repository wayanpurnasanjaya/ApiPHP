<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
include "koneksi.php";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
$response = array();
$username = $_POST["username"];
$email = $_POST["email"];
$full_name = $_POST["full_name"];
$password = md5($_POST["password"]);

$_cek = "select * from tb_user where username ='$username' and email ='$email'";
$result = mysqli_fetch_array(mysqli_query($connect, $_cek));
if (isset($result)) {
$response["value"] = 2;
$response["message"] = "Username atau email telah digunakan";
echo json_encode($response);
} else {
$insert = "insert into tb_user value(null,'$username','$email','$full_name','$password',NOW())";
if (mysqli_query($connect, $insert)) {
$response["value"] = 1;
$response["message"] = "Berhasil didaftarkan";
echo json_encode($response);
} else {
	$response["value"] = 1;
$response["message"] = "Gagal didaftarkan";
echo json_encode($response);
}
}
}