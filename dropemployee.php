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

$emp_id = $_POST['emp_id'];

// Check if employee is also a delivery man
$query = "SELECT * FROM delivery_man WHERE emp_id='$emp_id'";
$result = mysqli_query($conn, $query);

if (mysqli_num_rows($result) > 0) {
    // Delete delivery_man record
    $sql = "DELETE FROM delivery_man WHERE emp_id='$emp_id'";
    if (!mysqli_query($conn, $sql)) {
        echo "Error deleting delivery_man records: " . mysqli_error($conn);
        mysqli_close($conn);
        exit();
    }
}

// Delete employee record
$sql = "DELETE FROM employee WHERE emp_id='$emp_id'";

if (mysqli_query($conn, $sql)) {
    echo "Record deleted successfully";
} else {
    echo "Error deleting record: " . mysqli_error($conn);
}

mysqli_close($conn);
?>
