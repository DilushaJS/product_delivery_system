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
$branch_id = $_POST['branch_id'];

// Query the database to get the current delivery record
$sql = "SELECT * FROM delivery WHERE tracking_number = '$tracking_number'";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    // Delivery record found, display a form to update it
    $row = mysqli_fetch_assoc($result);
    $current_expected_deliver_date = $row['expected_deliver_date'];
    $current_location = $row['location'];
    
    echo "<form action='update_delivery.php' method='post'>";
    echo "<input type='hidden' name='tracking_number' value='$tracking_number'>";
    echo "<input type='hidden' name='branch_id' value='$branch_id'>";
    echo "Expected Deliver Date: <input type='date' name='expected_deliver_date' value='$current_expected_deliver_date'><br>";
    echo "Location: <input type='text' name='location' value='$current_location'><br>";
    echo "<input type='submit' value='Update'>";
    echo "</form>";
} else {
    // Delivery record not found, display an error message
    echo "Error: Delivery record not found.<br>";
}

// If the form was submitted, update the delivery record and the updates record
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $expected_deliver_date = $_POST['expected_deliver_date'];
    $location = $_POST['location'];
    
    // Update the delivery record in the delivery table
    $sql = "UPDATE delivery SET expected_deliver_date = '$expected_deliver_date', location = '$location' WHERE tracking_number = '$tracking_number'";
    
    if (mysqli_query($conn, $sql)) {
        // Update the updates record in the updates table
        $sql = "UPDATE updates SET branch_id = '$branch_id' WHERE tracking_number = '$tracking_number'";
        
        if (mysqli_query($conn, $sql)) {
            echo "Delivery record updated successfully.";
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
}

// Close the database
mysqli_close($conn);
