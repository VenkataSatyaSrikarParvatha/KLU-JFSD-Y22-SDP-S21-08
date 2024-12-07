<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Link to your general stylesheet -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <style>
        /* General styling for the navbar */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .navbar {
            width: 250px;
            height: 100%;
            background-color: #2193b0;
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 20px;
            box-shadow: 2px 0px 10px rgba(0, 0, 0, 0.1);
            transition: width 0.3s ease;
        }

        .navbar a {
            display: flex;
            align-items: center;
            color: white;
            padding: 16px;
            text-decoration: none;
            font-size: 1.1rem;
            margin-bottom: 10px;
            transition: background-color 0.3s ease;
        }

        .navbar a:hover {
            background-color: #6dd5ed;
        }

        /* Adding Font Awesome icons to navbar links */
        .navbar a i {
            margin-right: 10px;
        }

        .navbar .header {
            text-align: center;
            color: white;
            font-size: 1.5rem;
            margin-bottom: 20px;
        }

        .content {
            margin-left: 250px;
            padding: 20px;
            transition: margin-left 0.3s ease;
        }

        .content h2 {
            color: #2193b0;
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .content p {
            font-size: 1.1rem;
            color: #555;
        }

        .logout-btn {
            background-color: #f44336;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .logout-btn:hover {
            background-color: #e53935;
        }

        /* To make the navbar collapsible for mobile */
        @media (max-width: 768px) {
            .navbar {
                width: 100%;
                height: auto;
            }

            .content {
                margin-left: 0;
            }

            .navbar a {
                padding: 12px;
            }
        }
    </style>
</head>
<body>

    <!-- Admin Navbar -->
    <div class="navbar">
        <div class="header">
            Admin Dashboard
        </div>
        <a href="/adminhome"><i class="fas fa-home"></i> Home</a>
        <a href="/viewallcounselors"><i class="fas fa-users"></i> View Counselors</a>
        <a href="viewalldoctors"><i class="fas fa-user-md"></i> View Doctors</a>
        <a href="/viewalllegaladvisors"><i class="fas fa-gavel"></i> View Legal Advisors</a>
        <a href="/viewallsurvivors"><i class="fas fa-heart"></i> View Survivors</a>
        <a href="/viewalladminteam"><i class="fas fa-users-cog"></i> View Admin Team</a>
        <a href="addAdminTeam"><i class="fas fa-user-plus"></i> Add Admin Team</a>
        <a href="/adminlogout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>


</body>
</html>
