<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="survivorNavbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Articles</title>

    <!-- Internal CSS -->
    <style>
        /* Global Styles */
        body {
            font-family: 'Helvetica Neue', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f1f8ff;  /* Light blue background */
            color: #333;
        }

        h1 {
            text-align: center;
            font-size: 3rem;
            color: #fff;
            font-weight: 700;
            margin: 0;
            padding: 60px 0;
            background: linear-gradient(135deg, #6a82fb, #fc5c7d); /* Cool purple to pink gradient */
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
        }

        /* Main Container */
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }

        /* Section Title for Articles */
        .section-title {
            text-align: center;
            font-size: 1.8rem;
            color: #333;
            margin-bottom: 40px;
            font-weight: 600;
        }

        /* Article Cards Layout */
        .article-list {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            justify-content: space-between;
        }

        .article-card {
            width: 30%;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            position: relative;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .article-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.15);
        }

        .article-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-bottom: 3px solid #6a82fb; /* Soft purple border */
        }

        .article-card-content {
            padding: 20px;
        }

        .article-card-title {
            font-size: 1.6rem;
            color: #2c3e50;
            margin-bottom: 15px;
            font-weight: 600;
        }

        .article-card-excerpt {
            font-size: 1rem;
            color: #7f8c8d;
            line-height: 1.6;
            margin-bottom: 15px;
        }

        .article-card-actions {
            text-align: right;
        }

        .article-card-actions a {
            text-decoration: none;
            color: #fff;
            background-color: #6a82fb; /* Soft purple button */
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .article-card-actions a:hover {
            background-color: #fc5c7d; /* Pink hover effect */
        }

        /* No Articles Message */
        .no-articles {
            text-align: center;
            font-size: 1.5rem;
            color: #888;
            margin-top: 30px;
        }

        /* Action Button for New Article */
        .actions {
            text-align: center;
            margin-top: 50px;
        }

        .actions a {
            text-decoration: none;
            color: #fff;
            background-color: #3498db; /* Soft blue button */
            padding: 12px 30px;
            border-radius: 5px;
            font-size: 1.2rem;
            transition: background-color 0.3s ease;
        }

        .actions a:hover {
            background-color: #2980b9; /* Darker blue hover */
        }

        /* Mobile Responsiveness */
        @media (max-width: 768px) {
            .article-card {
                width: 100%;
            }

            .section-title {
                font-size: 1.4rem;
            }

            .actions a {
                padding: 10px 20px;
                font-size: 1rem;
            }
        }
    </style>
</head>

<body>
    <h1>All Articles</h1>

    <div class="container">
        <div class="section-title">Browse through the latest articles</div>

        <!-- Check if articles exist -->
        <c:if test="${not empty articles}">
            <div class="article-list">
            
                <!-- Loop through articles and display each in a card format -->
                <c:forEach var="article" items="${articles}">
                <br><br>
               
                    <div class="article-card">
                        <!-- Display Image if available -->
                        <c:if test="${not empty article.image}">
                            <img src="/getArticleImage?id=${article.id}" alt="Article Image" />
                        </c:if>
                        <div class="article-card-content">
                            <div class="article-card-title">${article.title}</div>
                            <div class="article-card-excerpt">
                                ${article.context}
                            </div>
                            <div class="article-card-actions">
                                <a href="/viewArticle?id=${article.id}">Read More</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <!-- Message if no articles exist -->
        <c:if test="${empty articles}">
            <p class="no-articles">No articles available at the moment.</p>
        </c:if>

        <!-- Create new article button -->
        <div class="actions">
            <a href="/createArticle">Create New Article</a>
        </div>
    </div>
</body>
</html>
