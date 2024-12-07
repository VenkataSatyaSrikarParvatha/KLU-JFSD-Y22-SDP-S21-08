<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Counselor</title>
</head>
<body>
    <h2>Delete Counselor</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Specialization</th>
                <th>Email</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="counselors" items="${counselors}">
                <tr>
                    <td>${counselors.id}</td>
                    <td>${counselors.username}</td>
                    <td>${counselors.specialization}</td>
                    <td>${counselors.email}</td>
                    <td>
                        <form action="confirmDeleteCounselor" method="post">
                            <input type="hidden" name="id" value="${counselor.id}">
                            <input type="submit" value="Delete">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
