<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="counselorNavbar.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Article Submission Success</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Arial', sans-serif;
            background: #f0f4f7; /* Light gray background */
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            width: 70%;
            max-width: 900px;
            margin: 50px auto;
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            color: #4caf50;
            font-size: 2rem;
            margin-bottom: 20px;
            font-weight: 700;
        }

        p {
            font-size: 1.1rem;
            color: #555;
            margin-bottom: 30px;
        }

        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .button-container a {
            background-color: #4caf50;
            color: white;
            padding: 12px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 1rem;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .button-container a:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }

        .button-container a:active {
            transform: scale(0.98);
        }

        /* Responsive Design for Mobile */
        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 20px;
            }

            h1 {
                font-size: 1.6rem;
            }

            p {
                font-size: 1rem;
            }

            .button-container a {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Article Submitted Successfully!</h1>
        <p>Thank you for submitting your article. It will be reviewed soon. You can view your article or create a new one using the options below.</p>

        <div class="button-container">
            <a href="/myArticles">View My Articles</a>
            <a href="/addArticle">Write a New Article</a>
        </div>
    </div>

</body>
</html>
