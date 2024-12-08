<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Saahas - Login</title>
    <link rel="stylesheet" type="text/css" href="visitor/home.css" />
</head>
<body>
    <%@ include file="visitor_navbar.jsp" %>

<!-- Slide 1: Welcome Section -->
<div class="slide">
    <div class="content">
        <div class="info">
            <h1>Welcome to Saahas</h1>
            <p>Your journey to support, recovery, and resources begins here. Scroll down to explore your options.</p>
        </div>
        <div class="role-buttons">
            <!-- Role buttons for navigation to other slides -->
            <a href="#admin-slide" class="role-button">Admin</a>
            <a href="#adminteam-slide" class="role-button">Admin Team</a>
            <a href="#survivor-slide" class="role-button">Victim/Survivor</a>
            <a href="#counselor-slide" class="role-button">Counselor</a>
            <a href="#legaladvisor-slide" class="role-button">Legal Advisor</a>
            <a href="#doctor-slide" class="role-button">Doctor</a>
        </div>
    </div>
</div>


        <!-- Slide 2: Admin -->
        <div id="admin-slide" class="slide">
            <div class="content">
                <div class="info">
                    <h1>Admin Role</h1>
                    <p>Admins oversee the platform's functionality, manage user roles, and ensure platform security and integrity.</p>
                </div>
                <div class="separator"></div> <!-- Separator Line -->
                <div class="login">
                    <a href="adminlogin">Login</a>
                </div>
            </div>
        </div>

        <!-- Slide 3: Admin Team -->
        <div id="adminteam-slide" class="slide">
            <div class="content">
                <div class="info">
                    <h1>Admin Team</h1>
                    <p>The admin team supports the main admin by collaborating on content management and operational tasks.</p>
                </div>
                <div class="separator"></div> <!-- Separator Line -->
                <div class="login">
                    <a href="adminteamlogin">Login</a>
                </div>
            </div>
        </div>

        <!-- Slide 4: Victim/Survivor -->
        <div id="survivor-slide" class="slide">
            <div class="content">
                <div class="info">
                    <h1>Victim/Survivor</h1>
                    <p>Victims can access resources, connect with professionals, and start their journey of recovery.</p>
                </div>
                <div class="separator"></div> <!-- Separator Line -->
                <div class="login">
                    <a href="survivorlogin">Login</a>
                    <a href="survivorreg">Sign Up</a>
                </div>
            </div>
        </div>

        <!-- Slide 5: Counselor -->
        <div id="counselor-slide" class="slide">
            <div class="content">
                <div class="info">
                    <h1>Counselor</h1>
                    <p>Counselors provide emotional support and guidance to victims, helping them find practical solutions.</p>
                </div>
                <div class="separator"></div> <!-- Separator Line -->
                <div class="login">
                    <a href="counselorLogin">Login</a>
                    <a href="counselorReg">Sign Up</a>
                </div>
            </div>
        </div>

        <!-- Slide 6: Legal Advisor -->
        <div id="legaladvisor-slide" class="slide">
            <div class="content">
                <div class="info">
                    <h1>Legal Advisor</h1>
                    <p>Legal advisors offer expert advice on laws, rights, and procedures to help victims navigate the legal system.</p>
                </div>
                <div class="separator"></div> <!-- Separator Line -->
                <div class="login">
                    <a href="legaladvisorlogin">Login</a>
                    <a href="legaladvisorreg">Sign Up</a>
                </div>
            </div>
        </div>

        <!-- Slide 7: Doctor -->
        <div id="doctor-slide" class="slide">
            <div class="content">
                <div class="info">
                    <h1>Doctor</h1>
                    <p>Doctors provide medical care to address physical injuries and offer guidance on long-term health recovery.</p>
                </div>
                <div class="separator"></div> <!-- Separator Line -->
                <div class="login">
                    <a href="doctorLogin">Login</a>
                    <a href="doctorReg">Sign Up</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer Section -->
    <div class="footer">
        <p>&copy; 2024 Saahas. All rights reserved. | <a href="privacy_policy">Privacy Policy</a></p>
    </div>
</body>
</html>
