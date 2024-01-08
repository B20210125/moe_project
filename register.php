<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: *");
header("Content-Type: application/json");

// Your database connection code
include 'config.php';

// Check if the necessary parameters are set
if (isset($_POST['name']) && isset($_POST['email']) && isset($_POST['password'])) {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT); // Hash the password
    $date = date('d-m-y H:i:s');

    // Insert user data into the database
    $insertQuery = "INSERT INTO users (name, email, password, type, date_created) VALUES ('$name', '$email', '$password', 'user', '$date')";

    if ($conn->query($insertQuery) === TRUE) {
        echo json_encode(['message' => 'Registration successful']);
    } else {
        echo json_encode(['error' => 'Error registering user: ' . $conn->error]);
    }
} else {
    echo json_encode(['error' => 'Required parameters are missing']);
}

// Close the database connection
$conn->close();
?>
