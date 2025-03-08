<?php
// Connect to the database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "userd2d";

$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Get form data
$email = mysqli_real_escape_string($conn, $_POST['email']);
$name = mysqli_real_escape_string($conn, $_POST['name']);
$username = mysqli_real_escape_string($conn, $_POST['username']);
$address = mysqli_real_escape_string($conn, $_POST['address']);
$password = mysqli_real_escape_string($conn, $_POST['password']);
$confirm_password = mysqli_real_escape_string($conn, $_POST['confirm_password']);
$persons = mysqli_real_escape_string($conn, $_POST['persons']);

// Check if the username or email already exists in the database
$sql = "SELECT * FROM users WHERE username = '$username' OR email = '$email'";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    echo "Username or email already exists";
} else {
    // Validate form data
    if ($password != $confirm_password) {
        echo "Passwords do not match";
    } else {
        // Insert data into database
        $sql = "INSERT INTO users (email, name, username, address, password, persons)
                VALUES ('$email', '$name', '$username', '$address', '$password', '$persons')";

        if (mysqli_query($conn, $sql)) {
            echo "New record created successfully";
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }
    }
}

// Close connection
mysqli_close($conn);
