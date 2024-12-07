<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login to Session</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Login to Session</h1>
    <form action="/loginSurvivorToSession" method="post">
        <input type="hidden" name="sessionId" value="${session.id}">
        <label for="password">Enter Session Password:</label>
        <input type="password" name="password" id="password" required>
        <button type="submit">Login</button>
    </form>
</body>
</html>
