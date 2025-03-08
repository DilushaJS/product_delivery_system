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

// Get the tracking number and branch ID from the form submission
$tracking_number = $_POST['tracking_number'];
$branch_id = $_POST['branch_id'];

// Delete the record from the updates table
$sql = "DELETE FROM updates WHERE tracking_number = '$tracking_number' AND branch_id = '$branch_id'";

if (mysqli_query($conn, $sql)) {
    // Record deleted successfully
    echo "Record deleted successfully.";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

// Close the database connection
mysqli_close($conn);
?>
