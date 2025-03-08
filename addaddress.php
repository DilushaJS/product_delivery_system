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

if (isset($_POST['full_address'])) {
    $full_address = $_POST['full_address'];
    $city = $_POST['city'];
    $state = $_POST['state'];
    $zip_code = $_POST['zip_code'];

    // Check if the address already exists
    $query = "SELECT * FROM address WHERE full_address = '$full_address'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        echo "Address already exists";
    } else {
        // Insert new record into address table
        $sql = "INSERT INTO address (full_address, city, state, zip_code) VALUES ('$full_address', '$city', '$state', '$zip_code')";

        if (mysqli_query($conn, $sql)) {
            echo "New address record created successfully";
        } else {
            echo "Error: " . mysqli_error($conn);
        }
    }
}

mysqli_close($conn);
?>