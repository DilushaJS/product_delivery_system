<?php
session_start();

// Check if user is logged in
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

// Connect to the database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "door2door_courier";

$conn = mysqli_connect($servername, $username, $password, $dbname);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Get the form data
$tracking_number = $_POST['tracking_number'];
$expected_deliver_date = $_POST['expected_deliver_date'];
$location = $_POST['location'];
$branch_id = $_POST['branch_id'];

// Check if the branch exists in the branch table
$sql = "SELECT * FROM branch WHERE branch_id = '$branch_id'";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    // Branch found, check if the tracking number already exists in the updates table
    $sql = "SELECT * FROM updates WHERE tracking_number = '$tracking_number' AND branch_id = '$branch_id'";
    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) > 0) {
        // Tracking number found, ask if the user wants to update or delete the record
        echo "This tracking number already exists in the updates table. Do you want to update or delete the existing record?<br><br>";
        echo "<form action='update_delivery.php' method='post'>";
        echo "<input type='hidden' name='tracking_number' value='$tracking_number'>";
        echo "<input type='hidden' name='branch_id' value='$branch_id'>";
        echo "<input type='submit' value='Update'>";
        echo "</form>";
        echo "<form action='delete_delivery.php' method='post'>";
        echo "<input type='hidden' name='tracking_number' value='$tracking_number'>";
        echo "<input type='hidden' name='branch_id' value='$branch_id'>";
        echo "<input type='submit' value='Delete'>";
        echo "</form>";
    }
    
        else {
            // Tracking number not found, add the delivery record and insert into updates table
            $sql = "INSERT INTO delivery (tracking_number, expected_deliver_date, location) VALUES ('$tracking_number', '$expected_deliver_date', '$location')";
            
            if (mysqli_query($conn, $sql)) {
                $sql = "INSERT INTO updates (branch_id, tracking_number) VALUES ('$branch_id', '$tracking_number')";
                
                if (mysqli_query($conn, $sql)) {
                    echo "Delivery record added successfully.";
                } else {
                    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
                }
            } else {
                echo "Error: " . $sql . "<br>" . mysqli_error($conn);
            }
        }
}
        
        // Close the database connection
        mysqli_close($conn);        