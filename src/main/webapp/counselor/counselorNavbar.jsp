<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Counselor Panel</title>

    <!-- Link to Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .navbar {
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            background-color: #2193b0;
            padding-top: 20px;
            color: white;
        }

        .navbar h2 {
            text-align: center;
            font-size: 1.5rem;
            margin-bottom: 30px;
        }

        .navbar a {
            display: block;
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            margin-bottom: 5px;
            transition: background-color 0.3s ease;
        }

        .navbar a:hover {
            background-color: #6dd5ed;
        }

        .navbar a.active {
            background-color: #6dd5ed;
            font-weight: bold;
        }

        .navbar i {
            margin-right: 10px;
        }

        .content {
            margin-left: 250px;
            padding: 20px;
        }

        @media (max-width: 768px) {
            .navbar {
                width: 100%;
                height: auto;
                position: relative;
            }
            .navbar a {
                text-align: center;
                padding: 10px 0;
            }
            .content {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>

    <div class="navbar">
        <h2>Counselor Panel</h2>
        <a href="/counselorHome" class="${page == 'home' ? 'active' : ''}">
            <i class="fas fa-home"></i> Home
        </a>
        <a href="/counselorProfile" class="${page == 'profile' ? 'active' : ''}">
            <i class="fas fa-user"></i> Profile
        </a>
        <a href="/counselor/addArticle" class="${page == 'addArticle' ? 'active' : ''}">
            <i class="fas fa-pen"></i> Write Article
        </a>
        <a href="/addSession" class="${page == 'addSession' ? 'active' : ''}">
            <i class="fas fa-calendar-plus"></i> Add Session
        </a>
        
                <li><a href="/counselor/mySessions">My Sessions</a></li>
        
      
        <li><a href="/viewCounselorSessions">viewCounselorSessions for acceptance Sessions</a></li>
        
        
        
         </a>
        <a href="myArticles" >
            <i class="fas fa-pen"></i>My Article
        </a>
        
        
        
        
        <a href="/counselorLogout">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>
    </div>

    <!-- Content Section (this will be filled based on page content) -->
    <div class="content">
        <!-- Page content goes here -->
    </div>

</body>
</html>
