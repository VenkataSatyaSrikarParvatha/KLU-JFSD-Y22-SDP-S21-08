<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="navbar.jsp" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Home</title>
</head>
<body>
    <h2>Welcome, ${doctor.username}</h2>
    <a href="doctorProfile">My Profile</a><br>
    <a href="doctorLogout">Logout</a><br>
    <a href="doctor/addArticle">Add New Article</a>
</body>
</html>
