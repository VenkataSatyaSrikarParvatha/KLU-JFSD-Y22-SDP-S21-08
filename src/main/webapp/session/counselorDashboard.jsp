<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Counselor</title>
</head>
<body>
    <h1>Welcome, ${counselorSession.counselorName}</h1>
    <h2>Your Created Sessions</h2>
    <c:if test="${not empty sessions}">
        <table border="1">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Context</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="session" items="${sessions}">
                    <tr>
                        <td>${session.title}</td>
                        <td>${session.context}</td>
                        <td>${session.survivorTheVictimStatus}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:if test="${empty sessions}">
        <p>You have not created any sessions.</p>
    </c:if>
    <a href="/create">Create New Session</a>
</body>
</html>
