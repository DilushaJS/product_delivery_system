<!DOCTYPE html>
<html>
<head>
	<title>Add Buyer</title>
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
			font-size: 20px;
            margin-bottom: 20px;
		}
        form input[type="text"]{
			width:318px;
			height:30px;
			font-size: 1em;
			border-radius: 5px;
			border: 1px solid black;
			margin-bottom: 10px;
            margin-left: 30px;
  			border-radius: 90px;
		}
        form select{
            width:318px;
			height:30px;
			font-size: 1em;
			border-radius: 5px;
			border: 1px solid black;
			margin-bottom: 10px;
            margin-left: 30px;
  			border-radius: 90px;
        }
        form input[type="submit"]{
            width:150px;
			height:30px;
			font-size: 20px;
			border-radius: 5px;
			border: 1px solid black;
			margin-bottom: 10px;
            margin-left: 100px;
  			border-radius: 90px;
            background-color: blue;
        }
        </style>
</head>
<body>
	<h1>Add Buyer</h1>
	<div style="position: relative; margin-top: 1px; margin-left: 550px;">
	<form action="addbuyer.php" method="post">
        <label for="b_id">ID:</label>
        <input type="text" id="b_id" name="b_id">


		<label for="b_name">Name:</label>
		<input type="text" id="b_name" name="b_name">

		<label for="b_phone">Phone:</label>
		<input type="text" id="b_phone" name="b_phone">
            <label for="full_address">Full Address:</label>
            <input type="text" id="full_address" name="full_address" required>
            <label for="city">City:</label>
            <input type="text" id="city" name="city" required>
            <label for="state">State:</label>
            <input type="text" id="state" name="state" required>
            <label for="zip_code">Zip Code:</label>
            <input type="text" id="zip_code" name="zip_code" required>
            <label for="payment_id">Payment ID:</label>
            <select name="payment_id">
                <option value="">Select payment ID</option>
                <?php
                $servername = "localhost";
                $username = "root";
                $password = "";
                $database = "door2door_courier";
                    
                $connection = mysqli_connect($servername, $username, $password, $database);
                $payment_query = "SELECT payment_id FROM payment";
                $payment_result = mysqli_query($connection, $payment_query);
              
                // Loop through the payment data and create an option for each payment ID
                while ($row = mysqli_fetch_assoc($payment_result)) {
                  echo '<option value="' . $row['payment_id'] . '">' . $row['payment_id'] . '</option>';
                }
                $connection->close();
                ?>
              </select>

		<input type="submit" value="Submit">

	</form>
	</div>
</body>
</html>
