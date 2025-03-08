<?php
// Connect to the database
$servername = "localhost";
$username = "root";
$password = "";
$database = "door2door_courier";

$conn = mysqli_connect($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$order_id = $_POST['order_id'];

// Prepare SQL statement
$sql_delete = "DELETE FROM orders WHERE order_id = ?";
$stmt_delete = $conn->prepare($sql_delete);

// Bind parameter for order_id
$stmt_delete->bind_param("s", $order_id);

// Execute SQL statement
if ($stmt_delete->execute() == TRUE) {
    echo "Order deleted successfully";
} else {
    echo "Error: " . $sql_delete . "<br>" . $conn->error;
}

// Close statement and database connection
$stmt_delete->close();
$conn->close();
?>