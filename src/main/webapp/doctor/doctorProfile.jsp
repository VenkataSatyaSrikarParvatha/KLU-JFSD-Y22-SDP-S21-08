<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="navbar.jsp" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Profile</title>
</head>
<body>
    <h2>Doctor Profile</h2>

    <p><strong>Username:</strong> ${doctor.username}</p>
    <p><strong>Email:</strong> ${doctor.email}</p>
    <p><strong>Phone:</strong> ${doctor.phone}</p>
    <p><strong>Specialization:</strong> ${doctor.specialization}</p>
    <p><strong>Experience:</strong> ${doctor.experience} years</p>

    <a href="doctorUpdateProfile">Edit Profile</a><br>
    <a href="doctorHome">Back to Home</a>
</body>
</html>
