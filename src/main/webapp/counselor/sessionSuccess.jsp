<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="counselorNavbar.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Session Update Success</title>
    <style>
        /* General Body Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #333;
        }

        /* Main container */
        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 600px;
            width: 90%;
        }

        /* Heading styling */
        h2 {
            color: #28a745;
            font-size: 2rem;
            margin-bottom: 20px;
        }

        /* Success message styling */
        p {
            font-size: 1.2rem;
            margin-bottom: 20px;
            color: #555;
        }

        /* Button and link styling */
        a {
            text-decoration: none;
            color: white;
            background-color: #2193b0;
            padding: 12px 20px;
            border-radius: 5px;
            font-size: 1rem;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        a:hover {
            background-color: #6dd5ed;
            transform: scale(1.05);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            h2 {
                font-size: 1.5rem;
            }

            p {
                font-size: 1rem;
            }

            a {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Session Update Successful!</h2>
        <p>${message}</p>
        <a href="counselor/mySessions">Go back to your sessions</a>
    </div>

</body>
</html>
