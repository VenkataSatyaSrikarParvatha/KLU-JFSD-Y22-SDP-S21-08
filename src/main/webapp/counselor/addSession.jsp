<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="counselorNavbar.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Session</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 60%;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #2193b0;
            font-size: 2rem;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 15px;
            font-size: 1rem;
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
        <h2>Add a New Session</h2>
        <form method="POST" action="/submitSession">
            <div>
                <label for="title">Title</label>
                <input type="text" id="title" name="title" required/>
            </div>

            <div>
                <label for="context">Context</label>
                <textarea id="context" name="context" required></textarea>
            </div>



            <button type="submit">Submit Session</button>
        </form>
    </div>

</body>
</html>
