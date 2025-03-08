<?php
session_start();

// Connect to the database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "door2door_courier";

$conn = mysqli_connect($servername, $username, $password, $dbname);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Check if the form has been submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Get the tracking number from the form
    $tracking_number = $_POST["username"];

    // Query the database for the tracking information
    $sql = "SELECT * FROM delivery WHERE tracking_number = '$tracking_number'";
    $result = mysqli_query($conn, $sql);

    // Check if any results were found
    if (mysqli_num_rows($result) > 0) {

        // Output the tracking information
        $row = mysqli_fetch_assoc($result);
        echo "<h2>Tracking Details</h2>";
        echo "<p><strong>Tracking Number:</strong> " . $row["tracking_number"] . "</p>";
        echo "<p><strong>Expected Delivery Date:</strong> " . $row["expected_deliver_date"] . "</p>";
        echo "<p><strong>Current Location:</strong> " . $row["location"] . "</p>";

    } else {
        // No results found for the given tracking number
        echo "<p>No tracking information found for the given tracking number.</p>";
    }
}

// Close the database connection
mysqli_close($conn);

?>
