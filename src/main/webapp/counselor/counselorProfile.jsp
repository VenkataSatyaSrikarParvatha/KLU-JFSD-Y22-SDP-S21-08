<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="counselorNavbar.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Counselor Profile</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            margin: 40px auto;
            max-width: 900px;
            background-color: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #4A90E2;
            font-size: 2.5rem;
            margin-bottom: 30px;
        }

        .profile-header {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
        }

        .profile-header img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 4px solid #4A90E2;
            object-fit: cover;
            margin-right: 20px;
        }

        .profile-header .info {
            display: flex;
            flex-direction: column;
        }

        .info h2 {
            color: #333;
            font-size: 1.8rem;
            margin: 0;
        }

        .info p {
            color: #777;
            font-size: 1rem;
        }

        .details {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 30px;
        }

        .detail-item {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .detail-item .title {
            font-weight: bold;
            color: #4A90E2;
            margin-bottom: 5px;
        }

        .detail-item .value {
            color: #555;
        }

        .actions {
            text-align: center;
        }

        .actions a {
            text-decoration: none;
            color: #fff;
            background-color: #4A90E2;
            padding: 12px 20px;
            border-radius: 30px;
            margin: 10px;
            font-size: 1rem;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .actions a:hover {
            background-color: #357ABD;
            transform: translateY(-2px);
        }

        @media (max-width: 768px) {
            .details {
                grid-template-columns: 1fr;
            }

            .profile-header {
                flex-direction: column;
                align-items: center;
            }

            .profile-header img {
                margin-bottom: 20px;
            }

            .info h2 {
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <div class="content">
        <div class="container">
            <h1>Your Profile</h1>
            
            <!-- Profile Header Section -->
            <div class="profile-header">
                <img src="/counselor/profileImage?id=${counselor.id}" alt="Profile Image">
                <div class="info">
                    <h2>${counselor.username}</h2>
                    <p>${counselor.specialization} Specialist</p>
                    <p><strong>Status:</strong> ${counselor.status}</p>
                </div>
            </div>
            
            <!-- Profile Details Section -->
            <div class="details">
                <div class="detail-item">
                    <div class="title">Email</div>
                    <div class="value">${counselor.email}</div>
                </div>
                <div class="detail-item">
                    <div class="title">Phone</div>
                    <div class="value">${counselor.phone}</div>
                </div>
                <div class="detail-item">
                    <div class="title">Date of Birth</div>
                    <div class="value">${counselor.dateOfBirth}</div>
                </div>
                <div class="detail-item">
                    <div class="title">Gender</div>
                    <div class="value">${counselor.gender}</div>
                </div>
                <div class="detail-item">
                    <div class="title">Address</div>
                    <div class="value">${counselor.address}</div>
                </div>
                <div class="detail-item">
                    <div class="title">Aadhaar Number</div>
                    <div class="value">${counselor.aadhaarNumber}</div>
                </div>
                <div class="detail-item">
                    <div class="title">Experience</div>
                    <div class="value">${counselor.experience} years</div>
                </div>
                <div class="detail-item">
                    <div class="title">Bio</div>
                    <div class="value">${counselor.bio}</div>
                </div>
                <div class="detail-item">
                    <div class="title">Earnings</div>
                    <div class="value">${counselor.earnings}</div>
                </div>
            </div>

            <!-- Action Buttons Section -->
            <div class="actions">
                <a href="/counselorUpdateProfile">Update Profile</a>
                <a href="/counselorLogout">Logout</a>
            </div>
        </div>
    </div>
</body>
</html>
