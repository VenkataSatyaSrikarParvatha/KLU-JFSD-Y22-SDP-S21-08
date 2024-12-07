<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Counselor Login</title>
</head>
<body>
    <h1>Counselor Login</h1>
    <form action="/loginCounselor" method="post">
        <label for="counselorName">Name:</label>
        <input type="text" id="counselorName" name="counselorName" required>
        <br>
        <label for="counselorPassword">Password:</label>
        <input type="password" id="counselorPassword" name="counselorPassword" required>
        <br>
        <button type="submit">Login</button>
    </form>
    <c:if test="${not empty error}">
        <p style="color: red;">${error}</p>
    </c:if>
</body>
</html>
