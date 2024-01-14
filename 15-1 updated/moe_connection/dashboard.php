<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: *");
header("Content-Type: application/json");

// Your database connection code
include 'config.php'; // Make sure to include your database configuration file

// Get the session ID from the Flutter app
$sessionId = $_POST['sessionId']; // Use POST or GET as needed

// Check if the session ID is valid in the sessions table
$checkSessionQuery = "SELECT * FROM sessions WHERE session_id = '$sessionId'";
$result = $conn->query($checkSessionQuery);

if ($result->num_rows > 0) {
    // Session is valid
    $row = $result->fetch_assoc();
    $userId = $row['user_id'];

    // Return user information as JSON response
    $response = array(
        'status' => 'success',
        'userId' => $userId,
    );
} else {
    // Session is not valid
    $response = array('status' => 'failure', 'message' => 'Invalid session');
}

// Return the response as JSON
header('Content-Type: application/json');
echo json_encode($response);

// Close the connection
$conn->close();
?>
