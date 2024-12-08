<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="survivorNavbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Success</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">

    <style>
        /* Global Styles */
        body {
            font-family: 'Helvetica Neue', sans-serif;
            background-color: #f1f8ff;  /* Light blue background */
            margin: 0;
            padding: 0;
            color: #333;
        }

        h1 {
            text-align: center;
            font-size: 3rem;
            color: #2c3e50;
            margin-top: 50px;
            font-weight: 700;
            background: linear-gradient(135deg, #6a82fb, #fc5c7d);
            padding: 20px 0;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        /* Container Styles */
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 40px;
            text-align: center;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        /* Success Message */
        p {
            font-size: 1.2rem;
            color: #2c3e50;
            margin-top: 20px;
            font-weight: 600;
        }

        /* Links Styles */
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 30px;
            color: #fff;
            background-color: #3498db; /* Soft blue button */
            border-radius: 5px;
            font-size: 1.2rem;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #2980b9; /* Darker blue hover */
        }

        /* Mobile Responsiveness */
        @media (max-width: 768px) {
            h1 {
                font-size: 2rem;
            }

            .container {
                width: 90%;
                padding: 20px;
            }

            a {
                padding: 10px 20px;
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
<br>
<br>
    <div class="container">
        <h1>Registration Successful</h1>
        <p>${message}</p>
        <a href="<c:url value='/allSessions' />">View More Sessions</a>
        <a href="<c:url value='/survivorhome' />">Back to Home</a>
    </div>

</body>
</html>
