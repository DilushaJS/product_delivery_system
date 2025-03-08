<?php
// Connect to the database
$servername = "localhost";
$username = "root";
$password = "";
$database = "door2door_courier";

$conn = mysqli_connect($servername, $username, $password, $database);

// Check if connection was successful
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get form data
$emp_id = $_POST['emp_id'];
$emp_name = $_POST['emp_name'];
$dm_name = $_POST['emp_name'];
$designation = $_POST['designation'];
$working_hours = $_POST['working_hours'];
if ($designation == "Delivery Man") {
    $time_shift = $_POST['time_shift'];
    $salary = 30000.00 + $working_hours * 4000;
    $sql_delivery_man = "INSERT INTO delivery_man (dm_name, emp_id, working_hours, time_shift) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE dm_name = VALUES(dm_name), emp_id = VALUES(emp_id), working_hours = VALUES(working_hours), time_shift = VALUES(time_shift)";
    $stmt_delivery_man = $conn->prepare($sql_delivery_man);
    $stmt_delivery_man->bind_param("siss", $emp_name, $emp_id, $working_hours, $time_shift);
}

// Calculate salary based on designation and working hours
else if ($designation == "Manager") {
    $salary = 40000.00 + $working_hours * 5000;
}

// Prepare SQL statement
$sql_employee = "INSERT INTO employee (emp_id, emp_name, salary, designation) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE emp_name = VALUES(emp_name), salary = VALUES(salary), designation = VALUES(designation)";
$stmt_employee = $conn->prepare($sql_employee);

// Bind parameters for employee table
$stmt_employee->bind_param("isds", $emp_id, $emp_name, $salary, $designation);

// Execute SQL statement
if ($stmt_employee->execute() === TRUE) {
    echo "Employee data added successfully";
} else {
    echo "Error: " . $sql_employee . "<br>" . $conn->error;
}
if ($stmt_employee->execute() === TRUE) {
    if ($designation == "Delivery Man") {
        if ($stmt_delivery_man->execute() === TRUE) {
            echo "Employee and Delivery Man data added successfully";
        } else {
            echo "Error: " . $sql_delivery_man . "<br>" . $conn->error;
        }
    } else {
        echo ".";
    }
} else {
    echo "Error: " . $sql_employee . "<br>" . $conn->error;
}
// Close database connection
$conn->close();
?>
