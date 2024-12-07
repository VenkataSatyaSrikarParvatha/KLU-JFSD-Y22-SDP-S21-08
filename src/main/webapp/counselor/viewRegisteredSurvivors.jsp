<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registered Survivors</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body>

    <div class="container">
        <h1>Registered Survivors for Session</h1>

        <c:forEach var="session" items="${sessions}">
            <div class="session-card">
                <h3>${session.title}</h3>
                <p>${session.context}</p>

                <!-- List of survivors registered for the session -->
                <c:forEach var="survivor" items="${session.survivors}">
                    <div class="survivor-card">
                        <p><strong>Survivor:</strong> ${survivor.username}</p>
                        <p><strong>Status:</strong> ${survivor.status}</p>
                        <a href="<c:url value='/counselor/acceptSurvivor' />?sessionId=${session.id}&survivorId=${survivor.id}&action=accept">Accept</a>
                        <a href="<c:url value='/counselor/acceptSurvivor' />?sessionId=${session.id}&survivorId=${survivor.id}&action=reject">Reject</a>
                    </div>
                </c:forEach>
            </div>
        </c:forEach>

        <a href="<c:url value='/counselorhome' />">Go back to Home</a>
    </div>

</body>
</html>
