<?php 
	include "config/koneksi.php";
	include "fungsi/fungsi.php";
  $aksi=$_GET['aksi'];
?>

<?php
if(empty($aksi))
{
    $ghu=mysql_query("SELECT * FROM t_tabungan");
$no=1;
while($dataku=mysql_fetch_array($ghu))
{
  $fgh=$dataku['tgl_mulai'];$tang=date("Y-m-d");$kode_tab=$dataku['kode_tabungan'];
  $tempo=date('Y-m-d',strtotime('+30 day',strtotime($fgh)));
  if($tempo==$tang)
  {
    $total=$dataku['besar_tabungan']+10000;
    $tol=mysql_query("UPDATE t_tabungan set tgl_mulai='$tang',besar_tabungan='$total' where kode_tabungan='$kode_tab'");
  }
  else
  {
    
  }
  $no++;
}
?>
<script language="javascript" type="text/javascript" src="js/niceforms.js"></script>
<script language="javascript" type="text/javascript" src="js/validasi.js"></script>
<link rel="stylesheet" type="text/css" href="css/theme1.css" />

</head>
<body>  
<div class="row mt">
 <div class="col-lg-12">
  <div class="form-panel">
   <h4 class="mb"><span class='glyphicon glyphicon-briefcase'></span> Data Tabungan
     <?php
      $am=mysql_query("select*from t_tabungan");
        $jum=mysql_num_rows($am);
         echo'<kbd style="background-color:#d9534f;">'.$jum.'</kbd>';?>
         <span style="float:right;">
<a href="laporan/print_tabungan.php" target="_blank" class="btn btn-primary"><span class='glyphicon glyphicon-print'></span> Print</a> 
                    </span>
  </h4>
<form class="form-inline" role="form">
<table class="table table-bordered table-striped table-condensed">
    <thead>
		<tr class="info">
             <th><a href="#">No</a></th>
             <th><a href="#">Kode Tabungan</a></th>
             <th><a href="#">Kode Anggota</a></th>
             <th><a href="#">Nama Anggota</a></th>
             <th><a href="#">Investasi (1 bulan)</a></th>
             <th><a href="#">Jumlah Saldo</a></th>
              <th><a href="#">Aksi</a></th>
       	</tr>
		
    </thead><tbody>
<?php
	$query=mysql_query("SELECT * FROM t_tabungan order by kode_tabungan desc");
	$no=1;
	while($data=mysql_fetch_array($query)){
?>
    
    	<tr>
			<td><?php echo $no;?></td>
            <td><?php echo $data['kode_tabungan'];echo'</td>
            <td>';echo $d=$data['kode_anggota'];echo'</td>';
            $d=$data['kode_anggota'];$f=mysql_fetch_array(mysql_query("SELECT nama_anggota from t_anggota where Kode_anggota='$d'")); $rty=mysql_fetch_array(mysql_query("SELECT sum(besar_simpanan) as total_asli from t_simpan where Kode_anggota='$d'")); $inves=$data['besar_tabungan']-$rty['total_asli'];?>
            <td><?php echo $f['nama_anggota'];?></td>
            <td><?php echo $data['tgl_mulai'];?> s/d <?php echo $tempo=date('Y-m-d',strtotime('+30 day',strtotime($data['tgl_mulai'])));?></td>
            <td><?php echo Rp($data['besar_tabungan']);?></td> 
            <td><a class="btn btn-danger btn-xs" href="index.php?pilih=1.3&aksi=viewambil&kode_tabungan=<?php echo $data['kode_tabungan'];?>&kode_anggota=<?php echo $d;?>"><i class="fa fa-dollar"></i> Ambil Uang</a></td>
        </tr> 
	   
<?php
	$no++;} //tutup while
?>
<tr  class="info"><td colspan="5" align="center">Total</td>
  <td colspan="2"><?php $bu=mysql_fetch_array(mysql_query("SELECT sum(besar_tabungan) as besar_tab from t_tabungan")); echo number_format($bu['besar_tab']);
  echo '</td>';?>
</tr></tbody></table></form></div></div></div>
<?php } 
else if($aksi=='ambiluang')
{
  $lo=$_GET['kode_tabungan'];$luy=$_GET['kode_anggota'];
?>
<div class="row mt">
     <div class="col-lg-12">
        <div class="form-panel" style="width:50%;">
            <h4 class="mb"><span class='glyphicon glyphicon-briefcase'></span> Ambil Uang</h4>
    <form action="anggota/proses_tabungan.php" method="post">
      <div class="form-group">
            <label>Kode Tabungan</label>
            <input type="text" name="kode_tabungan" readonly class="form-control" value="<?php echo $lo;?>">
        </div>
        <div class="form-group">
            <label>Kode Anggota</label>
            <input type="text" name="kode_anggota" class="form-control" readonly value="<?php echo $luy;?>"/>
        </div>
        <div class="form-group">
            <label>Saldo</label>
            <?php $rtyu=mysql_fetch_array(mysql_query("SELECT *FROM t_tabungan where kode_tabungan='$lo' and kode_anggota='$luy'")); ?>
            <input type="text" name="saldo" class="form-control" readonly value="<?php echo $rtyu['besar_tabungan'];?>"/>
        </div>
        <div class="form-group">
            <label>Besar Pengambilan</label>
           <input type="text" name="besar_ambil" class="form-control"/>
        </div>
        <button class="btn btn-danger"><span class='glyphicon glyphicon-check'></span> Ambil Uang</button>
         <button id='hapus' class='btn btn-primary' onClick="self.history.back()"><span class='glyphicon glyphicon-chevron-left'></span> Kembali</button>
 </form>

</div>
</div>
</div>

<?php }
else if($aksi=='viewambil')
{ $lo=$_GET['kode_tabungan'];$luy=$_GET['kode_anggota'];$nama=mysql_fetch_array(mysql_query("SELECT nama_anggota from t_anggota where Kode_anggota='$luy'")); ?>
 <div class="row mt">
 <div class="col-lg-12">
  <div class="form-panel">
   <h4 class="mb"><span class='glyphicon glyphicon-briefcase'></span> Data Pengambilan Uang "<?php echo $nama['nama_anggota']; ?>"
   <span style="float:right;">
<a class="btn btn-danger" href="index.php?pilih=1.3&aksi=ambiluang&kode_tabungan=<?php echo $lo;?>&kode_anggota=<?php echo $luy;?>"><i class="fa fa-dollar"></i> Ambil Uang</a>
</span>
   </h4>
   <form class="form-inline" role="form">
<table class="table table-bordered table-striped table-condensed">
    <thead>
    <tr class="info">
             <th><a href="#">No</a></th>
             <th><a href="#">Kode Ambil</a></th>
             <th><a href="#">Kode Anggota</a></th>
             <th><a href="#">Nama Anggota</a></th>
             <th><a href="#">Kode Tabungan</a></th>
             <th><a href="#">Besar Ambil</a></th>
             <th><a href="#">Tanggal Ambil</a></th>
        </tr>
    
    </thead><tbody>
<?php
  $query=mysql_query("SELECT * FROM t_pengambilan where kode_anggota='$luy' and kode_tabungan='$lo' order by kode_ambil desc");
  $no=1;
  while($data=mysql_fetch_array($query)){
?>
    
      <tr>
      <td><?php echo $no;?></td>
            <td><?php echo $data['kode_ambil'];echo'</td>
            <td>';echo $d=$data['kode_anggota'];echo'</td>';
            $d=$data['kode_anggota'];$f=mysql_fetch_array(mysql_query("SELECT nama_anggota from t_anggota where Kode_anggota='$d'")); $rty=mysql_fetch_array(mysql_query("SELECT sum(besar_simpanan) as total_asli from t_simpan where Kode_anggota='$d'")); $inves=$data['besar_tabungan']-$rty['total_asli'];?>
            <td><?php echo $f['nama_anggota'];?></td>
            <td><?php echo $data['kode_tabungan'];?></td>
            <td><?php echo $data['besar_ambil'];?></td>
            <td><?php echo $data['tgl_ambil'];?></td>
      </tr> 
     
<?php
  $no++;} //tutup while
?>
<tr  class="info"><td colspan="5"a align="center">Total</td>
  <td colspan="2"><?php $bu=mysql_fetch_array(mysql_query("SELECT sum(besar_ambil) as besar_ambil from t_pengambilan where kode_anggota='$luy'")); echo $bu['besar_ambil'];
  echo '</td>';?>
</tr>
</tbody></table></form></div></div></div>
<?php }
 ?>
