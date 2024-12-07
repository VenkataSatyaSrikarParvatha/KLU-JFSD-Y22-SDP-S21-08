<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="navbar.jsp" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Articles</title>
</head>
<body>
    <h2>My Articles</h2>
    <c:if test="${not empty articles}">
        <table border="1">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Context</th>
                    <th>Submitted On</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="article" items="${articles}">
                    <tr>
                        <td>${article.title}</td>
                        <td>${article.context}</td>
                        <td>${article.createdAt}</td>
                        <td><a href="viewArticle?id=${article.id}">View</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:if test="${empty articles}">
        <p>No articles found.</p>
    </c:if>
    <a href="doctorHome">Back to Home</a>
</body>
</html>
