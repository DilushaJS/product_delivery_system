<?php
// Connect to the database
$servername = "localhost";
$username = "root";
$password = "";
$database = "door2door_courier";

$conn = mysqli_connect($servername, $username, $password, $database);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
$product_id = $_POST['product_id'];
$distance = $_POST['distance'];
$weight = $_POST['weight'];

// Prepare SQL statement
$sql_insert = "INSERT INTO transport (transport_method, distance, weight, product_id, dm_name) 
               VALUES (?, ?, ?, ?, 
               (SELECT dm_name FROM delivery_man ORDER BY RAND() LIMIT 1))";

$stmt_insert = $conn->prepare($sql_insert);

// Bind parameters for transport_method, distance, weight and product_id
$transport_method = "";
$stmt_insert->bind_param("ssss", $transport_method, $distance, $weight, $product_id);

// Generate random transport_method
$transport_methods = array('Bike', 'Car', 'Van', 'Truck', 'ThreeWheel');
$transport_method = $transport_methods[rand(0, count($transport_methods) - 1)];

// Execute SQL statement
if ($stmt_insert->execute() == TRUE) {
    echo "Transport details added successfully";
} else {
    echo "Error: " . $sql_insert . "<br>" . $conn->error;
}

// Close statement and database connection
$stmt_insert->close();
$conn->close();
?>
