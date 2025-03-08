<?php
session_start();

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
if(isset($_POST['username']) && isset($_POST['password'])) {
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);

    // Check if the user exists in the database
    $sql = "SELECT * FROM users WHERE username = '$username' AND password = '$password'";
    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) > 0) {
        // User found, set session variables and redirect to the homepage
        $row = mysqli_fetch_assoc($result);
        $_SESSION['user_id'] = $row['id'];
        $_SESSION['username'] = $row['username'];

        // Redirect based on the persons number
        if ($row['persons'] == 1) {
            header("Location: adminpage.html");
        } elseif ($row['persons'] == 2) {
            header("Location: employeepage.html");
        } elseif ($row['persons'] == 3) {
            header("Location: sellerpage.html");
        } elseif ($row['persons'] == 4) {
            header("Location: buyerpage.html");
        } else {
            // If persons number is not valid, display an error message
            echo "Invalid persons number<br><br>";
            echo "<button onclick='history.go(-1)'>Try again</button>";
        }
    } else {
        // User not found, display an error message and a try again button
        echo "Invalid username or password<br><br>";
        echo "<button onclick='history.go(-1)'>Try again</button>";
    }
}

// Close connection
mysqli_close($conn);
?>
