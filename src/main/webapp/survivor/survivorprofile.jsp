<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="survivorNavbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Survivor Profile</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f7f7;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            max-width: 900px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .profile-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .profile-header h1 {
            color: #2c3e50;
            font-size: 2.5rem;
        }

        .profile-header img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            margin-top: 15px;
            object-fit: cover;
        }

        .profile-details {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-top: 20px;
        }

        .profile-details .detail {
            width: 48%;
            margin-bottom: 20px;
        }

        .profile-details .detail label {
            font-weight: bold;
            color: #34495e;
        }

        .profile-details .detail span {
            font-size: 1.1rem;
            color: #7f8c8d;
        }

        .action-btns {
            text-align: center;
            margin-top: 30px;
        }

        .action-btns a {
            text-decoration: none;
            color: white;
            background-color: #3498db;
            padding: 12px 25px;
            border-radius: 30px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .action-btns a:hover {
            background-color: #2980b9;
        }

    </style>
</head>
<body>

    <div class="container">

        <!-- Profile Header -->
        <div class="profile-header">
            <h1>Survivor Profile</h1>
            <c:if test="${not empty survivor.image}">
                <img src="/survivor/profileImage?id=${survivor.id}" alt="Survivor Image">
            </c:if>
            <c:if test="${empty survivor.image}">
                <img src="default-image.jpg" alt="Default Image" />
            </c:if>
        </div>

        <!-- Profile Details -->
        <div class="profile-details">

            <div class="detail">
                <label>Username:</label>
                <span>${survivor.username}</span>
            </div>

            <div class="detail">
                <label>Email:</label>
                <span>${survivor.email}</span>
            </div>

            <div class="detail">
                <label>Phone:</label>
                <span>${survivor.phone}</span>
            </div>

            <div class="detail">
                <label>Address:</label>
                <span>${survivor.address}</span>
            </div>

            <div class="detail">
                <label>Date of Birth:</label>
                <span>${survivor.dateOfBirth}</span>
            </div>

            <div class="detail">
                <label>Gender:</label>
                <span>${survivor.gender}</span>
            </div>

            <div class="detail">
                <label>Aadhaar Number:</label>
                <span>${survivor.aadhaarNumber}</span>
            </div>

        </div>

        <!-- Action Buttons -->
        <div class="action-btns">
            <a href="/survivorprofile/edit">Edit Profile</a>
            <a href="/survivorlogout">Logout</a>
        </div>

    </div>

</body>
</html>
