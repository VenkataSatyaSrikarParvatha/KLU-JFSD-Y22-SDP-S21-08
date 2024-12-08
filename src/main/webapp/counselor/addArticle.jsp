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
        /* Global Styles */
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(45deg, #ff7e5f, #feb47b); /* Gradient background */
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            width: 70%;
            max-width: 900px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.8s ease-out;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h1 {
            text-align: center;
            color: #333;
            font-size: 2.2rem;
            margin-bottom: 30px;
            font-weight: 700;
            letter-spacing: 1px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            color: #555;
            font-size: 1rem;
        }

        input[type="text"],
        textarea,
        input[type="file"] {
            width: 100%;
            padding: 12px;
            border: 2px solid #ddd;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 1rem;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input[type="file"] {
            padding: 6px;
        }

        input:focus,
        textarea:focus {
            border-color: #ff7e5f;
            box-shadow: 0 0 5px rgba(255, 126, 95, 0.5);
            outline: none;
        }

        button {
            background-color: #ff7e5f;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1.1rem;
            transition: background-color 0.3s ease, transform 0.2s ease;
            width: 100%;
        }

        button:hover {
            background-color: #feb47b;
            transform: scale(1.05);
        }

        button:active {
            transform: scale(0.98);
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
            color: #ff7e5f;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .form-links a:hover {
            color: #feb47b;
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

        /* Responsive Design for Mobile */
        @media (max-width: 480px) {
            h1 {
                font-size: 1.8rem;
            }

            input[type="text"],
            textarea,
            button {
                font-size: 1rem;
            }

            button {
                padding: 10px;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Create a New Article</h1>
        <form action="/submitArticle" method="post" enctype="multipart/form-data">
            <!-- Title Field -->
            <div>
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" placeholder="Enter article title" required>
            </div>

            <!-- Context Field (Optional) -->
            <div>
                <label for="context">Context (optional):</label>
                <input type="text" id="context" name="context" placeholder="Short description of the article">
            </div>

            <!-- Content Field -->
            <div>
                <label for="content">Content:</label>
                <textarea id="content" name="content" placeholder="Enter full article content" rows="10" required></textarea>
            </div>

            <!-- Image Upload Field (Optional) -->
            <div>
                <label for="image">Upload Image (Optional):</label>
                <input type="file" id="image" name="image" accept="image/*">
            </div>

            <!-- Anonymous Submission Checkbox -->
            <div class="checkbox-container">
                <input type="checkbox" id="anonymous" name="anonymous" value="true">
                <label for="anonymous">Submit as Anonymous</label>
            </div>

            <!-- Submit Button -->
            <div>
                <button type="submit">Submit Article</button>
            </div>
        </form>

        <!-- Links -->
        <div class="form-links">
            <a href="/myArticles">View My Articles</a>
        </div>
    </div>

</body>
</html>
