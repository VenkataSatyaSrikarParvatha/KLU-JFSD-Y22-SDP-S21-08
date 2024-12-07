<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Confirm Delete Counselor</title>
</head>
<body>
    <h2>Are you sure you want to delete this Counselor?</h2>
    <form action="deleteCounselor" method="post">
        <input type="hidden" name="id" value="${id}">
        <input type="submit" value="Yes, Delete">
    </form>
    <a href="viewallcounselors">No, Go Back</a>
</body>
</html>
