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
            <i class="fas fa-home" aria-hidden="true"></i> Home
        </a>
        <a href="/counselorProfile" class="${page == 'profile' ? 'active' : ''}">
            <i class="fas fa-user" aria-hidden="true"></i> Profile
        </a>
        <a href="/addArticle" class="${page == 'addArticle' ? 'active' : ''}">
            <i class="fas fa-pen" aria-hidden="true"></i> Write Article
        </a>
        <a href="/addSession" class="${page == 'addSession' ? 'active' : ''}">
            <i class="fas fa-calendar-plus" aria-hidden="true"></i> Add Session
        </a>
        <a href="/counselor/mySessions" class="${page == 'mySessions' ? 'active' : ''}">
            <i class="fas fa-calendar-alt" aria-hidden="true"></i> My Sessions
        </a>
        <a href="/viewCounselorSessions" class="${page == 'viewSessions' ? 'active' : ''}">
            <i class="fas fa-check-circle" aria-hidden="true"></i> View Sessions for Acceptance
        </a>
        <a href="/myArticles" class="${page == 'myArticles' ? 'active' : ''}">
            <i class="fas fa-book" aria-hidden="true"></i> My Articles
        </a>
        <a href="/counselorLogout">
            <i class="fas fa-sign-out-alt" aria-hidden="true"></i> Logout
        </a>
    </div>

    <!-- Content Section (this will be filled based on page content) -->
    <div class="content">
        <!-- Page content goes here -->
    </div>

</body>
</html>
