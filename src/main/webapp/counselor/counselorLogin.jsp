<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Counselor Login</title>

    <!-- Link to external CSS for advanced styling -->
    <link rel="stylesheet" href="counselor/counselorLogin.css">
</head>
<body>

    <div class="container">
        <!-- Page Header -->
        <header>
            <h1 class="title">Counselor Login</h1>
        </header>

        <!-- Display any login-related message -->
        <div class="message">
            <p>${message}</p>
        </div>

        <!-- Login Form -->
        <form action="checkCounselorLogin" method="POST" class="login-form">
            <div class="input-group">
                <label for="cemail">Email:</label>
                <input type="email" name="cemail" placeholder="Enter your email" required>
            </div>
            
            <div class="input-group">
                <label for="cpwd">Password:</label>
                <input type="password" name="cpwd" placeholder="Enter your password" required>
            </div>

            <div class="button-group">
                <button type="submit" class="btn-login">Login</button>
            </div>
        </form>

        <!-- Navigation Links -->
        <div class="nav-links">
            <p>Don't have an account? <a href="counselorReg" class="link">Register here</a></p>
            <p>Back to <a href="/" class="link">Visitor Home</a></p>
        </div>
    </div>

</body>
</html>
