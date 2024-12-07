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
        .container {
            margin: 50px auto;
            max-width: 800px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #2193b0;
            font-size: 2rem;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th, table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        table th {
            background-color: #6dd5ed;
            color: white;
            font-weight: bold;
        }

        table td {
            background-color: #f9f9f9;
        }

        .profile-img {
            text-align: center;
            margin-top: 20px;
        }

        .profile-img img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 3px solid #2193b0;
            object-fit: cover;
        }

        .actions {
            text-align: center;
            margin-top: 20px;
        }

        .actions a {
            text-decoration: none;
            color: #fff;
            background-color: #2193b0;
            padding: 10px 20px;
            border-radius: 5px;
            margin: 5px;
            transition: background-color 0.3s ease;
        }

        .actions a:hover {
            background-color: #6dd5ed;
        }

        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }

            table th, table td {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="content">
        <div class="container">
            <h1>Your Profile</h1>
                        <!-- Profile image -->
            <div class="profile-img">
                <img src="/counselor/profileImage?id=${counselor.id}" alt="Profile Image" width="100">
            </div>
            <!-- Display profile details -->
            <table>
                <tr>
                    <th>ID</th>
                    <td>${counselor.id}</td>
                </tr>
                <tr>
                    <th>Username</th>
                    <td>${counselor.username}</td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td>${counselor.email}</td>
                </tr>
                <tr>
                    <th>Phone</th>
                    <td>${counselor.phone}</td>
                </tr>
                <tr>
                    <th>Date of Birth</th>
                    <td>${counselor.dateOfBirth}</td>
                </tr>
                <tr>
                    <th>Gender</th>
                    <td>${counselor.gender}</td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td>${counselor.address}</td>
                </tr>
                <tr>
                    <th>Aadhaar Number</th>
                    <td>${counselor.aadhaarNumber}</td>
                </tr>
                <tr>
                    <th>Specialization</th>
                    <td>${counselor.specialization}</td>
                </tr>
                <tr>
                    <th>Experience</th>
                    <td>${counselor.experience} years</td>
                </tr>
                <tr>
                    <th>Bio</th>
                    <td>${counselor.bio}</td>
                </tr>
                <tr>
                    <th>Earnings</th>
                    <td>${counselor.earnings}</td>
                </tr>
                <tr>
                    <th>Status</th>
                    <td>${counselor.status}</td>
                </tr>
            </table>



            <!-- Action buttons -->
            <div class="actions">
                <a href="/counselorUpdateProfile">Update Profile</a>
                <a href="/counselorLogout">Logout</a>
            </div>
        </div>
    </div>
</body>
</html>
