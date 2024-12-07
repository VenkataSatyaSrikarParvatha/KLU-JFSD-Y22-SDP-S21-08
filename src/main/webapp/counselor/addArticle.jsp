<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="counselorNavbar.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Article</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 70%;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #2193b0;
            font-size: 2rem;
            margin-bottom: 30px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 15px;
            font-size: 1rem;
        }

        input[type="file"] {
            padding: 3px;
        }

        button {
            background-color: #2193b0;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            width: 100%;
        }

        button:hover {
            background-color: #6dd5ed;
        }

        .checkbox-container {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .checkbox-container input {
            margin-right: 10px;
        }

        .form-links {
            text-align: center;
            margin-top: 20px;
        }

        .form-links a {
            color: #2193b0;
            text-decoration: none;
            font-weight: bold;
        }

        .form-links a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 20px;
            }

            button {
                width: 100%;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Create a New Article</h1>
        <form action="/counselor/submitArticle" method="post" enctype="multipart/form-data">
            <div>
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" placeholder="Enter article title" required>
            </div>
            <div>
                <label for="context">Context (optional):</label>
                <input type="text" id="context" name="context" placeholder="Short description of the article">
            </div>
            <div>
                <label for="content">Content:</label>
                <textarea id="content" name="content" placeholder="Enter full article content" rows="10" required></textarea>
            </div>
            <div>
                <label for="image">Upload Image (Optional):</label>
                <input type="file" id="image" name="image" accept="image/*">
            </div>
            <div class="checkbox-container">
                <input type="checkbox" id="anonymous" name="anonymous" value="true">
                <label for="anonymous">Submit as Anonymous</label>
            </div>
            <div>
                <button type="submit">Submit Article</button>
            </div>
        </form>

        <div class="form-links">
            <br>
            <a href="/counselor/myArticles">View My Articles</a>
        </div>
    </div>

</body>
</html>
