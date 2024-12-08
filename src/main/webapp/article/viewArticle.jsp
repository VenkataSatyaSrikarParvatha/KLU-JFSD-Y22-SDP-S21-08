<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${article.title}</title>

    <!-- Internal CSS -->
    <style>
        /* Global Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f7f7f7;
            color: #333;
            font-size: 1rem;
            line-height: 1.7;
        }

        /* Container */
        .container {
            width: 85%;
            max-width: 900px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        /* Article Header with Image */
        .article-header {
            text-align: center;
            margin-bottom: 30px;
            position: relative;
        }

        .article-header img {
            width: 100%;
            height: auto;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }

        .article-header h1 {
            color: #2c3e50;
            font-size: 2.5rem;
            font-weight: 700;
            margin-top: 20px;
            line-height: 1.3;
        }

        /* Article Metadata */
        .article-header .metadata {
            font-size: 1rem;
            color: #7f8c8d;
            margin-top: 10px;
        }

        .article-header .metadata span {
            margin-right: 15px;
        }

        /* Article Content Section */
        .article-content {
            margin-top: 40px;
            color: #555;
            font-size: 1.1rem;
            line-height: 1.8;
            text-align: justify;
        }

        .article-content h2 {
            color: #34495e;
            font-size: 2rem;
            margin-top: 40px;
        }

        .article-content p {
            margin-bottom: 20px;
        }

        /* Author Info Section */
        .author-info {
            text-align: center;
            font-size: 1.1rem;
            color: #34495e;
            margin-top: 40px;
            background-color: #ecf0f1;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
        }

        .author-info span {
            font-weight: 600;
        }

        /* Floating Back Button */
        .actions {
            position: fixed;
            bottom: 30px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #3498db;
            padding: 15px 30px;
            border-radius: 30px;
            color: white;
            font-size: 1.2rem;
            font-weight: bold;
            text-decoration: none;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }

        .actions:hover {
            background-color: #2980b9;
            transform: translateY(-5px);
        }

        /* Responsive Design for Mobile */
        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 20px;
            }

            .article-header h1 {
                font-size: 2rem;
            }

            .article-content {
                font-size: 1rem;
            }

            .actions {
                font-size: 1rem;
                padding: 12px 25px;
            }

            .image-container img {
                width: 100%;
            }
        }

    </style>
</head>
<body>

    <!-- Main Content Container -->
    <div class="container">
        <!-- Article Header with Image -->
        <div class="article-header">
            <c:if test="${not empty article.image}">
                <img src="/getArticleImage?id=${article.id}" alt="Article Image" />
            </c:if>
            <h1>${article.title}</h1>
            <div class="metadata">
                <span><strong>Published on:</strong> ${article.createdAt}</span>
                <span><strong>By:</strong> ${article.authorName},</span>
                <span>${article.isAnonymous ? 'Anonymous' : article.authorRole}</span>
            </div>
        </div>

        <!-- Article Content Section -->
        <div class="article-content">
            <h2>Context:</h2>
            <p>${article.context}</p>
            <h2>Content:</h2>
            <p>${article.content}</p>
        </div>

        <!-- Author Info Section -->
        <div class="author-info">
            <p><strong>Author:</strong> ${article.authorName}</p>
            <p><strong>Role:</strong> ${article.authorRole}</p>

        </div>
    </div>

    <!-- Floating Back Button -->
    <a href="/articles" class="actions">Back to Articles List</a>

</body>
</html>
