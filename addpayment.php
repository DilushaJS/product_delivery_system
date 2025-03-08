<?php
// Connect to the database
$servername = "localhost";
$username = "root";
$password = "";
$database = "door2door_courier";

$connection = mysqli_connect($servername, $username, $password, $database);
if (!$connection) {
    die('Could not connect: ' . mysqli_error($connection));
}

// Check if the form was submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve the form data
    $payment_id = mysqli_real_escape_string($connection, $_POST['payment_id']);
    $method = mysqli_real_escape_string($connection, $_POST['method']);
    $total_price = mysqli_real_escape_string($connection, $_POST['total_price']);

    // Check if payment method exists
    $result = mysqli_query($connection, "SELECT * FROM payment WHERE payment_id = $payment_id");
    if (mysqli_num_rows($result) > 0) {
        // Update existing payment method
        $sql = "UPDATE payment SET method = '$method', total_price = '$total_price' WHERE payment_id = $payment_id";
        if (mysqli_query($connection, $sql)) {
            echo 'Payment method updated successfully.';
        } else {
            echo 'Error updating payment method: ' . mysqli_error($connection);
        }
    } else {
        // Add new payment method
        $sql = "INSERT INTO payment (payment_id, method, total_price) VALUES ('$payment_id', '$method', '$total_price')";
        if (mysqli_query($connection, $sql)) {
            echo 'Payment method added successfully.';
        } else {
            echo 'Error adding payment method: ' . mysqli_error($connection);
        }
    }
}

// Close the database connection
mysqli_close($connection);
