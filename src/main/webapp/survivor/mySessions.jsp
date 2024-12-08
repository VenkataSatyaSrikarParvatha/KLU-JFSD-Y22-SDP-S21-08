<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="survivorNavbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Sessions</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f6d365, #fda085);
            margin: 0;
            padding: 0;
            color: #333;
        }

        .content {
            padding: 20px;
            max-width: 900px;
            margin: 0 auto;
        }

        h2 {
            font-size: 2.5rem;
            font-weight: bold;
            color: #fff;
            margin-bottom: 30px;
            text-align: center;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background: #fff;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
            border-radius: 10px;
            overflow: hidden;
        }

        table thead {
            background: linear-gradient(135deg, #6dd5ed, #2193b0);
            color: #fff;
        }

        table th, table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            text-transform: uppercase;
            font-size: 0.9rem;
        }

        table tbody tr:hover {
            background: #f1f1f1;
        }

        .status {
            font-weight: bold;
            padding: 5px 10px;
            border-radius: 5px;
            color: white;
        }

        .status.accepted {
            background: #4caf50;
        }

        .status.rejected {
            background: #f44336;
        }

        .status.pending {
            background: #ffc107;
        }

        .message {
            text-align: center;
            margin-top: 20px;
            font-size: 1.2rem;
            color: #333;
        }

        .button {
            padding: 8px 16px;
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 14px;
        }

        .button:hover {
            background-color: #2ecc71;
        }
    </style>
</head>
<body>
    <div class="content">
        <h2>My Sessions</h2>

        <c:if test="${not empty message}">
            <div class="message">${message}</div>
        </c:if>

        <c:choose>
            <c:when test="${not empty sessions}">
                <table>
                    <thead>
                        <tr>
                            <th>Session ID</th>
                            <th>Title</th>
                            <th>Context</th>
                            <th>Date Created</th>
                            <th>Status</th>
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
                                    <span class="status ${session.survivorTheVictimStatus.toLowerCase()}">
                                        ${session.survivorTheVictimStatus}
                                    </span>
                                </td>
                                <td>
                                    <c:if test="${session.survivorTheVictimStatus == 'Accepted'}">
                                        <form action="/sessionDashboard" method="get">
                                            <input type="hidden" name="sessionId" value="${session.id}" />
                                            <button type="submit" class="button">Go to Dashboard</button>
                                        </form>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="message">No sessions found.</div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
