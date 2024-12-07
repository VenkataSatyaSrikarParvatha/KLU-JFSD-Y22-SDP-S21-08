<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="counselorNavbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Counselor Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            text-align: center;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-size: 2.5rem;
            color: #2193b0;
        }
        p {
            font-size: 1.2rem;
            color: #333;
        }
        a {
            text-decoration: none;
            color: #fff;
            background-color: #2193b0;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #6dd5ed;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome, Counselor!</h1>
        <p>Manage your profile, sessions, and more from here.</p>
        <a href="${pageContext.request.contextPath}/counselorProfile">View Profile</a>
    </div>
</body>
</html>
