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
    $seller_id = mysqli_real_escape_string($connection, $_POST['seller_id']);
    $seller_name = mysqli_real_escape_string($connection, $_POST['seller_name']);
    $seller_address = mysqli_real_escape_string($connection, $_POST['seller_address']);
    $phone_num = mysqli_real_escape_string($connection, $_POST['phone_num']);

    // Execute the SQL query
    $sql = "INSERT INTO sellers (seller_id, seller_name, seller_address, phone_num) VALUES ('$seller_id', '$seller_name', '$seller_address', '$phone_num')";
    if (mysqli_query($connection, $sql)) {
        echo 'Seller added successfully.';
    } else {
        echo 'Error adding seller: ' . mysqli_error($connection);
    }
}

// Close the database connection
mysqli_close($connection);
?>
