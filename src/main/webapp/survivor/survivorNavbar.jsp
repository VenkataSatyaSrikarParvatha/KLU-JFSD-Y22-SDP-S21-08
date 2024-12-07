<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Survivor Navbar</title>
    <style>
        /* Basic Navbar Styles */
        .navbar {
            background-color: #2193b0;
            overflow: hidden;
            display: flex;
            justify-content: space-between;
            padding: 10px 20px;
            align-items: center;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            padding: 14px 20px;
            text-align: center;
        }
        .navbar a:hover {
            background-color: #1c7e8b;
        }
        .navbar .logo {
            font-size: 20px;
            font-weight: bold;
        }
        .navbar .menu {
            display: flex;
        }
        .navbar .menu a {
            margin: 0 10px;
        }
        .navbar .menu a.logout {
            background-color: #e74c3c;
        }
        .navbar .menu a.logout:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>

    <div class="navbar">
        <div class="logo">
            <a href="survivorhome">Survivor Portal</a>
        </div>
        <div class="menu">
            <a href="survivorhome">Home</a>
            <a href="survivorprofile">My Profile</a>
            <a href = "allArticles"> All Articles </a>
            <a href = "allSessions"> All Sessions </a>
            
        <li><a href="/mySessions">My Registered Sessions</a></li>
       
            
            
            <a href="survivorlogout" class="logout">Logout</a>
        </div>
    </div>

</body>
</html>
