<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="adminNavbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Legal Advisors List</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
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
        }

        h2 {
            font-size: 2.5rem;
            font-weight: bold;
            color: #fff;
            margin-bottom: 30px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .details-card {
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            padding: 20px;
            color: #555;
        }

        .details-table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
        }

        .details-table th,
        .details-table td {
            padding: 12px;
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

        .view-link {
            color: #2193b0;
            font-weight: bold;
            text-decoration: none;
            padding: 5px 10px;
            display: inline-block;
            transition: all 0.3s ease-in-out;
        }

        .view-link:hover {
            color: #6dd5ed;
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .content {
                margin-left: 0;
                padding: 10px;
            }

            .details-card {
                padding: 15px;
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
        <h2>Legal Advisors</h2>
        <div class="details-card">
            <!-- Table displaying all legal advisors -->
            <table class="details-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Specialization</th>
                        <th>Status</th>
                        <th>View Details</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="legalAdvisor" items="${legalAdvisors}">
                        <tr>
                            <td>${legalAdvisor.id}</td>
                            <td>${legalAdvisor.username}</td>
                            <td>${legalAdvisor.specialization}</td>
                            <td>${legalAdvisor.status}</td>
                            <td><a href="<%= request.getContextPath() %>/viewLegalAdvisorDetails?id=${legalAdvisor.id}" class="view-link">View Details</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
