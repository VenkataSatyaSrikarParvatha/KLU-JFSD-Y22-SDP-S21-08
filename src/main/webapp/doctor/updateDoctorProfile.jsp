<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="navbar.jsp" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Doctor Profile</title>
</head>
<body>
    <h2>Update Profile</h2>
    <form action="updateDoctorProfile" method="POST" enctype="multipart/form-data">
        <label for="dusername">Username:</label>
        <input type="text" id="dusername" name="dusername" value="${doctor.username}" required><br><br>
        
        <label for="demail">Email:</label>
        <input type="email" id="demail" name="demail" value="${doctor.email}" required><br><br>
        
        <label for="dphone">Phone:</label>
        <input type="text" id="dphone" name="dphone" value="${doctor.phone}" required><br><br>
        
        <label for="profileImage">Profile Image:</label>
        <input type="file" id="profileImage" name="profileImage"><br><br>
        
        <button type="submit">Save Changes</button>
    </form>
</body>
</html>
