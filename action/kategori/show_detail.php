<?php 
    include '../../connection/connection.php';

    $id = $_GET['id'];
    
    $sql = "SELECT * FROM kategori_produk WHERE id=$id";

    $result = $conn->query($sql);


    if($result->num_rows > 0){
        $data = $result->fetch_assoc();
    }