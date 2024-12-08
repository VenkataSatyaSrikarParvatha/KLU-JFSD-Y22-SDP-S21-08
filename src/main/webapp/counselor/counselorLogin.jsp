<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Counselor Login</title>

    <!-- Link to external CSS for advanced styling -->
    <link rel="stylesheet" href="counselor/counselorLogin.css">
    <style>
    /* Global Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Roboto', sans-serif;
    background: linear-gradient(135deg, #fbc2eb, #a6c1ee); /* Soft pink to light blue gradient */
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    overflow: hidden;
}

.login-container {
    background-color: #ffffff;  /* Clean white background */
    padding: 40px;
    border-radius: 20px;
    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);  /* Soft shadow for floating effect */
    width: 100%;
    max-width: 450px;
    text-align: center;
    transition: transform 0.3s ease-in-out;
    border: 1px solid rgba(0, 0, 0, 0.1);
}

.login-container:hover {
    transform: translateY(-5px);  /* Slight elevation on hover */
}

header {
    margin-bottom: 30px;
}

.login-title {
    font-size: 2.5rem;
    color: #2c3e50;  /* Dark slate blue */
    font-family: 'Poppins', sans-serif;
    font-weight: 600;
    margin-bottom: 20px;
    text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.15);
}

.message-container {
    margin-bottom: 20px;
    color: #e74c3c;  /* Bright red color for error messages */
}

.message {
    font-size: 1.1rem;
    font-weight: 500;
}

.login-form {
    display: flex;
    flex-direction: column;
    gap: 30px;
}

.input-group {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
}

label {
    font-size: 1.2rem;
    color: #34495e;  /* Charcoal grey for labels */
    margin-bottom: 10px;
    font-weight: 500;
}

input {
    padding: 15px 20px;
    font-size: 1.2rem;
    border-radius: 12px;
    border: 1px solid #dcdfe4;  /* Soft grey border */
    outline: none;
    background-color: #f9f9f9;  /* Light grey background for inputs */
    color: #34495e;  /* Dark grey text */
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);  /* Light shadow for inputs */
    transition: all 0.3s ease-in-out;
}

input:focus {
    background-color: #ffffff;  /* White background on focus */
    border-color: #3498db;  /* Blue border on focus */
    box-shadow: 0 0 10px rgba(52, 152, 219, 0.3);  /* Blue glow on focus */
}

.button-group {
    display: flex;
    justify-content: center;
}

.btn-login {
    background-color: #3498db;  /* Bright blue for the button */
    color: white;
    font-size: 1.2rem;
    padding: 15px 30px;
    border-radius: 50px;
    border: none;
    width: 100%;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.3s ease-in-out;
}

.btn-login:hover {
    background-color: #2980b9;  /* Darker blue on hover */
    transform: translateY(-3px);  /* Lift effect */
}

.nav-links {
    margin-top: 25px;
    font-size: 1.1rem;
    color: #2c3e50;  /* Dark slate blue color for links */
}

.nav-links .link {
    color: #3498db;  /* Blue for links */
    text-decoration: none;
    transition: color 0.3s ease;
}

.nav-links .link:hover {
    color: #2980b9;  /* Darker blue for hover effect */
}

@media (max-width: 768px) {
    .login-container {
        padding: 30px;
    }

    .login-title {
        font-size: 2.2rem;
    }

    .btn-login {
        font-size: 1.1rem;
    }
}
    
    </style>
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
