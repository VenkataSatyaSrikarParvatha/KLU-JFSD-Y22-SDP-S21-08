<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Session Dashboard</title>
    <style>
    /* styles.css */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f9;
    margin: 0;
    padding: 0;
}

nav ul {
    list-style-type: none;
    padding: 0;
    background-color: #333;
    margin: 0;
}

nav ul li {
    display: inline;
    margin-right: 15px;
}

nav ul li a {
    color: white;
    text-decoration: none;
    padding: 10px 20px;
}

nav ul li a:hover {
    background-color: #555;
}

.container {
    margin: 20px;
}

h1, h2, h3 {
    color: #333;
}

.survivors-list {
    margin-top: 20px;
}

.survivor-card {
    background-color: white;
    padding: 15px;
    margin-bottom: 10px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.survivor-card p {
    margin: 5px 0;
}

.action-buttons {
    margin-top: 10px;
}

.accept-button, .reject-button {
    padding: 8px 16px;
    margin-right: 10px;
    border: none;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-size: 14px;
}

.accept-button {
    background-color: #4CAF50;
}

.accept-button:hover {
    background-color: #45a049;
}

.reject-button {
    background-color: #f44336;
}

.reject-button:hover {
    background-color: #e53935;
}

.back-home {
    display: inline-block;
    margin-top: 20px;
    color: #333;
    text-decoration: none;
    font-size: 16px;
}

.back-home:hover {
    text-decoration: underline;
}
    
    </style>
</head>
<body>

    <!-- Navigation Bar (Assuming counselor is logged in) -->
    <nav>
        <ul>
            <li><a href="<c:url value='/counselor/mySessions' />">My Sessions</a></li>
            <li><a href="<c:url value='/counselor/profile' />">Profile</a></li>
            <li><a href="<c:url value='/counselor/logout' />">Logout</a></li>
            <li><a href="<c:url value='/counselorhome' />">Home</a></li>
        </ul>
    </nav>

    <div class="container">
        <h1>Session Dashboard</h1>

        <!-- Display Session Details -->
        <h2>Session Title: ${session.title}</h2>
        <p><strong>Context:</strong> ${session.context}</p>
        <p><strong>Created At:</strong> ${session.createdAt}</p>

        <h3>Registered Survivors for This Session</h3>

        <!-- Check if survivors are available -->
        <c:if test="${not empty survivors}">
            <div class="survivors-list">
                <c:forEach var="survivor" items="${survivors}">
                    <div class="survivor-card">
                        <p><strong>Survivor:</strong> ${survivor.survivorTheVictimName}</p>
                        <p><strong>Status:</strong> ${survivor.survivorTheVictimStatus}</p>

                        <!-- Action Buttons -->
                        <div class="action-buttons">
                            <a href="<c:url value='/counselor/acceptSurvivor' />?sessionId=${session.id}&survivorId=${survivor.id}&action=accept" class="accept-button">Accept</a>
                            <a href="<c:url value='/counselor/acceptSurvivor' />?sessionId=${session.id}&survivorId=${survivor.id}&action=reject" class="reject-button">Reject</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
        
        
        <c:if test="${not empty sessions}">
        <table border="1">
            <thead>
                <tr>
                    <th>Session Title</th>
                    <th>Session Context</th>
                    <th>Survivor Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Loop through all the counselor's sessions -->
                <c:forEach items="${sessions}" var="session">
                    <tr>
                        <td>${session.title}</td>
                        <td>${session.context}</td>
                        <td>${session.survivorTheVictimStatus}</td>
                        <td>
                            <!-- If the survivor's status is 'Registered', show buttons to accept or reject -->
                            <c:if test="${session.survivorTheVictimStatus == 'Registered'}">
                                <form action="${pageContext.request.contextPath}/acceptSurvivorForSession" method="post" style="display:inline;">
                                    <input type="hidden" name="sessionId" value="${session.id}">
                                    <input type="hidden" name="survivorId" value="${session.survivorTheVictimId}">
                                    <button type="submit">Accept Survivor</button>
                                </form>

                                <form action="${pageContext.request.contextPath}/rejectSurvivorForSession" method="post" style="display:inline;">
                                    <input type="hidden" name="sessionId" value="${session.id}">
                                    <input type="hidden" name="survivorId" value="${session.survivorTheVictimId}">
                                    <button type="submit">Reject Survivor</button>
                                </form>
                            </c:if>
                            <!-- Show a message if the survivor has already been accepted or rejected -->
                            <c:if test="${session.survivorTheVictimStatus == 'Accepted'}">
                                <span>Survivor Accepted</span>
                            </c:if>
                            <c:if test="${session.survivorTheVictimStatus == 'Rejected'}">
                                <span>Survivor Rejected</span>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <!-- Message if no sessions are available -->
    <c:if test="${empty sessions}">
        <p>No sessions created yet.</p>
    </c:if>

        <!-- If no survivors found -->
        <c:if test="${empty survivors}">
            <p>No survivors registered for this session.</p>
        </c:if>

        <!-- Back to Home Link -->
        <a href="<c:url value='/counselorhome' />" class="back-home">Go back to Home</a>
    </div>

</body>
</html>
