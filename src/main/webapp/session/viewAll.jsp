<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Sessions</title>
</head>
<body>
    <h1>All Sessions</h1>
    <c:if test="${not empty sessions}">
        <table border="1">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Context</th>
                    <th>Counselor Name</th>
                    <th>Survivor Name</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="session" items="${sessions}">
                    <tr>
                        <td>${session.title}</td>
                        <td>${session.context}</td>
                        <td>${session.counselorName}</td>
                        <td>${session.survivorTheVictimName}</td>
                        <td>${session.survivorTheVictimStatus}</td>
                        <td>
                            <form action="/updateStatus/${session.id}" method="post">
                                <label for="status">Change Status:</label>
                                <select id="status" name="status">
                                    <option value="Accepted">Accepted</option>
                                    <option value="Rejected">Rejected</option>
                                </select>
                                <button type="submit">Update</button>
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
