<?php
// Connect to the database
$servername = "localhost";
$username = "root";
$password = "";
$database = "door2door_courier";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get the payment ID from the form submission
$payment_id = $_POST["payment_id"];

// Prepare and bind the SQL query
$stmt = $conn->prepare("DELETE FROM payment WHERE payment_id = ?");
$stmt->bind_param("i", $payment_id);

// Execute the query
if ($stmt->execute()) {
    echo "Payment record deleted successfully";
} else {
    echo "Error deleting payment record: " . $conn->error;
}

$stmt->close();
$conn->close();
?>
