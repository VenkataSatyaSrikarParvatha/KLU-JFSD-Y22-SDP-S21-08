<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Most Active Counselors</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body>
    <div class="container">
        <h1>Most Active Counselors</h1>

        <c:if test="${not empty counselorSessionCounts}">
            <table>
                <thead>
                    <tr>
                        <th>Counselor Name</th>
                        <th>Sessions Hosted</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${counselorSessionCounts}">
                        <tr>
                            <td>${item.counselor.name}</td>
                            <td>${item.sessionCount}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty counselorSessionCounts}">
            <p>No active counselors found.</p>
        </c:if>
    </div>
</body>
</html>
