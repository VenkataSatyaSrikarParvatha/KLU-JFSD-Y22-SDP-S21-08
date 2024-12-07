<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Survivor Home</title>
    <style>
        /* Reset some default browser styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body and basic layout */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fa;
            color: #333;
        }

        /* Navbar styles */
        .navbar {
            background-color: #5c6bc0;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar-logo img {
            width: 120px;
        }

        .navbar-links {
            list-style: none;
            display: flex;
            gap: 20px;
        }

        .navbar-links li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        .navbar-links li a:hover {
            color: #ffca28;
        }

        /* Main container for content */
        .container {
            width: 80%;
            margin: 40px auto;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* Dashboard card with personal details */
        .dashboard {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            padding: 30px;
            max-width: 600px;
            text-align: center;
        }

        .dashboard h1 {
            font-size: 24px;
            color: #5c6bc0;
            margin-bottom: 20px;
        }

        .card {
            background: #f4f7fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .card h2 {
            color: #5c6bc0;
            margin-bottom: 15px;
        }

        .card ul {
            list-style: none;
        }

        .card li {
            margin: 10px 0;
        }

        /* Button styling */
        .btn {
            background-color: #5c6bc0;
            color: white;
            padding: 12px 20px;
            border-radius: 8px;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #3f4a84;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="navbar-logo">
            <a href="survivorhome"><img src="images/logo.png" alt="Logo"></a>
        </div>
        <ul class="navbar-links">
            <li><a href="survivorprofile">Profile</a></li>
            <li><a href="survivorlogout">Logout</a></li>
        </ul>
    </div>

    <div class="container">
        <div class="dashboard">
            <h1>Welcome, ${survivor.username}!</h1>
            <div class="card">
                <h2>Personal Details</h2>
                <ul>
                    <li><strong>Email:</strong> ${survivor.email}</li>
                    <li><strong>Phone:</strong> ${survivor.phone}</li>
                    <li><strong>Address:</strong> ${survivor.address}</li>
                    <li><strong>Date of Birth:</strong> ${survivor.dateOfBirth}</li>
                    <li><strong>Aadhaar Number:</strong> ${survivor.aadhaarNumber}</li>
                </ul>
            </div>
            <a href="survivorprofile" class="btn">Edit Profile</a>
        </div>
    </div>
</body>
</html>
