<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="adminNavbar.jsp" %> <!-- Import the admin navbar -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Admin Team</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css"> <!-- External CSS link -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f4f4f9;
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
            color: #333;
            margin-bottom: 30px;
        }

        .admin-cards-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .admin-card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
            text-align: center;
            transition: all 0.3s ease-in-out;
            color: #333;
        }

        .admin-card:hover {
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
        }

        .admin-card img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #2193b0;
        }

        .admin-card h3 {
            font-size: 1.6rem;
            margin-top: 10px;
        }

        .admin-card p {
            font-size: 1rem;
            color: #777;
        }

        .status {
            padding: 5px 10px;
            border-radius: 5px;
            font-weight: bold;
            text-transform: uppercase;
            display: inline-block;
            margin-top: 10px;
        }

        .status.accepted {
            background-color: #4CAF50;
            color: white;
        }

        .status.rejected {
            background-color: #f44336;
            color: white;
        }

        .status.pending {
            background-color: #ff9800;
            color: white;
        }

        .view-details-btn {
            display: inline-block;
            margin-top: 15px;
            padding: 8px 16px;
            background-color: #2193b0;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: all 0.3s ease-in-out;
        }

        .view-details-btn:hover {
            background-color: #006f8e;
            transform: scale(1.05);
        }

        .back-btn {
            display: inline-block;
            margin-top: 30px;
            padding: 8px 16px;
            background-color: #2193b0;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: all 0.3s ease-in-out;
        }

        .back-btn:hover {
            background-color: #006f8e;
            transform: scale(1.05);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .admin-card {
                width: 250px;
            }

            .admin-cards-container {
                justify-content: space-evenly;
            }
        }
    </style>
</head>
<body>
    <div class="content">
        <h2>All Admin Team Members</h2>
        <div class="admin-cards-container">
            <c:forEach var="admin" items="${adminTeam}">
                <div class="admin-card">
                    <!-- Ensure the admin has a profile image -->
                    
                    
                    <h3>${admin.username}</h3>
                    <p><strong>Email:</strong> ${admin.email}</p>
                    <p><strong>Phone:</strong> ${admin.phone}</p>
                    <p><strong>Date of Birth:</strong> ${admin.dateOfBirth}</p>
                    <p><strong>Status:</strong> 
                    
                        <!-- Display status with color based on value -->
                        <span class="status 
                            ${admin.status == 'Accepted' ? 'accepted' : 
                             (admin.status == 'Rejected' ? 'rejected' : 'pending')}">
                            ${admin.status}
                        </span>
                    </p>
                    <!-- Corrected the URL path for the details page -->
                    <a href="viewAdminTeamDetails?id=${admin.id}" class="view-details-btn">View Details</a>
                </div>
            </c:forEach>
        </div>
        <a href="adminhome" class="back-btn">Back to Admin Home</a>
    </div>
</body>
</html>
