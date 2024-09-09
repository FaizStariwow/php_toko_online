<?php
//make create user to database
include '../connection/connection.php';

//get data from formnya 
$username = $_POST['username'];
$password = $_POST['password'];

// action for insert data to database
$sql = "SELECT * FROM user WHERE username = '$username'";

$result = $conn->query($sql)->fetch_assoc();

session_start();
$_SESSION['username'] = $result['username'];
$_SESSION['name'] = $result['name'];
$_SESSION['email'] = $result['email'];
$_SESSION['loggedin'] = true;

if ($result['password'] == $password) {
    echo "<script>alert('Login Success');</script>";
    echo "<script>location.href='../pages/layout/layout.php';</script>";

} else {
    session_start();
    $_SESSION['message'] = "Username and Password is wrong";

    return header('location: ../pages/login_view.php');
}

echo $result;
