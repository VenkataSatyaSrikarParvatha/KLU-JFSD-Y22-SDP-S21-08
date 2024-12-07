<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="navbar.jsp" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
</head>
<body>
    <h2>Update Profile</h2>
    <form action="updateDoctorProfile" method="POST" enctype="multipart/form-data">
        <label for="dusername">Username:</label>
        <input type="text" id="dusername" name="dusername" value="${doctor.username}" required><br><br>
        
        <label for="dpwd">Password:</label>
        <input type="password" id="dpwd" name="dpwd" value="${doctor.password}" required><br><br>
        
        <label for="demail">Email:</label>
        <input type="email" id="demail" name="demail" value="${doctor.email}" required><br><br>

        <label for="dphone">Phone:</label>
        <input type="text" id="dphone" name="dphone" value="${doctor.phone}" required><br><br>

        <label for="ddob">Date of Birth:</label>
        <input type="date" id="ddob" name="ddob" value="${doctor.dateOfBirth}" required><br><br>

        <label for="dspecialization">Specialization:</label>
        <input type="text" id="dspecialization" name="dspecialization" value="${doctor.specialization}" required><br><br>

        <label for="dexperience">Experience:</label>
        <input type="number" id="dexperience" name="dexperience" value="${doctor.experience}" required><br><br>

        <label for="dbio">Bio:</label>
        <textarea id="dbio" name="dbio">${doctor.bio}</textarea><br><br>

        <label for="profileImage">Profile Image:</label>
        <input type="file" id="profileImage" name="profileImage"><br><br>

        <label for="verificationPdf">Verification PDF:</label>
        <input type="file" id="verificationPdf" name="verificationPdf"><br><br>

        <button type="submit">Update Profile</button>
    </form>
</body>
</html>
