<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="counselorNavbar.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Sessions</title>

    <!-- Internal CSS -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-top: 30px;
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e1f5e1;
        }

        form {
            display: inline-block;
        }

        input[type="password"] {
            padding: 5px;
            font-size: 14px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            padding: 8px 12px;
            font-size: 14px;
            color: white;
            background-color: #4CAF50;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        .no-sessions {
            text-align: center;
            font-size: 16px;
            color: #ff5722;
        }

        .container {
            width: 90%;
            margin: 0 auto;
        }
    </style>

</head>
<body>

 <h1>My Sessions</h1>

    <c:if test="${not empty sessions}">
        <table border="1">
            <thead>
                <tr>
                    <th>Session ID</th>
                    <th>Title</th>
                    <th>Context</th>
                    <th>Created At</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="session" items="${sessions}">
                    <tr>
                        <td>${session.id}</td>
                        <td>${session.title}</td>
                        <td>${session.context}</td>
                        <td>${session.createdAt}</td>
                        <td>
                            <form action="/counselor/sessionDashboard" method="get">
                                <input type="hidden" name="sessionId" value="${session.id}" />
                                <button type="submit">Go to Dashboard</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty sessions}">
        <p>No sessions available.</p>
    </c:if>

</body>
</html>
