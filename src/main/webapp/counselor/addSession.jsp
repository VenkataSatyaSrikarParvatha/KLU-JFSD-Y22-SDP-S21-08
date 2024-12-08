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
        /* Body and General Styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f4f7; /* Light background for contrast */
        }

        /* Container for the form */
        .container {
            width: 60%;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background: linear-gradient(145deg, #6dd5ed, #2193b0); /* Colorful gradient */
        }

        /* Header styling */
        h2 {
            text-align: center;
            color: #ffffff;
            font-size: 2rem;
            margin-bottom: 30px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); /* Shadow for text */
        }

        /* Label styling */
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #ffffff; /* White labels */
        }

        /* Input and Textarea fields styling */
        input, textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 1rem;
            transition: 0.3s ease; /* Smooth transition for focus */
        }

        /* Input focus styling */
        input:focus, textarea:focus {
            border-color: #6dd5ed;
            box-shadow: 0 0 8px rgba(109, 213, 237, 0.8); /* Focus effect */
            background-color: #f0f9ff; /* Light blue background */
        }

        /* Submit button styling */
        button {
            background-color: #2193b0;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1.2rem;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        /* Button hover effect */
        button:hover {
            background-color: #6dd5ed;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 20px;
            }

            button {
                width: 100%;
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Add a New Session</h2>
        <form method="POST" action="/submitSession">
            <!-- Title input -->
            <div>
                <label for="title">Session Title</label>
                <input type="text" id="title" name="title" required placeholder="Enter session title" />
            </div>

            <!-- Context input -->
            <div>
                <label for="context">Session Context</label>
                <textarea id="context" name="context" rows="5" placeholder="Describe the session details..." required></textarea>
            </div>

            <!-- Submit button -->
            <button type="submit">Submit Session</button>
        </form>
    </div>

</body>
</html>
