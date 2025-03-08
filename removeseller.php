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

    // Execute the SQL query
    $sql = "DELETE FROM sellers WHERE seller_id='$seller_id'";
    if (mysqli_query($connection, $sql)) {
        echo 'Seller removed successfully.';
    } else {
        echo 'Error removing seller: ' . mysqli_error($connection);
    }
}

// Close the database connection
mysqli_close($connection);
?>
