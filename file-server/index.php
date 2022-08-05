<?php 
include("koneksi.php");
?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Website Berita</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  </head>
  <body>
    <h1>Berita Terbaru</h1>



    <table>
    	<thead>
    		<tr>
    			<th>No</th>
    			<th>Gambar</th>
    			<th>Judul</th>
    			<th>Isi</th>
    		</tr>
    	</thead>
    	<?php
   			$noa = 1;
			$informasi = mysqli_query($connect,"SELECT * FROM tb_berita ORDER BY id_berita ASC");
			if(mysqli_num_rows($informasi)>0){
				while ($p = mysqli_fetch_array($informasi)) {
				
			?>
    	<tbody>
    		<tr>
    			<td><?php echo $noa++; ?></td>
    			<td><?php echo $p['foto'];?></td>
    			<td><?php echo $p['judul'];?></td>
    			<td><?php echo $p['isi'];?></td>
    		</tr>
    	</tbody>
    <?php } }?>
    </table>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
  </body>
</html>