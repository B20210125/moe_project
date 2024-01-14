<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: *");
header("Content-Type: application/json");

// Your database connection code
include 'config.php';

$query = "SELECT * FROM users";
$result = mysqli_query($conn, $query);

if ($result->num_rows > 0) {
    // Fetch data as an associative array
    $data = array();
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }

    // Return data as JSON
    echo json_encode($data);
} else {
    // No results
    echo json_encode(array("message" => "No data found"));
}
?>
