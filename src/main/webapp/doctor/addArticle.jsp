<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="navbar.jsp" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Article</title>
</head>
<body>
    <h2>Add New Article</h2>
    <form action="submitArticle" method="POST" enctype="multipart/form-data">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" required><br><br>
        
        <label for="context">Context:</label>
        <input type="text" id="context" name="context" required><br><br>
        
        <label for="content">Content:</label>
        <textarea id="content" name="content" required></textarea><br><br>
        
        <label for="image">Image (optional):</label>
        <input type="file" id="image" name="image"><br><br>
        
        <label for="anonymous">Submit as Anonymous:</label>
        <input type="checkbox" id="anonymous" name="anonymous"><br><br>

        <button type="submit">Submit Article</button>
    </form>
</body>
</html>
