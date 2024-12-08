<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="counselorNavbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Counselor Home</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #2193b0, #6dd5ed);
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1000px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 30px;
        }
        h1 {
            text-align: center;
            font-size: 2.5rem;
            color: #2193b0;
            margin-bottom: 20px;
        }
        p {
            font-size: 1.1rem;
            text-align: center;
            color: #666;
        }
        .card-container {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            margin-top: 30px;
        }
        .card {
            flex: 1 1 calc(33% - 20px);
            margin: 10px;
            background-color: #f4f6f9;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .card h3 {
            font-size: 1.5rem;
            color: #2193b0;
            margin-bottom: 10px;
        }
        .card p {
            font-size: 1rem;
            color: #555;
        }
        .card a {
            text-decoration: none;
            color: #fff;
            background-color: #2193b0;
            padding: 10px 15px;
            border-radius: 5px;
            display: inline-block;
            margin-top: 15px;
            transition: background-color 0.3s ease;
        }
        .card a:hover {
            background-color: #6dd5ed;
        }
        .chart-container {
            margin-top: 30px;
        }
        canvas {
            max-width: 100%;
            margin: 0 auto;
        }
        @media (max-width: 768px) {
            .card {
                flex: 1 1 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome, Counselor!</h1>
        <p>Quickly access your key tools and track your activity.</p>
        
        <div class="card-container">
            <!-- Card 1: Profile -->
            <div class="card">
                <i class="fas fa-user-circle fa-3x" style="color: #2193b0;"></i>
                <h3>Your Profile</h3>
                <p>Update your information or view your current profile details.</p>
                <a href="${pageContext.request.contextPath}/counselorProfile">Manage Profile</a>
            </div>
            <!-- Card 2: Sessions -->
            <div class="card">
                <i class="fas fa-calendar-alt fa-3x" style="color: #2193b0;"></i>
                <h3>Manage Sessions</h3>
                <p>View or schedule new counseling sessions.</p>
                <a href="${pageContext.request.contextPath}/counselor/mySessions">View Sessions</a>
            </div>
            <!-- Card 3: Articles -->
            <div class="card">
                <i class="fas fa-book fa-3x" style="color: #2193b0;"></i>
                <h3>Your Articles</h3>
                <p>Write or manage your articles and publications.</p>
                <a href="${pageContext.request.contextPath}/myArticles">Manage Articles</a>
            </div>
        </div>

        <!-- Dynamic Section for Insights -->
        <div class="card-container">
            <!-- Example Insight Card -->
            <div class="card">
                <h3>Upcoming Sessions</h3>
                <p>You have <b>${upcomingSessionsCount}</b> sessions scheduled this week.</p>
                <a href="${pageContext.request.contextPath}/viewCounselorSessions">View All Sessions</a>
            </div>
            <div class="card">
                <h3>Article Engagement</h3>
                <p>Your latest article has received <b>${articleEngagementCount}</b> views.</p>
                <a href="${pageContext.request.contextPath}/myArticles">View Articles</a>
            </div>
        </div>

        <!-- Visualization: Sessions and Articles Analytics -->
        <div class="chart-container">
            <h2>Activity Overview</h2>
            <canvas id="sessionsChart"></canvas>
        </div>
    </div>

    <script>
        // Example Chart: Sessions vs Articles (Bar Chart)
        var ctx = document.getElementById('sessionsChart').getContext('2d');
        var sessionsChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Sessions', 'Articles'],
                datasets: [{
                    label: 'Counselor Activity',
                    data: [${upcomingSessionsCount}, ${articleEngagementCount}], // dynamic data
                    backgroundColor: ['#2193b0', '#6dd5ed'],
                    borderColor: ['#1a7a8c', '#4b9fb8'],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    tooltip: {
                        enabled: true
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</body>
</html>
