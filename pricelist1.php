<!DOCTYPE html>
<html>
<head>
	<title>Price List</title>
	<style>
		body {
			background-color: #f2f2f2;
            background-image: url("back2.jpg");
			margin: 0;
			padding: 0;
			font-family: Arial, sans-serif;
		}
        h1 {
            text-align: center;
            margin-top: 50px;
        }
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        li {
            width: 20%;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
            background-color: white;
        }
        li:nth-child(even) {
            background-color: #f2f2f2;
        }
        li::after {
            content: "";
            display: table;
            clear: both;
        }
        li h2 {
            margin-top: 0;
        }
        li p {
            margin-bottom: 10px;
        }
	</style>
</head>
<body>
	<?php include 'pricelist.php'; ?>
</body>
</html>
