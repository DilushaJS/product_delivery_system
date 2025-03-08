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

// Get user input values
$product_id = $_POST['product_id'];
$gift_or_not = $_POST['gift_or_not'];

// Calculate extra charges
$sql_get_price = "SELECT total_price FROM product WHERE product_id = '$product_id'";
$result_get_price = mysqli_query($conn, $sql_get_price);
$row_get_price = mysqli_fetch_assoc($result_get_price);
$total_price = $row_get_price['total_price'];
$extra_charges = $total_price * 1.1;

// Get the maximum package_id from the special_package table
$sql_max_package_id = "SELECT MAX(package_id) AS max_package_id FROM special_package";
$result_max_package_id = mysqli_query($conn, $sql_max_package_id);
$row_max_package_id = mysqli_fetch_assoc($result_max_package_id);
$max_package_id = $row_max_package_id['max_package_id'];

// Generate the next package_id
if ($max_package_id === null) {
  $next_package_id = 10001; // if there are no existing package_ids, start from 10001
} else {
  $next_package_id = $max_package_id + 1;
}

// Use the $next_package_id in your SQL query to insert a new record into the special_package table
$sql_insert_package = "INSERT INTO special_package (package_id, product_id, gift_or_not, extra_charges) 
                       VALUES ('$next_package_id', '$product_id', '$gift_or_not', '$extra_charges')";
mysqli_query($conn, $sql_insert_package);

// Display success message to user
echo "Record inserted successfully.";

// Get the auto-generated package_id
$package_id = mysqli_insert_id($conn);


// Close the database connection
mysqli_close($conn);
?>
