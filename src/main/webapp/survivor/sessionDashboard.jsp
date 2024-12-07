<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Session Dashboard</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Session Dashboard</h1>
    <h2>${session.title}</h2>
    <p>${session.context}</p>
    <h3>Counselor Details:</h3>
    <p>Name: ${session.counselorName}</p>
    <p>Role: ${session.counselorRole}</p>
</body>
</html>
