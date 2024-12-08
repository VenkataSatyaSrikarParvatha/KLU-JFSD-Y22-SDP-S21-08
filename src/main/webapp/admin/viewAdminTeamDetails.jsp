<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="adminNavbar.jsp" %> <!-- Import the admin navbar -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Team Details</title>
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

        .admin-details-card {
            max-width: 900px;
            margin: 0 auto;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            padding: 20px;
            color: #555;
            position: relative;
        }

        .admin-details-header {
            background: linear-gradient(135deg, #6dd5ed, #2193b0);
            color: white;
            padding: 20px;
            text-align: center;
        }

        .admin-details-header img {
            border-radius: 50%;
            width: 120px;
            height: 120px;
            object-fit: cover;
            margin-bottom: 10px;
            border: 4px solid #fff;
        }

        .admin-details-header h3 {
            font-size: 1.8rem;
            margin: 10px 0 5px;
        }

        .admin-details-header p {
            font-size: 1rem;
            margin: 0;
            color: #eef;
        }

        .details-table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
        }

        .details-table th,
        .details-table td {
            padding: 10px;
            font-size: 1rem;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .details-table th {
            color: #2193b0;
            font-weight: bold;
            text-align: center;
        }

        .details-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .details-table tr:hover {
            background-color: #f1f1f1;
        }

        .status-update {
            text-align: center;
            margin-top: 20px;
        }

        .status-update form {
            display: inline-block;
        }

        .status-update label {
            font-size: 1.2rem;
            margin-right: 10px;
        }

        .status-update select {
            padding: 8px 12px;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            outline: none;
        }

        .status-update button {
            background: linear-gradient(135deg, #6dd5ed, #2193b0);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        .status-update button:hover {
            background: linear-gradient(135deg, #2193b0, #6dd5ed);
            transform: scale(1.05);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .content {
                margin-left: 0;
                padding: 10px;
            }

            .admin-details-card {
                padding: 15px;
            }

            .admin-details-header img {
                width: 80px;
                height: 80px;
            }

            .details-table th,
            .details-table td {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="content">
        <h2>Curator Details</h2>
        <div class="admin-details-card">
            <!-- Header with Profile Image and Name -->
            <div class="admin-details-header">
               
                <h3>${adminTeam.username}</h3>
                <p>Status: ${adminTeam.status}</p>
            </div>

            <!-- Admin Details Table -->
            <table class="details-table">
                <tr><th>ID</th><td>${adminTeam.id}</td></tr>
                <tr><th>Email</th><td>${adminTeam.email}</td></tr>
                <tr><th>Phone</th><td>${adminTeam.phone}</td></tr>
                <tr><th>Date of Birth</th><td>${adminTeam.dateOfBirth}</td></tr>
                <tr><th>Gender</th><td>${adminTeam.gender}</td></tr>
                <tr><th>Address</th><td>${adminTeam.address}</td></tr>
                <tr><th>Aadhaar Number</th><td>${adminTeam.aadhaarNumber}</td></tr>
            </table>

            <!-- Status Update Form -->
            <div class="status-update">
                <form action="updateAdminTeamStatus" method="post">
                    <input type="hidden" name="id" value="${adminTeam.id}">
                    <label for="status">Update Status:</label>
                    <select name="status">
                        <option value="Rejected" ${adminTeam.status == 'Rejected' ? 'selected' : ''}>Rejected</option>
                        <option value="Accepted" ${adminTeam.status == 'Accepted' ? 'selected' : ''}>Accepted</option>
                    </select>
                    
                    <button type="submit">Update Status</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
