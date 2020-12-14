<?php
class root
{
	function __construct()
	{
		mysql_connect('localhost','root','');
		mysql_select_db('rinookta');

	}
	public function tambah($kode_user,$kode_petugas,$kode_p,$nama_petugas,$alamat_petugas,$telp,$jenis_kelamin,$u_entry,$tgl_entri)
	{
		$foting=mysql_query("INSERT into t_user values('$kode_user','$kode_petugas','$nama_petugas','$nama_petugas','$nama_petugas','$tgl_entri','$u_entry','operator') ");
		$qtambah=mysql_query("INSERT INTO t_petugas values('$kode_petugas','$nama_petugas','$alamat_petugas','$telp','$jenis_kelamin','$u_entry','$tgl_entri');");
		if($foting && $qtambah)
		{
			header("location:../index.php?pilih=4.7");
		}
	}
	public function edit($kode_user,$kode_petugas,$kode_p,$nama_petugas,$alamat_petugas,$telp,$jenis_kelamin,$u_entry,$tgl_entri)
	{
		$qubah=mysql_query("UPDATE t_petugas SET nama_petugas='$nama_petugas',alamat_petugas='$alamat_petugas',no_telp='$telp',jenis_kelamin='$jenis_kelamin',u_entry='$u_entry',tgl_entri='$tgl_entri' WHERE kode_petugas='$kode_petugas'");
		$rion=mysql_query("UPDATE t_user set username='$nama_petugas',password='$nama_petugas' where kode_petugas='$kode_petugas' ");
			if($qubah && $rion){
				header("location:../index.php?pilih=4.7");
			}else{
				echo "Edit Data Gagal!!!";
			}
	}
	public function hapus($kode_user,$kode_petugas,$kode_p,$nama_petugas,$alamat_petugas,$telp,$jenis_kelamin,$u_entry,$tgl_entri)
	{
		$lo=mysql_query("DELETE FROM t_user WHERE kode_petugas='$kode_p'");
			$qdelete=mysql_query("DELETE FROM t_petugas WHERE kode_petugas='$kode_p'");
			if($qdelete){
				header("location:../index.php?pilih=4.7");
			}else{
				echo "Hapus Data Gagal!!!!";
			}
	}
}
?>