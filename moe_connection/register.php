<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: *");
header("Content-Type: application/json");

// Your database connection code
include 'config.php';

// Get the user inputs
$name = $_POST['name'];
$icNumber = $_POST['ic_number'];
$email = $_POST['email'];
$password = password_hash($_POST['password'], PASSWORD_BCRYPT);

// Check if the email is already registered
$sqlCheckEmail = "SELECT * FROM users WHERE email='$email'";
$resultCheckEmail = $conn->query($sqlCheckEmail);

if ($resultCheckEmail->num_rows > 0) {
    $response = array('status' => 'error', 'message' => 'Email is already registered');
} else {
    // Insert the new user into the database
    $sql = "INSERT INTO users (name, ic_number, email, password) VALUES ('$name', '$icNumber', '$email', '$password')";
    if ($conn->query($sql) === TRUE) {
        $response = array('status' => 'success', 'message' => 'Registration successful');
    } else {
        $response = array('status' => 'error', 'message' => 'Error registering user');
    }
}

// Return the response as JSON
header('Content-Type: application/json');
echo json_encode($response);

// Close the connection
$conn->close();
?>
