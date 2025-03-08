<!DOCTYPE html>
<html>
<head>
	<title>Add Product</title>
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
		form input[type="text"], form input[type="number"], form select {
			width: 318px;
			height: 37px;
			font-size: 1em;
			border-radius: 5px;
			border: 1px solid black;
			margin-bottom: 20px;
			margin-left: 30px;
			border-radius: 90px;
		}
		form input[type="submit"] {
			width: 150px;
			height: 37px;
			font-size: 20px;
			border-radius: 5px;
			border: 1px solid black;
			margin-bottom: 20px;
			margin-left: 100px;
			border-radius: 90px;
			background-color: red;
		}
	</style>
</head>
<body>
	<h1>Add Product</h1>
	<div style="position: relative; margin-top: 50px; margin-left: 550px;">
		<form method="post" action="addproduct.php">
			<label for="seller_id">Seller:</label>
			<select id="seller_id" name="seller_id">
				<?php
				// Connect to the database
				$servername = "localhost";
				$username = "root";
				$password = "";
				$database = "door2door_courier";
				$conn = mysqli_connect($servername, $username, $password, $database);

				// Check connection
				if (!$conn) {
				    die("Connection failed: " . mysqli_connect_error());
				}

				// Retrieve sellers from database
				$sql = "SELECT seller_id, seller_name FROM sellers";
				$result = mysqli_query($conn, $sql);

				if (mysqli_num_rows($result) > 0) {
				    // Output each seller as an option in the drop-down menu
				    while($row = mysqli_fetch_assoc($result)) {
				        echo "<option value='" . $row["seller_id"] . "'>" . $row["seller_name"] . "</option>";
				    }
				}

				mysqli_close($conn);
				?>
			</select><br><br>
			<label for="product_id">Product ID:</label>
			<input type="text" id="product_id" name="product_id"><br><br>
			<label for="product_name">Product Name:</label>
			<input type="text" id="product_name" name="product_name"><br><br>
			<label for="total_price">Total Price:</label>
			<input type="number" id="total_price" name="total_price" step="0.01"><br><br>
			<label for="delivery_address">Delivery Address:</label>
			<input type="text" id="delivery_address" name="delivery_address"><br><br>
			<label for="quantity">Quantity:</label>
			<input type="number" id="quantity" name="quantity"><br><br>

			<input type="submit" value="Add Product">
		</form>
	</div>
</body>
</html>
