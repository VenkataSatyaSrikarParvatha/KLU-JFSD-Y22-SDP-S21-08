<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Survivor Portal</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
        }

        /* Navbar Styles */
        .navbar {
            background: linear-gradient(135deg, #00bcd4, #9c27b0); /* Teal and purple gradient */
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 250px; /* Wider navbar */
            padding-top: 30px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            box-shadow: 3px 0 10px rgba(0, 0, 0, 0.1);
            border-right: 2px solid #9c27b0;
        }

        /* Survivor Portal Branding as Logo */
        .navbar a.branding {
            font-size: 1.6rem;
            font-weight: bold;
            color: #ffffff;
            text-transform: uppercase;
            padding-bottom: 20px;
            border-bottom: 3px solid #ffffff;
            letter-spacing: 2px;
            transition: color 0.3s ease;
            margin-bottom: 20px; /* Added spacing below the branding */
        }

        .navbar a.branding:hover {
            color: #ffeb3b; /* Yellow hover effect on branding */
        }

        .navbar a {
            color: white;
            text-decoration: none;
            padding: 18px 25px;
            text-align: center;
            font-size: 1.2rem;
            font-weight: 500;
            margin: 8px 0;
            border-radius: 8px;
            width: 100%;
            transition: all 0.3s ease;
        }

        .navbar a:hover {
            background-color: #9c27b0; /* Purple hover effect */
            color: #ffffff;
            transform: translateX(10px); /* Slight move effect on hover */
        }

        .navbar .menu {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
        }

        .navbar .menu a.logout {
            background-color: #f44336;  /* Red for logout button */
            font-weight: bold;
            margin-top: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
        }

        .navbar .menu a.logout:hover {
            background-color: #d32f2f;  /* Dark red for hover */
        }

        /* Mobile View Adjustments */
        @media (max-width: 768px) {
            body {
                margin-left: 0; /* Allow full-width body for small screens */
            }

            .navbar {
                width: 100%;
                height: auto;
                flex-direction: row;
                justify-content: space-between;
                padding: 15px;
                box-shadow: none;
            }

            .navbar a {
                padding: 12px 18px;
                margin: 5px;
            }

            .navbar a.branding {
                font-size: 1.3rem;
                padding-bottom: 10px;
            }

            .navbar .menu {
                flex-direction: row;
                align-items: center;
                justify-content: center;
            }

            .navbar .menu a {
                margin: 0 10px;
            }

            .navbar .menu a.logout {
                background-color: #f44336;
                margin-left: 15px;
            }
        }
    </style>
</head>
<body>

    <div class="navbar">
        <!-- Branding (acting as Logo) -->
        <a href="survivorhome" class="branding">Survivor Portal</a>
        
        <!-- Menu Links -->
        <div class="menu">
            <a href="survivorhome">Home</a>
            <a href="survivorprofile">My Profile</a>
            <a href="allArticles">All Articles</a>
            <a href="allSessions">All Sessions</a>
            <a href="mySessions">My Registered Sessions</a>
            <a href="survivorlogout" class="logout">Logout</a>
        </div>
    </div>

</body>
</html>
