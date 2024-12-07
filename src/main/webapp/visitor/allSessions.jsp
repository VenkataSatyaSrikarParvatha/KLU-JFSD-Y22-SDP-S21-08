<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="visitor_navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Sessions</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/survivor/styles.css">
</head>
<body>
    <div class="container">
        <h1>All Sessions</h1>

        <!-- Check if there are any sessions -->
        <c:if test="${not empty sessions}">
            <ul class="session-list">
                <c:forEach var="session" items="${sessions}">
                    <li class="session-item">
                        <p><strong>Session Title:</strong> ${session.title}</p>
                        <p><strong>Date:</strong> ${session.date}</p>
                        <p><strong>Details:</strong> ${session.details}</p>
                    </li>
                </c:forEach>
            </ul>
        </c:if>

        <!-- If no sessions are available -->
        <c:if test="${empty sessions}">
            <p>No sessions available at the moment.</p>
        </c:if>
    </div>
</body>
</html>
