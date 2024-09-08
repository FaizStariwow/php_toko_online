<?php 
// koneksi
include '../../connection/connection.php';

// data dari form
$id = $_POST['id'];
$user_id = $_POST['user_id'];
$produk_id = $_POST['produk_id'];
$pembayaran_id = $_POST['pembayaran_id'];
$alamat_pengiriman = $_POST['alamat_pengiriman'];
$total_harga = $_POST['total_harga'];
$jumlah = $_POST['jumlah'];
$tgl_transaksi = $_POST['tgl_transaksi'];
$status = $_POST['status'];

// query
$sql = "UPDATE transaksi SET user_id = '$user_id', produk_id = '$produk_id', pembayaran_id = '$pembayaran_id', alamat_pengiriman = '$alamat_pengiriman', total_harga = '$total_harga', jumlah = '$jumlah', tgl_transaksi = '$tgl_transaksi', status = '$status' WHERE id = $id";

// jalankan query
//responnya apa dan kemana
if($conn->query($sql) === TRUE){
    session_start();
    $_SESSION['msg'] = 'Update transaksi Success';
    header('Location:../../pages/transaksi/index.php');
}else{
    session_start();
    $_SESSION['msg_err'] = 'Update transaksi Failed';
    header('Location:../../pages/transaksi/index.php');
}




?>