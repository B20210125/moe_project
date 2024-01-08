<?php
$servername = "http://165.22.52.48/"; 
$username = "admin"; 
$password = "421cc5e439fb33cc5b0e2bc0226f61d13c24ef707fb05339"; 
$database = "moe_project"; 

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

?>
