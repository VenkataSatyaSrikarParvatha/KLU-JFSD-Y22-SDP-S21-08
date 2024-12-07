<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Articles</title>
</head>
<body>
    <h1>Articles</h1>
    <c:if test="${not empty articles}">
        <table border="1">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Context</th>
                    <th>Author</th>
                    <th>Role</th>
                    <th>View</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="article" items="${articles}">
                    <tr>
                        <td>${article.title}</td>
                        <td>${article.context}</td>
                        <td>${article.authorName}</td>
                        <td>${article.authorRole}</td>
                        <td><a href="article?id=${article.id}">View</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:if test="${empty articles}">
        <p>No articles available.</p>
    </c:if>
</body>
</html>
