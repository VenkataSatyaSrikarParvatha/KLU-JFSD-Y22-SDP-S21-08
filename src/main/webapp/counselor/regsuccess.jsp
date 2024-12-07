<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Success</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css"> <!-- Assuming you have a shared CSS file -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f4f8;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        .message-box {
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 60%;
            max-width: 600px;
        }

        .message-box h1 {
            color: #2193b0;
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        .message-box p {
            font-size: 1.2rem;
            margin-bottom: 20px;
        }

        .message-box a {
            text-decoration: none;
            background-color: #2193b0;
            color: white;
            padding: 12px 20px;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .message-box a:hover {
            background-color: #6dd5ed;
        }
    </style>
</head>
<body>
    <!-- Include Navbar -->


    <div class="container">
        <div class="message-box">
            <h1>Registration Successful!</h1>
            <p>Congratulations, your registration as a counselor was successful. You can now access your counselor Login.</p>
            <a href="counselorLogin">Go to Dashboard</a>
        </div>
    </div>
</body>
</html>
