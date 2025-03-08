<!DOCTYPE html>
<html>
<head>
	<title>Salary Slip</title>
	<style>
		body {
			background-color: white;
			background-image: url('back3.jpg');
			background-size: 100%;
			background-position: top left;
			background-repeat: no-repeat;
			margin: 0;
			padding: 0;
			font-family: Arial, sans-serif;
		}
		h1 {
			text-align: center;
			font-size: 40px;
			color: #333;
			margin-top: 50px;
		}
		.result {
			position: relative;
			margin-top: 50px;
			margin-left: 550px;
			font-size: 24px;
			color: red;
			text-shadow: 1px 1px #ccc;
            font-weight: bold;
		}
	</style>
</head>
<body>
	<h1>Salary Slip</h1>
	<div class="result">
	<?php
		$servername = "localhost";
		$username = "root";
		$password = "";
		$database = "door2door_courier";

		$conn = mysqli_connect($servername, $username, $password, $database);
		if (!$conn) {
			die("Connection failed: " . mysqli_connect_error());
		}
		$emp_id = $_POST['emp_id'];
		$sql = "SELECT salary FROM employee WHERE emp_id = '$emp_id'";
		$result = mysqli_query($conn, $sql);
		if (mysqli_num_rows($result) > 0) {
			$row = mysqli_fetch_assoc($result);
			echo "Employee with emp_id $emp_id has a salary of $" . $row['salary'];
		} else {
			echo "No employee with the given emp_id exists";
		}
		mysqli_close($conn);
	?>
	</div>
</body>
</html>
