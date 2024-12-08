<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="adminNavbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Doctors</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .content {
            margin-left: 250px; /* Adjust for navbar width */
            padding: 20px;
        }

        h2 {
            color: #34495e;
            font-size: 2.5rem;
            font-weight: bold;
            margin-bottom: 30px;
            text-align: center;
        }

        /* Status Summary Section */
        .status-summary {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 30px;
            font-size: 1.2rem;
        }

        .status-summary div {
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: bold;
            color: white;
        }

        .accepted {
            background-color: #2ecc71; /* Green */
        }

        .registered {
            background-color: #f39c12; /* Yellow */
        }

        .rejected {
            background-color: #e74c3c; /* Red */
        }

        /* Doctor Cards Container */
        .doctor-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .doctor-card {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            width: 280px;
            padding: 20px;
            text-align: left;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
        }

        .doctor-card.accepted {
            background-color: #2ecc71; /* Green */
        }

        .doctor-card.registered {
            background-color: #f39c12; /* Yellow */
        }

        .doctor-card.rejected {
            background-color: #e74c3c; /* Red */
        }

        .doctor-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
        }

        .doctor-card img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #2193b0;
            position: absolute;
            top: -30px;
            left: 20px;
        }

        .doctor-card h3 {
            margin: 40px 0 5px 0;
            font-size: 1.5rem;
            color: #34495e;
        }

        .doctor-card p {
            font-size: 0.95rem;
            color: #636e72;
            margin: 5px 0;
        }

        .doctor-card .action-buttons {
            margin-top: 15px;
            display: flex;
            justify-content: space-between;
        }

        .doctor-card .action-buttons a,
        .doctor-card .action-buttons button {
            text-decoration: none;
            font-size: 0.9rem;
            font-weight: bold;
            color: white;
            background-color: #2193b0;
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            display: inline-block;
        }

        .doctor-card .action-buttons button {
            background-color: #e74c3c;
            cursor: pointer;
        }

        .doctor-card .action-buttons a:hover {
            background-color: #1a7a8c;
        }

        .doctor-card .action-buttons button:hover {
            background-color: #c0392b;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .content {
                margin-left: 0;
                padding: 10px;
            }

            .doctor-container {
                flex-direction: column;
                align-items: center;
            }

            .doctor-card {
                width: 100%;
                max-width: 350px;
            }
        }
    </style>
</head>
<body>
    <div class="content">
        <h2>All Doctors</h2>

        <!-- Status Summary Section -->
        <div class="status-summary">
            <div class="accepted">Accepted: ${acceptedCount}</div>
            <div class="registered">Registered: ${registeredCount}</div>
            <div class="rejected">Rejected: ${rejectedCount}</div>
        </div>

        <!-- Doctor Cards Container -->
        <div class="doctor-container">
            <c:forEach var="doctor" items="${doctors}">
                <c:set var="statusClass" value="${doctor.status == 'Accepted' ? 'accepted' : (doctor.status == 'Registered' ? 'registered' : 'rejected')}"/>
                <div class="doctor-card ${statusClass}">
                    <img src="/doctor/profileImage?id=${doctor.id}" alt="Profile Image" width="100">
                    <h3>${doctor.username}</h3>
                    <p><strong>ID:</strong> ${doctor.id}</p>
                    <p><strong>Email:</strong> ${doctor.email}</p>
                    <p><strong>Phone:</strong> ${doctor.phone}</p>
                    <p><strong>Specialization:</strong> ${doctor.specialization}</p>
                    <p><strong>Rating:</strong> ${doctor.rating}</p>
                    <div class="action-buttons">
                        <a href="viewDoctorDetails?id=${doctor.id}">View Details</a> 
                        <!--  <a href="deletedoctoraction?id=${doctor.id}" onclick="return confirm('Are you sure you want to delete?')">Delete</a> -->
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
