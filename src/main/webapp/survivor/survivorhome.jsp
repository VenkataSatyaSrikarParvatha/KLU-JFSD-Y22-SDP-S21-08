<%@ include file="survivorNavbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Survivor Home</title>
    <style>
        .container {
            max-width: 900px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #2193b0;
            text-align: center;
            margin-bottom: 20px;
        }

        .welcome-message {
            text-align: center;
            font-size: 1.2rem;
            color: #333;
        }

        .actions {
            display: flex;
            justify-content: space-around;
            margin-top: 40px;
        }

        .actions a {
            text-decoration: none;
            padding: 15px 30px;
            background-color: #2193b0;
            color: white;
            border-radius: 5px;
            font-size: 1.1rem;
            transition: background-color 0.3s;
        }

        .actions a:hover {
            background-color: #6dd5ed;
        }

        @media (max-width: 768px) {
            .actions {
                flex-direction: column;
                gap: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Saahas, Survivor!</h1>

        <div class="welcome-message">
            <p>Hi, ${survivor.username}! We are here to support you in your journey to a better tomorrow. You can view or update your profile, or explore other resources available to you.</p>
        </div>

        <div class="actions">
            <a href="survivorprofile">View My Profile</a>
            <a href="survivorreg">Update My Information</a>
        </div>
    </div>
</body>
</html>
