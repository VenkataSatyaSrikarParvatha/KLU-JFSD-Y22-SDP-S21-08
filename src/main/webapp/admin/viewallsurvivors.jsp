<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="adminNavbar.jsp" %> <!-- Import the admin navbar -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Survivors</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css"> <!-- Add your CSS file path -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #e0f7fa; /* Light cyan background */
            margin: 0;
            padding: 0;
            color: #333;
        }

        .content {
            margin-left: 250px;
            padding: 30px;
        }

        h2 {
            font-size: 2.5rem;
            font-weight: bold;
            color: #3f51b5; /* Deep blue */
            margin-bottom: 40px;
            text-align: center;
            text-transform: uppercase;
        }

        .survivor-cards-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        .survivor-card {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 20px;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease, filter 0.3s ease;
            color: #555;
            overflow: hidden;
        }

        .survivor-card:hover {
            transform: scale(1.05) rotate(3deg);
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15);
            filter: brightness(1.1);
        }

        .survivor-card h3 {
            font-size: 1.8rem;
            color: #4caf50; /* Greenish color for headings */
            margin-bottom: 15px;
            font-weight: 600;
        }

        .survivor-card p {
            font-size: 1rem;
            margin: 10px 0;
        }

        .survivor-card .label {
            font-weight: bold;
            color: #2196f3; /* Blue label color */
        }

        .survivor-card a {
            display: inline-block;
            text-align: center;
            text-decoration: none;
            color: #fff;
            background: linear-gradient(45deg, #2196f3, #673ab7); /* Gradient button */
            padding: 12px 25px;
            border-radius: 25px;
            margin-top: 20px;
            transition: background 0.3s ease, transform 0.3s ease;
        }

        .survivor-card a:hover {
            background: linear-gradient(45deg, #673ab7, #2196f3);
            transform: translateY(-3px);
        }

        .back-btn {
            display: block;
            text-align: center;
            margin: 30px auto;
            text-decoration: none;
            color: white;
            background-color: #3f51b5;
            padding: 12px 25px;
            border-radius: 30px;
            transition: background-color 0.3s ease;
        }

        .back-btn:hover {
            background-color: #5c6bc0;
        }

        @media screen and (max-width: 768px) {
            .content {
                margin-left: 0;
                padding: 15px;
            }

            h2 {
                font-size: 2rem;
            }

            .survivor-card h3 {
                font-size: 1.6rem;
            }

            .survivor-card p {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="content">
        <h2>All Survivors</h2>
        <div class="survivor-cards-container">
            <c:forEach var="survivor" items="${survivors}">
                <div class="survivor-card">
                <img src="/survivor/profileImage?id=${survivor.id}" alt="Survivor Image">
                    <h3>${survivor.username}</h3>
                    <p><span class="label">ID:</span> ${survivor.id}</p>
                    <p><span class="label">Email:</span> ${survivor.email}</p>
                    <p><span class="label">Phone:</span> ${survivor.phone}</p>
                    <a href="viewSurvivorDetails?id=${survivor.id}">View Details</a>
                    
                </div>
            </c:forEach>
        </div>
        <a href="adminhome" class="back-btn">Back to Admin Home</a>
    </div>
</body>
</html>
