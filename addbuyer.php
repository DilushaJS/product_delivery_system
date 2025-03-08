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
$b_id = $_POST['b_id'];
$b_name = $_POST['b_name'];
$b_phone = $_POST['b_phone'];
$full_address = $_POST['full_address'];
$payment_id = $_POST['payment_id'];

// Prepare and bind the SQL statement
$stmt = $conn->prepare("INSERT INTO buyer (b_id, b_name, b_phone, full_address, payment_id) VALUES (?, ?, ?, ?, ?)");
$stmt->bind_param("isssi", $b_id, $b_name, $b_phone, $full_address, $payment_id);

// Execute the statement
if ($stmt->execute() === TRUE) {
  echo "New record created successfully";
} else {
  echo "Error: " . $stmt->error;
}

// Close the statement and the database connection
$stmt->close();
$conn->close();
?>