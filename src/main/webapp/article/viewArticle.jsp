<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${article.title}</title>
    <style>
        .container {
            margin: 50px auto;
            max-width: 800px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #2193b0;
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .article-content {
            margin-bottom: 20px;
        }

        .author-info {
            margin-top: 20px;
            padding: 10px;
            background-color: #f1f1f1;
            border-radius: 5px;
        }

        .image-container {
            text-align: center;
            margin-top: 20px;
        }

        .image-container img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
        }

        .actions {
            text-align: center;
            margin-top: 20px;
        }

        .actions a {
            text-decoration: none;
            color: #fff;
            background-color: #2193b0;
            padding: 10px 20px;
            border-radius: 5px;
            margin: 5px;
            transition: background-color 0.3s ease;
        }

        .actions a:hover {
            background-color: #6dd5ed;
        }

        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>${article.title}</h1>

        <div class="article-content">
            <p><strong>Context:</strong> ${article.context}</p>
            <p><strong>Content:</strong> ${article.content}</p>
        </div>

        <div class="image-container">
            <c:if test="${not empty article.image}">
                <img src="/getArticleImage?id=${article.id}" alt="Article Image" />
            </c:if>
        </div>

        <div class="author-info">
            <p><strong>Author Name:</strong> ${article.authorName}</p>
            <p><strong>Author Role:</strong> ${article.authorRole}</p>
            <p><strong>Created At:</strong> ${article.createdAt}</p>
            <p><strong>Anonymous:</strong> ${article.isAnonymous ? 'Yes' : 'No'}</p>
        </div>

        <div class="actions">
            <a href="/articles">Back to Articles List</a>
        </div>
    </div>
</body>
</html>
