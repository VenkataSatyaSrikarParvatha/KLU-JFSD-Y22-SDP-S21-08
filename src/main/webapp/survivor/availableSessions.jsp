<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="survivorNavbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Sessions</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #74ebd5, #acb6e5);
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1000px;
            margin: 20px auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        h1 {
            font-size: 2rem;
            color: #4CAF50;
            text-align: center;
            margin-bottom: 20px;
        }

        form.search-form {
            margin-bottom: 20px;
            text-align: center;
        }

        form.search-form input[type="text"] {
            width: 60%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        form.search-form button {
            padding: 10px 20px;
            background: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: left;
        }

        table th {
            background: #4CAF50;
            color: #fff;
        }

        table tr:nth-child(even) {
            background: #f9f9f9;
        }

        table tr:hover {
            background: #f1f1f1;
        }

        button {
            padding: 8px 15px;
            background: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background: #0056b3;
        }

        a {
            text-decoration: none;
            color: #007BFF;
            margin-top: 20px;
            display: inline-block;
            font-size: 1rem;
        }

        a:hover {
            text-decoration: underline;
        }

        .no-sessions {
            text-align: center;
            font-size: 1.2rem;
            color: #777;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Available Sessions</h1>

        <!-- Search Bar -->
        <form class="search-form" action="<c:url value='/searchSessions' />" method="get">
            <input type="text" name="query" placeholder="Search by title or context..." />
            <button type="submit">Search</button>
        </form>
        
        <c:choose>
            <c:when test="${not empty sessions}">
                <table>
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Context</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="session" items="${sessions}">
                            <tr>
                                <td>${session.title}</td>
                                <td>${session.context}</td>
                                <td>
                                    <form action="<c:url value='/registerSurvivorForSession' />" method="post">
                                        <input type="hidden" name="sessionId" value="${session.id}" />
                                        <input type="hidden" name="survivorTheVictimId" value="${sessionScope.survivor.id}" />
                                        <input type="hidden" name="survivorTheVictimName" value="${sessionScope.survivor.username}" />
                                        <input type="hidden" name="survivorTheVictimPassword" value="${sessionScope.survivor.password}" />
                                        <button type="submit" class="action-btn">Register</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p class="no-sessions">No sessions are currently available.</p>
            </c:otherwise>
        </c:choose>

        <a href="<c:url value='/survivorhome' />" class="back-link">Back to Home</a>
    </div>
</body>
</html>
