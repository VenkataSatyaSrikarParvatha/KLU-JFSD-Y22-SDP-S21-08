<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="adminNavbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Confirm Delete Doctor</title>
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
    <h1>Are you sure you want to delete this doctor?</h1>
    <form action="deleteDoctor" method="post">
        <input type="hidden" name="id" value="${id}">
        <input type="submit" value="Yes, Delete">
    </form>
    <a href="viewalldoctors">No, Go Back</a>
</body>
</html>
