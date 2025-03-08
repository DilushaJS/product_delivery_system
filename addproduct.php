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

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $seller_id = $_POST['seller_id'];
    $product_id = $_POST['product_id'];
    $product_name = $_POST['product_name'];
    $total_price = $_POST['total_price'];
    $delivery_address = $_POST['delivery_address'];
    $quantity = $_POST['quantity'];

    // Check if seller and product exist in their respective tables
    $query_seller = "SELECT * FROM sellers WHERE seller_id = '$seller_id'";
    $result_seller = mysqli_query($conn, $query_seller);

    $query_product = "SELECT * FROM product WHERE product_id = '$product_id'";
    $result_product = mysqli_query($conn, $query_product);

    // Check if product_id already exists
    if (mysqli_num_rows($result_product) > 0) {
        // Update existing record
        $sql = "UPDATE product SET product_name='$product_name', total_price='$total_price', delivery_address='$delivery_address', quantity='$quantity' WHERE product_id='$product_id'";
    } else {
        // Insert new record
        $sql = "INSERT INTO product (product_id, product_name, total_price, delivery_address, quantity) VALUES ('$product_id', '$product_name', '$total_price', '$delivery_address', '$quantity')";
    }

    // Execute the SQL statement for product table
    if (mysqli_query($conn, $sql)) {
        echo "Record updated/inserted successfully";
    } else {
        echo "Error updating/inserting record: " . mysqli_error($conn);
    }

    // Check if both seller_id and product_id exist before inserting a new record into gives table
    if (mysqli_num_rows($result_seller) > 0 && mysqli_num_rows($result_product) > 0) {
        // Insert new record into gives table
        $sql_gives = "INSERT INTO gives (seller_id, product_id) VALUES ('$seller_id', '$product_id')";

        if (mysqli_query($conn, $sql_gives)) {
            echo "Record inserted successfully";
        } else {
            echo "Error inserting record: " . mysqli_error($conn);
        }
    } else {
        echo "Error: Seller or product not found";
    }
}

mysqli_close($conn);
?>