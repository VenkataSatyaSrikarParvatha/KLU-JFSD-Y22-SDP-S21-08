<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="adminNavbar.jsp" %><!-- Import the admin navbar -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> <!-- Chart.js Library -->
    <style>
        /* Main content wrapper */
        .content {
            margin-left: 250px; /* Adjust for the fixed navbar on the left */
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* Heading style */
        h2 {
            color: #2193b0;
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 20px;
        }

        /* Card layout */
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin-bottom: 40px;
        }

        .card {
            display: inline-block;
            width: 220px;
            height: 200px;
            background-color: #6dd5ed;
            color: white;
            margin: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            padding-top: 20px;
            font-size: 1.5rem;
            transition: transform 0.3s ease-in-out;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card h3 {
            font-size: 1.8rem;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 1.2rem;
            margin-top: 10px;
        }

        /* Chart container adjustments for 3 charts side by side */
        .charts-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-evenly;
            margin-top: 40px;
            gap: 20px;  /* Adds space between charts */
            width: 100%;
        }

        .chart-container {
            width: 48%;  /* Each chart takes up nearly half the width */
            text-align: center;
        }

        /* Make charts responsive */
        canvas {
            max-width: 100%;
            height: auto;
        }

        /* Responsive design for small screens */
        @media (max-width: 768px) {
            .charts-container {
                flex-direction: column;
                align-items: center;
            }

            .chart-container {
                width: 100%;
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>

    <!-- Content Section -->
    <div class="content">
        <h2>Welcome, Admin!</h2>
        <p>Here's a quick overview of the status:</p>

        <!-- Stats Cards -->
        <div class="card-container">
            <div class="card">
                <h3>Counselors</h3>
                <p><c:out value="${counselorCount}" default="0"></c:out></p> <!-- Dynamically show the count of counselors -->
            </div>

            <div class="card">
                <h3>Doctors</h3>
                <p><c:out value="${doctorCount}" default="0"></c:out></p> <!-- Count of doctors -->
            </div>

            <div class="card">
                <h3>Legal Advisors</h3>
                <p><c:out value="${legalAdvisorCount}" default="0"></c:out></p> <!-- Count of legal advisors -->
            </div>

            <div class="card">
                <h3>Survivors</h3>
                <p><c:out value="${survivorTheVictimCount}" default="0"></c:out></p> <!-- Count of survivors -->
            </div>

            <div class="card">
                <h3>Admin Team</h3>
                <p><c:out value="${adminTeamCount}" default="0"></c:out></p> <!-- Count of admin team members -->
            </div>
        </div>

        <!-- Charts Section -->
        <div class="charts-container">
            <!-- Pie Chart -->
            <div class="chart-container">
                <canvas id="pieChart"></canvas>
            </div>

            <!-- Bar Chart -->
            <div class="chart-container">
                <canvas id="barChart"></canvas>
            </div>

            <!-- Doughnut Chart -->
            <div class="chart-container">
                <canvas id="doughnutChart"></canvas>
            </div>
        </div>
    </div>

    <script>
        // Ensure values are valid integers for JavaScript
        const counselorCount = ${counselorCount != null ? counselorCount : 0};
        const doctorCount = ${doctorCount != null ? doctorCount : 0};
        const legalAdvisorCount = ${legalAdvisorCount != null ? legalAdvisorCount : 0};
        const survivorCount = ${survivorTheVictimCount != null ? survivorTheVictimCount : 0};
        const adminTeamCount = ${adminTeamCount != null ? adminTeamCount : 0};

        // Pie Chart
        const pieData = {
            labels: ['Counselors', 'Doctors', 'Legal Advisors', 'Survivors', 'Admin Team'],
            datasets: [{
                data: [counselorCount, doctorCount, legalAdvisorCount, survivorCount, adminTeamCount],
                backgroundColor: ['#FF5733', '#33FF57', '#3357FF', '#FFD700', '#FF33A6'],
                borderWidth: 1
            }]
        };
        const pieCtx = document.getElementById('pieChart').getContext('2d');
        new Chart(pieCtx, {
            type: 'pie',
            data: pieData,
            options: {
                responsive: true,
                plugins: {
                    tooltip: {
                        enabled: true
                    }
                }
            }
        });

        // Bar Chart
        const barData = {
            labels: ['Counselors', 'Doctors', 'Legal Advisors', 'Survivors', 'Admin Team'],
            datasets: [{
                label: 'Counts',
                data: [counselorCount, doctorCount, legalAdvisorCount, survivorCount, adminTeamCount],
                backgroundColor: ['#FF5733', '#33FF57', '#3357FF', '#FFD700', '#FF33A6'],
                borderWidth: 1
            }]
        };
        const barCtx = document.getElementById('barChart').getContext('2d');
        new Chart(barCtx, {
            type: 'bar',
            data: barData,
            options: {
                responsive: true,
                plugins: {
                    tooltip: {
                        enabled: true
                    }
                }
            }
        });

        // Doughnut Chart
        const doughnutData = {
            labels: ['Counselors', 'Doctors', 'Legal Advisors', 'Survivors', 'Admin Team'],
            datasets: [{
                data: [counselorCount, doctorCount, legalAdvisorCount, survivorCount, adminTeamCount],
                backgroundColor: ['#FF5733', '#33FF57', '#3357FF', '#FFD700', '#FF33A6'],
                borderWidth: 1
            }]
        };
        const doughnutCtx = document.getElementById('doughnutChart').getContext('2d');
        new Chart(doughnutCtx, {
            type: 'doughnut',
            data: doughnutData,
            options: {
                responsive: true,
                plugins: {
                    tooltip: {
                        enabled: true
                    }
                }
            }
        });
    </script>

</body>
</html>
