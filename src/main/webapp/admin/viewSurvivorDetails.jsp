<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="adminNavbar.jsp" %> <!-- Import the admin navbar -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Survivor Details</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css"> <!-- External CSS link -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f6d365, #fda085);
            margin: 0;
            padding: 0;
            color: #333;
        }

        .content {
            margin-left: 250px;
            padding: 20px;
            text-align: center;
        }

        h2 {
            font-size: 2.5rem;
            font-weight: bold;
            color: #fff;
            margin-bottom: 30px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        }

        .survivor-card {
            max-width: 900px;
            margin: 0 auto;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            padding: 40px;
            color: #555;
            position: relative;
        }

        .survivor-card img {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            object-fit: cover;
            margin-bottom: 20px;
            border: 5px solid #fff;
        }

        .name {
            font-size: 2rem;
            font-weight: bold;
            color: #2193b0;
            margin-bottom: 20px;
        }

        .info {
            text-align: left;
            font-size: 1.2rem;
            margin-bottom: 30px;
        }

        .info .label {
            font-weight: bold;
            color: #2193b0;
        }

        .info div {
            margin-bottom: 15px;
        }

        .back-btn {
            display: inline-block;
            padding: 12px 25px;
            background: #2193b0;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 1.1rem;
            transition: background 0.3s ease;
        }

        .back-btn:hover {
            background: #6dd5ed;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .content {
                margin-left: 0;
                padding: 10px;
            }

            .survivor-card {
                padding: 25px;
            }

            .survivor-card img {
                width: 120px;
                height: 120px;
            }

            .name {
                font-size: 1.8rem;
            }

            .info {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="content">
        <h2>Survivor Details</h2>
        
        <!-- Survivor Info Card -->
        <div class="survivor-card">
            <!-- Profile Image -->
            <img src="/survivor/profileImage?id=${survivor.id}" alt="Profile Image">

            <!-- Survivor Name -->
            <div class="name">${survivor.username}</div>
            
            <!-- Survivor Info -->
            <div class="info">
                <div><span class="label">Email:</span> ${survivor.email}</div>
                <div><span class="label">Phone:</span> ${survivor.phone}</div>
                <div><span class="label">Date of Birth:</span> ${survivor.dateOfBirth}</div>
                <div><span class="label">Gender:</span> ${survivor.gender}</div>
                <div><span class="label">Address:</span> ${survivor.address}</div>
                <div><span class="label">Aadhaar Number:</span> ${survivor.aadhaarNumber}</div>
            </div>

            <!-- Back Button -->
            <a href="viewallsurvivors" class="back-btn">Back to Survivor List</a>
        </div>
    </div>
</body>
</html>
