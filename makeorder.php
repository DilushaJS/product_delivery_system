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

$product_name = $_POST['product_name'];
echo "Product name: $product_name<br>"; // Debugging statement
$emp_id = $_POST['emp_id'];
$b_id = $_POST['b_id'];


// Get total price from the products table
$sql_price = "SELECT total_price FROM product WHERE product_name = ?";
$stmt_price = $conn->prepare($sql_price);
$stmt_price->bind_param("s", $product_name);
$stmt_price->execute();
$result_price = $stmt_price->get_result();

if ($result_price->num_rows > 0) {
    // Fetch the price from the result set
    $row_price = $result_price->fetch_assoc();
    $price = $row_price['total_price'];

    // Get the highest order number from the orders table
    $sql_max_order_id = "SELECT MAX(SUBSTRING(order_id, 4)) AS max_order_id FROM orders";
    $result_max_order_id = mysqli_query($conn, $sql_max_order_id);
    $row_max_order_id = mysqli_fetch_assoc($result_max_order_id);
    $max_order_id = $row_max_order_id['max_order_id'];

    // Initialize $max_order_id to "0000000" if it's null
    if ($max_order_id === null) {
        $max_order_id = "0000000";
    }

    // Generate the order ID
    $order_id_number = intval($max_order_id) + 1;
    $order_id = "ORD" . str_pad($order_id_number, 7, "0", STR_PAD_LEFT);

    // Prepare SQL statement
    $sql_order = "INSERT INTO orders (order_id, placed_date, price, emp_id, b_id) VALUES (?, CURDATE(), ?, ?, ?)";
    $stmt_order = $conn->prepare($sql_order);

    // Bind parameters for order table
    $stmt_order->bind_param("ssii", $order_id, $price, $emp_id, $b_id);

    // Execute SQL statement
    if ($stmt_order->execute() == TRUE) {
        echo "Order added successfully";
    } else {
        echo "Error: " . $sql_order . "<br>" . $conn->error;
    }
}

// Close statement and result set
$stmt_price->close();
$stmt_order->close();
