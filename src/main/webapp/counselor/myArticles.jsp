<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="counselorNavbar.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Articles</title>
    <style>
/* Body and General Styling */
body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f7fa;
}

h1 {
    color: #2193b0;
    text-align: center;
    margin-top: 30px;
}

/* Article List */
.article-list {
    list-style-type: none;
    padding: 0;
    margin: 20px auto;
    max-width: 800px;
}

/* Article Item Styling */
.article-item {
    background-color: #ffffff;
    margin: 15px 0;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s ease-in-out;
}

.article-item:hover {
    transform: translateY(-5px);
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

.article-item h2 {
    color: #333;
    font-size: 1.5rem;
    margin-bottom: 10px;
}

.article-item p {
    color: #555;
    font-size: 1rem;
    line-height: 1.5;
}

/* Message when no articles are available */
.message {
    color: red;
    font-size: 1.2rem;
    text-align: center;
    margin-top: 20px;
}

/* Back Link Styling */
.back-link {
    display: inline-block;
    margin-top: 30px;
    padding: 12px 18px;
    background-color: #2193b0;
    color: #ffffff;
    text-decoration: none;
    border-radius: 5px;
    font-size: 1rem;
    text-align: center;
}

.back-link:hover {
    background-color: #1c7e8b;
}

/* Responsive Design */
@media screen and (max-width: 768px) {
    .article-item {
        padding: 15px;
    }

    .back-link {
        padding: 10px 15px;
    }
}

@media screen and (max-width: 480px) {
    h1 {
        font-size: 1.5rem;
    }

    .article-item h2 {
        font-size: 1.25rem;
    }

    .back-link {
        font-size: 0.9rem;
    }
}

    </style>
</head>
<body>

    <h1>Your Articles</h1>

    <!-- Check if there are articles to display -->
    <c:if test="${not empty articles}">
        <ul class="article-list">
            <!-- Loop through the articles -->
            <c:forEach var="article" items="${articles}">
                <li class="article-item">
                    <h2>${article.title}</h2>
                    <p><strong>Content:</strong> ${article.content}</p>
                    <p><strong>Context:</strong> ${article.context}</p>
                </li>
            </c:forEach>
        </ul>
    </c:if>

    <!-- If no articles are available, show a message -->
    <c:if test="${empty articles}">
        <p class="message">You have not written any articles yet.</p>
    </c:if>

    <!-- Link to go back to the counselor's homepage or other page -->
    <a href="${pageContext.request.contextPath}/counselorHome" class="back-link">Go Back to Home</a>

</body>
</html>
