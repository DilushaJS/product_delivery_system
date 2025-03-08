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

if(isset($_POST['email']) && isset($_POST['username'])) {
	$email = mysqli_real_escape_string($conn, $_POST['email']);
	$username = mysqli_real_escape_string($conn, $_POST['username']);

	// Check if the user exists in the database
	$sql = "SELECT * FROM users WHERE email = '$email' AND username = '$username'";
	$result = mysqli_query($conn, $sql);

	if (mysqli_num_rows($result) > 0) {
	    // User found, generate and send reset password email
	    $row = mysqli_fetch_assoc($result);
	    $reset_token = md5(uniqid());
	    $reset_link = "http://example.com/reset_password.php?token=$reset_token";
	    $to = $email;
	    $subject = "Reset Password";
	    $message = "Hi $username, <br><br> Please click on the following link to reset your password: $reset_link";
	    $headers = "MIME-Version: 1.0" . "\r\n";
	    $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
	    $headers .= 'From: <example@example.com>' . "\r\n";
	    if(mail($to,$subject,$message,$headers)) {
	    	echo "Reset password link has been sent to your email";
	    } else {
	    	echo "Failed to send reset password link";
	    }
	} else {
	    // User not found, display an error message
	    echo "User not found with this email address and username";
	}
}

// Close connection
mysqli_close($conn);
?>
