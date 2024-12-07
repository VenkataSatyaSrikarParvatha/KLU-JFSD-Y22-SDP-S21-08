<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="adminNavbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Doctor</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .content {
            margin-left: 250px; /* Adjust for navbar width */
            padding: 20px;
        }

        h2 {
            color: #2193b0;
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table th, table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #6dd5ed;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        .action-buttons a, .action-buttons button {
            margin: 0 5px;
            color: white;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 5px;
        }

        .action-buttons a {
            background-color: #2193b0;
        }

        .action-buttons button {
            background-color: #e74c3c;
            border: none;
            cursor: pointer;
        }

        .action-buttons button:hover {
            background-color: #c0392b;
        }

        /* Responsive design for smaller screens */
        @media (max-width: 768px) {
            .content {
                margin-left: 0;
                padding: 10px;
            }

            table {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <h1>Delete Doctor</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Specialization</th>
            <th>Action</th>
        </tr>
        <c:forEach var="doctor" items="${doctors}">
            <tr>
                <td>${doctor.id}</td>
                <td>${doctor.username}</td>
                <td>${doctor.specialization}</td>
                <td>
                    <form action="deletedoctoraction" method="get">
                        <input type="hidden" name="id" value="${doctor.id}">
                        <input type="submit" value="Delete" onclick="return confirm('Are you sure?')">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="adminhome">Back to Admin Home</a>
</body>
</html>
