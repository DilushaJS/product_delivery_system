<?php
// Connect to the database
$servername = "localhost";
$username = "root";
$password = "";
$database = "door2door_courier";

$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if branch_id is set in the POST request
if (isset($_POST['branch_id'])) {
    $branch_id = $_POST['branch_id'];

    // Prepare and execute SQL statement to delete the branch with the specified branch_id
    $sql = "DELETE FROM updates WHERE branch_id=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $branch_id);
    $stmt->execute();
    $sql = "DELETE FROM branch WHERE branch_id=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $branch_id);
    $stmt->execute();
   
    // Check if any rows were affected by the delete statement
    if ($stmt->affected_rows > 0) {
        echo "Branch with ID $branch_id has been deleted.";
    } else {
        echo "No branch with ID $branch_id was found.";
    }

    // Close the prepared statement
    $stmt->close();
}

// Close the database connection
$conn->close();
?>
