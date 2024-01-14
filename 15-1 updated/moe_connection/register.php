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
$confirmPassword = password_hash($_POST['confirmpassword'], PASSWORD_BCRYPT);
$termsConditions = $_POST['acceptTerms'];

$icColor = $_POST['icColor'];
$birthDate = $_POST['birthDate'];
$gender = $_POST['gender'];
$address = $_POST['address'];
$postalCode = $_POST['postalCode'];
$phoneHome = $_POST['phoneHome'];
$phoneMobile = $_POST['phoneMobile'];
$phoneOffice = $_POST['phoneOffice'];

// Check if the email is already registered
$sqlCheckEmail = "SELECT * FROM users WHERE email='$email'";
$resultCheckEmail = $conn->query($sqlCheckEmail);

if ($resultCheckEmail->num_rows > 0) {
    $response = array('status' => 'error', 'message' => 'Email is already registered');
} else {
    // Check if the IC number is already registered
    $sqlCheckICNumber = "SELECT * FROM users WHERE ic_number='$icNumber'";
    $resultCheckICNumber = $conn->query($sqlCheckICNumber);

    if ($resultCheckICNumber->num_rows > 0) {
        $response = array('status' => 'error', 'message' => 'IC number is already registered');
    } else {
        // Check if password and confirm password are similar
        if ($_POST['password'] !== $_POST['confirmpassword']) {
            $response = array('status' => 'error', 'message' => 'Password and confirm password do not match');
        } else {
            // Insert the new user into the database
            $sql = "INSERT INTO users (name, ic_number, email, password, confirmpass, type, terms_conditions, ic_color, gender, birthdate, address, postalcode, phonehome, phonemobile, phoneoffice) VALUES ('$name', '$icNumber', '$email', '$password', '$confirmPassword', 'user', '$termsConditions', '$icColor', '$gender', '$birthDate', '$address', '$postalCode', '$phoneHome', '$phoneMobile', '$phoneOffice')";
            
            if ($conn->query($sql) === TRUE) {
                $response = array('status' => 'success', 'message' => 'Registration successful');
            } else {
                $response = array('status' => 'error', 'message' => 'Error registering user');
            }
        }
    }
}

echo json_encode($response);

// Close the connection
$conn->close();
?>
