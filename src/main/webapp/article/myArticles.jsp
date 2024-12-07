<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Articles</title>
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

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th, table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        table th {
            background-color: #6dd5ed;
            color: white;
            font-weight: bold;
        }

        table td {
            background-color: #f9f9f9;
        }

        .actions {
            text-align: center;
            margin-top: 20px;
        }

        .actions a, .actions button {
            text-decoration: none;
            color: #fff;
            background-color: #2193b0;
            padding: 10px 20px;
            border-radius: 5px;
            margin: 5px;
            transition: background-color 0.3s ease;
            border: none;
        }

        .actions a:hover, .actions button:hover {
            background-color: #6dd5ed;
        }

        .no-articles {
            text-align: center;
            font-size: 1.2rem;
            color: #888;
        }

        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }

            table th, table td {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>My Articles</h1>

        <c:if test="${not empty articles}">
            <table>
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Context</th>
                        <th>View</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="article" items="${articles}">
                        <tr>
                            <td>${article.title}</td>
                            <td>${article.context}</td>
                            <td><a href="article?id=${article.id}">View</a></td>
                            <td>
                                <form action="deleteArticle" method="post" onsubmit="return confirm('Are you sure you want to delete this article?')">
                                    <input type="hidden" name="id" value="${article.id}" />
                                    <button type="submit">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${empty articles}">
            <p class="no-articles">You have not written any articles yet.</p>
        </c:if>

        <div class="actions">
            <a href="/createArticle">Create New Article</a>
        </div>
    </div>
</body>
</html>
