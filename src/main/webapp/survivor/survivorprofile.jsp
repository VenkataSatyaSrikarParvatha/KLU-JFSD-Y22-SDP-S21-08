<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="survivorNavbar.jsp" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Survivor Profile</title>
    <style>
    /* General styles */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f9f9f9;
    color: #333;
}

/* Profile container */
.profile-container {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    padding: 20px;
}

/* Profile box */
.profile-box {
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 20px 40px;
    max-width: 500px;
    width: 100%;
    text-align: center;
}

/* Heading styles */
.profile-box h2 {
    margin-bottom: 20px;
    font-size: 24px;
    color: #007bff;
}

/* Table styles */
.profile-box table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

.profile-box table td {
    padding: 10px 5px;
    text-align: left;
}

.profile-box table tr td:first-child {
    font-weight: bold;
    color: #555;
}

/* Button styles */
.profile-box .btn {
    display: inline-block;
    text-decoration: none;
    background-color: #007bff;
    color: #fff;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 16px;
    transition: background-color 0.3s ease;
}

.profile-box .btn:hover {
    background-color: #0056b3;
}
    
    </style>
</head>
<body>
    <div class="profile-container">
        <div class="profile-box">
            <h2>Survivor Profile</h2>
            <table>
                <tr>
                    <td><strong>Username:</strong></td>
                    <td>${survivor.username}</td>
                </tr>
                <tr>
                    <td><strong>Email:</strong></td>
                    <td>${survivor.email}</td>
                </tr>
                <tr>
                    <td><strong>Phone:</strong></td>
                    <td>${survivor.phone}</td>
                </tr>
                <tr>
                    <td><strong>Date of Birth:</strong></td>
                    <td>${survivor.dateOfBirth}</td>
                </tr>
                <tr>
                    <td><strong>Gender:</strong></td>
                    <td>${survivor.gender}</td>
                </tr>
                <tr>
                    <td><strong>Address:</strong></td>
                    <td>${survivor.address}</td>
                </tr>
                <tr>
                    <td><strong>Aadhaar Number:</strong></td>
                    <td>${survivor.aadhaarNumber}</td>
                </tr>
            </table>

            <a href="updateSurvivorProfile?sid=${survivor.id}" class="btn">Update Profile</a>
        </div>
    </div>
</body>
</html>
