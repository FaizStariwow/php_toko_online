<?php
include '../../connection/connection.php';

$sql = "
    SELECT 
        user.nama AS user_nama, 
        produk.nama AS produk_nama, 
        transaksi.* 
    FROM 
        user 
    JOIN 
        transaksi ON transaksi.user_id = user.id 
    JOIN 
        produk ON transaksi.produk_id = produk.id
";

$result = $conn->query($sql);

if ($result->num_rows <= 0) {
    echo 'Data Tidak Ada';
}
