<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="adminNavbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Details</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css"> <!-- Link to external stylesheet -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f6d365, #fda085);
            margin: 0;
            padding: 0;
            color: #333;
        }

        .content {
            margin-left: 250px;
            padding: 20px;
            text-align: center;
        }

        h2 {
            font-size: 2.5rem;
            font-weight: bold;
            color: #fff;
            margin-bottom: 30px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        }

        .details-card {
            max-width: 900px;
            margin: 0 auto;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            padding: 20px;
            color: #555;
            position: relative;
        }

        .details-header {
            background: linear-gradient(135deg, #6dd5ed, #2193b0);
            color: white;
            padding: 20px;
            text-align: center;
        }

        .details-header img {
            border-radius: 50%;
            width: 120px;
            height: 120px;
            object-fit: cover;
            margin-bottom: 10px;
            border: 4px solid #fff;
        }

        .details-header h3 {
            font-size: 1.8rem;
            margin: 10px 0 5px;
        }

        .details-header p {
            font-size: 1rem;
            margin: 0;
            color: #eef;
        }

        .details-table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
        }

        .details-table th,
        .details-table td {
            padding: 10px;
            font-size: 1rem;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .details-table th {
            color: #2193b0;
            font-weight: bold;
            text-align: center;
        }

        .details-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .details-table tr:hover {
            background-color: #f1f1f1;
        }

        .status-update {
            text-align: center;
            margin-top: 20px;
        }

        .status-update form {
            display: inline-block;
        }

        .status-update label {
            font-size: 1.2rem;
            margin-right: 10px;
        }

        .status-update select {
            padding: 8px 12px;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            outline: none;
        }

        .status-update button {
            background: linear-gradient(135deg, #6dd5ed, #2193b0);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        .status-update button:hover {
            background: linear-gradient(135deg, #2193b0, #6dd5ed);
            transform: scale(1.05);
        }

        .download-link {
            color: #2193b0;
            font-weight: bold;
            text-decoration: none;
            padding: 5px 10px;
            display: inline-block;
            transition: all 0.3s ease-in-out;
        }

        .download-link:hover {
            color: #6dd5ed;
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .content {
                margin-left: 0;
                padding: 10px;
            }

            .details-card {
                padding: 15px;
            }

            .details-header img {
                width: 80px;
                height: 80px;
            }

            .details-table th,
            .details-table td {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="content">
        <h2>Doctor Details</h2>
        <div class="details-card">
            <!-- Header with Profile Image and Name -->
            <div class="details-header">
                <img src="/doctor/profileImage?id=${doctor.id}" alt="Profile Image">
                <h3>${doctor.username}</h3>
                <p>Specialization: ${doctor.specialization}</p>
            </div>

            <!-- Details Table -->
            <table class="details-table">
                <tr><th>ID</th><td>${doctor.id}</td></tr>
                <tr><th>Email</th><td>${doctor.email}</td></tr>
                <tr><th>Phone</th><td>${doctor.phone}</td></tr>
                <tr><th>Date of Birth</th><td>${doctor.dateOfBirth}</td></tr>
                <tr><th>Gender</th><td>${doctor.gender}</td></tr>
                <tr><th>Address</th><td>${doctor.address}</td></tr>
                <tr><th>Aadhaar Number</th><td>${doctor.aadhaarNumber}</td></tr>
                <tr><th>Experience</th><td>${doctor.experience} years</td></tr>
                <tr><th>Bio</th><td>${doctor.bio}</td></tr>
                <tr><th>Earnings</th><td>${doctor.earnings}</td></tr>
                <tr><th>Status</th><td>${doctor.status}</td></tr>
                <tr><th>Verification PDF</th><td><a href="/downloadVerificationPdf?id=${doctor.id}" target="_blank" class="download-link">Download PDF</a></td></tr>
            </table>

            <!-- Status Update Form -->
            <div class="status-update">
                <form action="/updateDoctorStatus" method="post">
                    <input type="hidden" name="id" value="${doctor.id}">
                    <label for="status">Update Status:</label>
                    <select name="status">
                        <option value="Rejected" ${doctor.status == 'Rejected' ? 'selected' : ''}>Rejected</option>
                        <option value="Accepted" ${doctor.status == 'Accepted' ? 'selected' : ''}>Accepted</option>
                    </select>
                    <button type="submit">Update</button>
                </form>
            </div>

        </div>
    </div>
</body>
</html>
