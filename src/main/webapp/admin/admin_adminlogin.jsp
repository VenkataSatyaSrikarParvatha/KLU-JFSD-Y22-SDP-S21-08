<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f4f8;
        }

        .login-form {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .login-form h2 {
            color: #2193b0;
            text-align: center;
            margin-bottom: 20px;
        }

        .login-form label {
            font-size: 1rem;
            font-weight: bold;
            color: #333;
        }

        .login-form input {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        .login-form input:focus {
            border-color: #2193b0;
            outline: none;
            box-shadow: 0 0 8px rgba(33, 147, 176, 0.5);
        }

        .login-form button {
            background-color: #2193b0;
            color: white;
            padding: 12px 20px;
            font-size: 1.1rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        .login-form button:hover {
            background-color: #6dd5ed;
        }

        .login-form p {
            text-align: center;
        }

        .login-form p a {
            color: #2193b0;
            text-decoration: none;
            font-weight: bold;
        }

        .login-form p a:hover {
            text-decoration: underline;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <div class="login-form">
            <h2>Admin Login</h2>

            <!-- Display error message if login fails -->
            <c:if test="${not empty message}">
                <div class="error-message">
                    ${message}
                </div>
            </c:if>

            <form action="checkadminlogin" method="post">
                <div>
                    <label for="auname">Username:</label>
                    <input type="text" id="auname" name="auname" required>
                </div>

                <div>
                    <label for="apwd">Password:</label>
                    <input type="password" id="apwd" name="apwd" required>
                </div>

                <div>
                    <button type="submit">Login</button>
                </div>

                <p>Forgot Password? <a href="#">Send Password</a></p>
            </form>
        </div>
    </div>

</body>
</html>
