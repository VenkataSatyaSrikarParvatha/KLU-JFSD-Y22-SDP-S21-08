<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="survivorNavbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Success</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body>

    <div class="container">
        <h1>Registration Successful</h1>
        <p>${message}</p>
        <a href="<c:url value='/allSessions' />">View More Sessions</a>
        <a href="<c:url value='/survivorhome' />">Back to Home</a>
    </div>
</body>
</html>
