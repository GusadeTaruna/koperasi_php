<?php
include "../config/koneksi.php";
$kode_t=$_POST['kode_tabungan'];
$kode_a=$_POST['kode_anggota'];
$besar=$_POST['besar_ambil'];
$saldo=$_POST['saldo'];
$date=date("Y-m-d");
if($besar>$saldo)
{ ?>
	<script>alert("Maaf Saldo tidak cukup");window.location="../index.php?pilih=1.3";</script>
<?php }
else
{
	$siso=$saldo-$besar;
	mysql_query("UPDATE t_tabungan set besar_tabungan='$siso' where kode_tabungan='$kode_t' and kode_anggota='$kode_a'");
	$dfop=mysql_query("INSERT into t_pengambilan values('','$kode_a','$kode_t','$besar','$date')");?>
<script>window.open('notaambil.php?kode_anggota=<?php echo $kode_a; ?>&kode_tabungan=<?php echo $kode_t; ?>&besar_ambil=<?php echo $besar; ?>','popuppage','width=500,toolbar=1,resizable=1,scrollbars=yes,height=450,top=30,left=100');

window.location="../index.php?pilih=1.3";</script>
<?php }
?>