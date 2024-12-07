<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Survivor Login</title>
</head>
<body>
    <h1>Survivor Login</h1>
    <form action="/loginSurvivor" method="post">
        <label for="survivorName">Name:</label>
        <input type="text" id="survivorName" name="survivorName" required>
        <br>
        <label for="survivorPassword">Password:</label>
        <input type="password" id="survivorPassword" name="survivorPassword" required>
        <br>
        <button type="submit">Login</button>
    </form>
    <c:if test="${not empty error}">
        <p style="color: red;">${error}</p>
    </c:if>
</body>
</html>
