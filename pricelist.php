<?php
// Connect to the database
$servername = "localhost";
$username = "root";
$password = "";
$database = "door2door_courier";

$conn = mysqli_connect($servername, $username, $password, $database);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
$sql = "SELECT product_id, product_name, total_price, quantity FROM product";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Output data of each row
    echo "<h1>Product List</h1>";
    echo "<ul>";
    while($row = $result->fetch_assoc()) {
        echo "<li>Product ID: " . $row["product_id"] . "</li>";
        echo "<li>Product Name: " . $row["product_name"] . "</li>";
        echo "<li>Total Price: $" . $row["total_price"] . "</li>";
        echo "<li>Quantity: " . $row["quantity"] . "</li>";
        echo "<br/>";
    }
    echo "</ul>";
} else {
    echo "No products found.";
}

// Close database connection
$conn->close();
?>