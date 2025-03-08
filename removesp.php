<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "door2door_courier";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Get package_id from user input
$package_id = $_POST['package_id'];

// Delete record from special_package table
$sql_delete_package = "DELETE FROM special_package WHERE package_id = $package_id";
if (mysqli_query($conn, $sql_delete_package)) {
  echo "Record deleted successfully.";
} else {
  echo "Error deleting record: " . mysqli_error($conn);
}

// Close the database connection
mysqli_close($conn);
?>
