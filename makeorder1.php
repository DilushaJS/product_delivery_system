<!DOCTYPE html>
<html>
<head>
	<title>Add Employee</title>
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
		form input[type="text"], input[type="date"] {
			width: 518px;
			height: 37px;
			font-size: 1em;
			border-radius: 5px;
			border: 1px solid black;
			margin-bottom: 20px;
			margin-left: 30px;
			border-radius: 90px;
		}
		form select {
			width: 518px;
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
<?php
// Connect to the database
$servername = "localhost";
$username = "root";
$password = "";
$database = "door2door_courier";

$conn = mysqli_connect($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get list of products from orders table
$sql_products = "SELECT product_name FROM product";
$result_products = mysqli_query($conn, $sql_products);

// Get list of employees from employee table
$sql_employees = "SELECT emp_id, emp_name FROM employee";
$result_employees = mysqli_query($conn, $sql_employees);

// Get list of buyers from buyer table
$sql_buyers = "SELECT b_id, b_name FROM buyer";
$result_buyers = mysqli_query($conn, $sql_buyers);

// Close database connection
$conn->close();
?>
	<h1>Make Order</h1>

<div style="position: relative; margin-top: 50px; margin-left: 550px;">
    <form method="post" action="makeorder.php">
        <label for="product_name">Product Name:</label>
        <select id="product_name" name="product_name">
            <?php while ($row_products = mysqli_fetch_assoc($result_products)): ?>
                <option value="<?php echo $row_products['product_name']; ?>"><?php echo $row_products['product_name']; ?></option>
            <?php endwhile; ?>
        </select><br><br>
        <label for="placed_date">Placed Date:</label>
        <input type="date" id="placed_date" name="placed_date" value="<?php echo date('Y-m-d'); ?>"><br><br>

        <label for="emp_id">Employee:</label>
        <select id="emp_id" name="emp_id">
            <?php while ($row_employees = mysqli_fetch_assoc($result_employees)): ?>
            <option value="<?php echo $row_employees['emp_id']; ?>"><?php echo $row_employees['emp_name']; ?></option>
            <?php endwhile; ?>
        </select><br><br>

        <label for="b_id">Buyer:</label>
        <select id="b_id" name="b_id">
            <?php while ($row_buyers = mysqli_fetch_assoc($result_buyers)): ?>
            <option value="<?php echo $row_buyers['b_id']; ?>"><?php echo $row_buyers['b_name']; ?></option>
            <?php endwhile; ?>
        </select><br><br>

        <input type="submit" value="Place Order">
    </form>
</div>

<script>
    // Update price field based on selected product
    document.getElementById("product_name").addEventListener("change", function() {
        var price = document.getElementById("product_name").value;
        document.getElementById("price").value = price;
    });
</script>
</body>
</html>