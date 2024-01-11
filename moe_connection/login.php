<?php 

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: *");
header("Content-Type: application/json");

  //MySQL database Connection
  $con=mysqli_connect('localhost','root','','moe_project');

  session_start();
  
  //Received JSON into $json variable
  $json = file_get_contents('php://input');
  
  //Decoding the received JSON and store into $obj variable.
  $obj = json_decode($json,true);
  
  if(isset($obj["ic_number"]) && isset($obj["password"])){
    
    $ic = mysqli_real_escape_string($con,$obj['ic_number']);
    $pwd = mysqli_real_escape_string($con,$obj['password']);
    
    //Declare array variable
    $result=[];
    
    //Select Query
    $sql="SELECT * FROM users WHERE ic_number='{$ic}'";
    $res=$con->query($sql);
    
    if($res->num_rows>0){
      
        $row = $res->fetch_assoc();
        $hashedPassword = $row['password'];

        // Verify the entered password against the stored hashed password
        if (password_verify($pwd, $hashedPassword)) {

            $result['loginStatus'] = true;
            $result['message'] = "Login Successfully";

            $result["userInfo"] = $row;

        } else {

            $result['loginStatus'] = false;
            $result['message'] = "Invalid Login Details";
        }

    } else {

        $result['loginStatus'] = false;
        $result['message'] = "Invalid Login Details";
    }
    
    // Converting the array into JSON format.
    $json_data=json_encode($result);
      
    // Echo the $json.
    echo $json_data;
  }
?>