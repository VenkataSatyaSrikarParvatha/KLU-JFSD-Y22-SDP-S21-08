
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Survivor Login</title>
    <!-- Correct path for CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/survivor/styles.css">
</head>
<body>
    <div class="login-container">
        <div class="form-box">
            <h2>Survivor Login</h2>
            <form action="checksurvivorlogin" method="post">
                <div class="input-group">
                    <label for="semail">Email</label>
                    <input type="email" id="semail" name="semail" placeholder="Enter your email" required>
                </div>
                <div class="input-group">
                    <label for="spwd">Password</label>
                    <input type="password" id="spwd" name="spwd" placeholder="Enter your password" required>
                </div>
                <button type="submit" class="btn">Login</button>
            </form>
            <!-- Display message if exists -->
            <c:if test="${not empty message}">
                <div class="error-message">
                    <p>${message}</p>
                </div>
            </c:if>
            <div class="register-link">
                <p>New user? <a href="survivorreg">Register here</a></p>
            </div>
        </div>
    </div>
</body>
</html>
