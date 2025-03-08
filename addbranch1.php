<!DOCTYPE html>
<html>
<head>
	<title>Add Branch</title>
	<style>
		body {
				background-color: white;
				background-image: url('back2.jpg');
				background-size: 100%;
				background-position: top left;
				background-repeat: no-repeat;
				margin: 0;
				padding: 0;
				font-family: Arial, sans-serif;
			}
        form label {
			display: block;
			font-size: 30px;
            margin-bottom: 20px;
		}
        form input[type="text"]{
			width:318px;
			height:37px;
			font-size: 1em;
			border-radius: 5px;
			border: 1px solid black;
			margin-bottom: 20px;
            margin-left: 30px;
  			border-radius: 90px;
		}
        form select {
            width: 318px;
			height:37px;
			font-size: 1em;
			border-radius: 5px;
			border: 1px solid black;
			margin-bottom: 20px;
            margin-left: 30px;
  			border-radius: 90px;
		}
        form input[type="submit"]{
            width:150px;
			height:37px;
			font-size: 20px;
			border-radius: 5px;
			border: 1px solid black;
			margin-bottom: 20px;
            margin-left: 100px;
  			border-radius: 90px;
            background-color: blue;
        }
        </style>
</head>
<body>
	<h1>Add Branch</h1>
	<div style="position: relative; margin-top: 50px; margin-left: 550px;">
	<form method="post" action="addbranch.php">
		<label for="branch_id">Branch ID:</label>
		<input type="text" id="branch_id" name="branch_id"><br><br>

		<label for="branch_name">Branch Name:</label>
		<input type="text" id="branch_name" name="branch_name"><br><br>

		<label for="branch_address">Branch Address:</label>
		<input type="text" id="branch_address" name="branch_address"><br><br>

		<label for="emp_id">Employee ID:</label>
		<select id="emp_id" name="emp_id">
            <option value="">--Select Employee ID--</option>
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
            
                // SQL query to get all employee IDs
                $sql = "SELECT emp_id FROM employee";
            
                // Execute the query
                $result = $conn->query($sql);
            
                // If there are results, display each emp_id as an option in the dropdown
                if ($result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
                        echo "<option value='" . $row["emp_id"] . "'>" . $row["emp_id"] . "</option>";
                    }
                } else {
                    echo "0 results";
                }
            
                $conn->close();
            ?>
        </select>
        <br><br>

		<input type="submit" value="Add Branch">
	</form>
	</div>
</body>
</html>
