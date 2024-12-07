<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Login</title>
</head>
<body>
    <h2>Doctor Login</h2>
    <form action="checkDoctorLogin" method="POST">
        <label for="demail">Email:</label>
        <input type="email" id="demail" name="demail" required><br><br>
        
        <label for="dpwd">Password:</label>
        <input type="password" id="dpwd" name="dpwd" required><br><br>
        
        <button type="submit">Login</button>
    </form>

    <div style="color:red">
        <p>${message}</p>
    </div>
</body>
</html>
