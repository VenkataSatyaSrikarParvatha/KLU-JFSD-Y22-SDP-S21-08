<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="adminNavbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Team Addition Success</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .content {
            margin-left: 250px; /* Adjust if navbar is fixed */
            padding: 40px 20px;
            text-align: center;
        }

        .success-message {
            padding: 15px;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            border-radius: 5px;
            color: #155724;
            font-weight: bold;
            margin: 20px auto;
            display: inline-block;
            max-width: 600px;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            text-decoration: none;
            border-radius: 5px;
            color: #fff;
            background-color: #007bff;
            border: none;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .navigation {
            margin-top: 20px;
        }

        .navigation a {
            margin: 0 10px;
        }
    </style>
</head>
<body>
    <div class="content">
        <!-- Success Message -->
        <h3>Curator Added Successfully!</h3>

        <c:if test="${not empty message}">
            <div class="success-message">
                <p>${message}</p>
            </div>
        </c:if>

        <!-- Navigation Buttons -->
        <div class="navigation">
            <a href="/addAdminTeam" class="btn">Add Another Curator</a>
            <a href="/adminhome" class="btn">Go to Home</a>
        </div>
    </div>
</body>
</html>
