<?php
// Connect to the database
$servername = "localhost";
$username = "root";
$password = "";
$database = "door2door_courier";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get the branch record data from the form submission
$branch_id = $_POST["branch_id"];
$branch_name = $_POST["branch_name"];
$branch_address = $_POST["branch_address"];
$emp_id = $_POST["emp_id"];

// SQL query to insert the branch record
$sql = "INSERT INTO branch (branch_id, branch_name, branch_address, emp_id) VALUES ('$branch_id', '$branch_name', '$branch_address', '$emp_id')";

// Execute the query
if ($conn->query($sql) === TRUE) {
    echo "Branch record added successfully";
} else {
    echo "Error adding branch record: " . $conn->error;
}

$conn->close();
?>
