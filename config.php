<?php
$servername = "http://165.22.52.48/"; 
$username = "root"; 
$password = ""; 
$database = "moe_project"; 

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

?>
