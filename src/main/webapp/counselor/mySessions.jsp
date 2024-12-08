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
            font-family: 'Roboto', sans-serif;
            background-color: #fafbfc; /* Light background */
            margin: 0;
            padding: 0;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-top: 50px;
            font-size: 36px;
            font-weight: 600;
        }

        .container {
            width: 90%;
            margin: 0 auto;
            max-width: 1200px;
        }

        .card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            margin-top: 40px;
            overflow: hidden;
        }

        .card-header {
            background-color: #3498db;
            color: white;
            padding: 20px;
            font-size: 24px;
            text-align: center;
            border-radius: 10px 10px 0 0;
        }

        .card-body {
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 16px;
            text-align: left;
            font-size: 16px;
            color: #2c3e50;
        }

        th {
            background-color: #2980b9;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f4f6f9;
        }

        tr:hover {
            background-color: #ecf0f1;
        }

        td button {
            padding: 8px 16px;
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 14px;
        }

        td button:hover {
            background-color: #2ecc71;
        }

        .no-sessions {
            text-align: center;
            font-size: 18px;
            color: #e74c3c;
            margin-top: 40px;
        }

    </style>
</head>

<body>

    <div class="container">
        <h1>My Sessions</h1>

        <c:if test="${not empty sessions}">
            <div class="card">
                <div class="card-header">
                    Sessions Overview
                </div>
                <div class="card-body">
                    <table border="0">
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
                                        <form action="/sessionDashboard" method="get">
                                            <input type="hidden" name="sessionId" value="${session.id}" />
                                            <button type="submit">Go to Dashboard</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:if>

        <c:if test="${empty sessions}">
            <div class="no-sessions">
                <p>No sessions available.</p>
            </div>
        </c:if>
    </div>

</body>
</html>
