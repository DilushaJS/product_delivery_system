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
    $product_id = mysqli_real_escape_string($connection, $_POST['product_id']);

    // Execute the SQL query
    $sql = "DELETE FROM product WHERE product_id = '$product_id'";
    if (mysqli_query($connection, $sql)) {
        echo "Record deleted successfully";
    } else {
        echo "Error deleting record: " . mysqli_error($conn);
    }
}

// Close the database connection
mysqli_close($connection);
?>
