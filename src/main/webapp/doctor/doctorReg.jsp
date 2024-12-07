<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Registration</title>
</head>
<body>
    <h2>Doctor Registration</h2>
    <form action="insertDoctor" method="POST" enctype="multipart/form-data">
        <label for="dusername">Username:</label>
        <input type="text" id="dusername" name="dusername" required><br><br>

        <label for="dpwd">Password:</label>
        <input type="password" id="dpwd" name="dpwd" required><br><br>

        <label for="demail">Email:</label>
        <input type="email" id="demail" name="demail" required><br><br>

        <label for="dphone">Phone:</label>
        <input type="text" id="dphone" name="dphone" required><br><br>

        <label for="ddob">Date of Birth:</label>
        <input type="date" id="ddob" name="ddob" required><br><br>

        <label for="dgender">Gender:</label>
        <select id="dgender" name="dgender" required>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select><br><br>

        <label for="daddress">Address:</label>
        <textarea id="daddress" name="daddress" required></textarea><br><br>

        <label for="daadhaar">Aadhaar Number:</label>
        <input type="text" id="daadhaar" name="daadhaar" required><br><br>

        <label for="dlicense">License Number:</label>
        <input type="text" id="dlicense" name="dlicense" required><br><br>

        <label for="dspecialization">Specialization:</label>
        <input type="text" id="dspecialization" name="dspecialization" required><br><br>

        <label for="dexperience">Experience (Years):</label>
        <input type="number" id="dexperience" name="dexperience" required><br><br>

        <label for="dbio">Bio:</label>
        <textarea id="dbio" name="dbio" required></textarea><br><br>

        <label for="profileImage">Profile Image:</label>
        <input type="file" id="profileImage" name="profileImage" required><br><br>

        <label for="verificationPdf">Verification PDF:</label>
        <input type="file" id="verificationPdf" name="verificationPdf" required><br><br>

        <button type="submit">Register</button>
    </form>
</body>
</html>
