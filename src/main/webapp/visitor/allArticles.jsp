<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="visitor_navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Articles</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/survivor/styles.css">
</head>
<body>
    <div class="container">
        <h1>All Articles</h1>

        <!-- Check if there are any articles -->
        <c:if test="${not empty articles}">
            <ul class="article-list">
                <c:forEach var="article" items="${articles}">
                    <li class="article-item">
                        <h2>${article.title}</h2>
                        <p><strong>Content:</strong> ${article.content}</p>
                        <p><strong>Context:</strong> ${article.context}</p>
                    </li>
                </c:forEach>
            </ul>
        </c:if>

        <!-- If no articles are available -->
        <c:if test="${empty articles}">
            <p>No articles available at the moment.</p>
        </c:if>
    </div>
</body>
</html>
