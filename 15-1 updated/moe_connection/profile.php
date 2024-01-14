<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: *");
header("Content-Type: application/json");

include 'config.php';

$json = file_get_contents('php://input');
  
//Decoding the received JSON and store into $obj variable.
$obj = json_decode($json,true);

if (isset($_GET['id'])) {
    // Assuming you have a table named 'users'
    $sql = "SELECT * FROM users WHERE id = ?";

    // Use prepared statement to prevent SQL injection
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $_GET['id']);

    if ($stmt->execute()) {
        $result = $stmt->get_result();
        $user = $result->fetch_assoc();

        // Return the user data as JSON
        header('Content-Type: application/json');
        echo json_encode($user);
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}


$stmt->close();
$conn->close();
?>
