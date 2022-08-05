<?php 
include "koneksi.php";
$sql = "SELECT * FROM tb_berita";
$result = $koneksi->query($sql);
if($result->num_rows>0){
	$res["is_succes"]=true;
	$res["message"]="Berhasil menampilkan data";
	$res["data"]= array();
	while($row = $result->fetch_assoc()){
		$res["data"][]=$row;
	}
}else{
	$res["is_succes"]=false;
	$res["message"]="gagal tampil";
	$res["data"]=null;

}
echo json_encode($res);
?>