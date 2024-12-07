<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="adminNavbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Counselors</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <style>
/* General Body Styling */
body {
    font-family: 'Roboto', sans-serif;
    background-color: #f4f6f9;
    margin: 0;
    padding: 0;
    color: #333;
}

/* Content Section */
.content {
    margin-left: 250px; /* Adjust for navbar width */
    padding: 20px;
    text-align: center;
}

/* Main Heading */
h2 {
    color: #34495e;
    font-size: 2.5rem;
    font-weight: bold;
    margin-bottom: 30px;
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

/* Status Colors */
.accepted {
    background-color: #2ecc71; /* Green */
}

.registered {
    background-color: #f39c12; /* Yellow */
}

.rejected {
    background-color: #e74c3c; /* Red */
}

/* Most Active Counselor Card */
.most-active-card {
    background-color: #f1c40f;
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
    text-align: center;
    margin-bottom: 40px;
    max-width: 600px;
    margin-left: auto;
    margin-right: auto;
    position: relative; /* To position the status dot */
}

/* Counselor Profile Image */
.most-active-card img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    object-fit: cover;
    border: 3px solid #2193b0;
}

/* Green dot for Accepted state */
.most-active-card.accepted .status-dot {
    background-color: #2ecc71; /* Green */
}

/* Red dot for Rejected state */
.most-active-card.rejected .status-dot {
    background-color: #e74c3c; /* Red */
}

/* Circle dot in the top-right corner for status indication */
.most-active-card .status-dot {
    width: 15px;
    height: 15px;
    background-color: #bdc3c7; /* Default Grey */
    border-radius: 50%;
    position: absolute;
    top: 10px;
    right: 10px;
}

/* Counselor Cards Container */
.counselor-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
}

/* Counselor Card Styling */
.counselor-card {
    background-color: #ffffff;
    border-radius: 12px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
    width: 280px;
    padding: 20px;
    text-align: left;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    position: relative;
}

/* Counselor Card Status Colors */
.counselor-card.accepted {
    background-color: #2ecc71; /* Green */
}

.counselor-card.registered {
    background-color: #f39c12; /* Yellow */
}

.counselor-card.rejected {
    background-color: #e74c3c; /* Red */
}

/* Hover Effect for Counselor Cards */
.counselor-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
}

/* Counselor Profile Image */
.counselor-card img {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    object-fit: cover;
    border: 2px solid #2193b0;
    position: absolute;
    top: -30px;
    left: 20px;
}

/* Counselor Card Text */
.counselor-card h3 {
    margin: 40px 0 5px 0;
    font-size: 1.5rem;
    color: #34495e;
}

.counselor-card p {
    font-size: 0.95rem;
    color: #636e72;
    margin: 5px 0;
}

/* Action Buttons for Counselor Cards */
.counselor-card .action-buttons {
    margin-top: 15px;
    display: flex;
    justify-content: space-between;
}

.counselor-card .action-buttons a,
.counselor-card .action-buttons button {
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

.counselor-card .action-buttons a:hover {
    background-color: #1a7a8c;
}

.counselor-card .action-buttons button {
    background-color: #e74c3c;
    cursor: pointer;
}

.counselor-card .action-buttons button:hover {
    background-color: #c0392b;
}

/* Responsive Design */
@media (max-width: 768px) {
    .content {
        margin-left: 0;
        padding: 10px;
    }

    .counselor-container {
        flex-direction: column;
        align-items: center;
    }

    .counselor-card {
        width: 100%;
        max-width: 350px;
    }

    .status-summary div {
        font-size: 1.1rem;
        padding: 10px 25px;
    }

    .most-active-card {
        max-width: 90%;
        margin-left: 10px;
        margin-right: 10px;
    }
}

    </style>
</head>
<body>
    <div class="content">
        <h2>All Counselors</h2>

        <!-- Display Most Active Counselor -->
       <div class="most-active-card ${mostActiveCounselor.status == 'Accepted' ? 'accepted' : (mostActiveCounselor.status == 'Rejected' ? 'rejected' : '')}">
    <c:if test="${not empty mostActiveCounselor}">
        <img src="/counselor/profileImage?id=${mostActiveCounselor.id}" alt="Profile Image">
        <h3>${mostActiveCounselor.username} <small>(Most Active)</small></h3>
        <p><strong>ID:</strong> ${mostActiveCounselor.id}</p>
        <p><strong>Specialization:</strong> ${mostActiveCounselor.specialization}</p>
        <p><strong>Email:</strong> ${mostActiveCounselor.email}</p>
        <p><strong>Sessions Attended:</strong> ${mostActiveCounselorSessionCount}</p>
        <div class="action-buttons">
            <a href="viewCounselorDetails?id=${mostActiveCounselor.id}">View Details</a>
            <form action="confirmDeleteCounselor" method="post" style="display:inline;">
                <input type="hidden" name="id" value="${mostActiveCounselor.id}" />
                <button type="submit">Delete</button>
            </form>
        </div>
    </c:if>
</div>


        <!-- Status Summary Section -->
        <div class="status-summary">
            <div class="accepted">Accepted: ${acceptedCount}</div>
            <div class="registered">Registered: ${registeredCount}</div>
            <div class="rejected">Rejected: ${rejectedCount}</div>
        </div>

        <!-- Counselor Cards -->
        <div class="counselor-container">
            <c:forEach var="counselor" items="${counselors}">
                <c:if test="${counselor.id != mostActiveCounselor.id}">
                    <c:set var="statusClass" value="${counselor.status == 'Accepted' ? 'accepted' : (counselor.status == 'Registered' ? 'registered' : 'rejected')}"/>
                    <div class="counselor-card ${statusClass}">
                        <img src="/counselor/profileImage?id=${counselor.id}" alt="Profile Image" width="100">
                        <h3>${counselor.username}</h3>
                        <p><strong>ID:</strong> ${counselor.id}</p>
                        <p><strong>Specialization:</strong> ${counselor.specialization}</p>
                        <p><strong>Email:</strong> ${counselor.email}</p>
                        <div class="action-buttons">
                            <a href="viewCounselorDetails?id=${counselor.id}">View Details</a>
                            <form action="confirmDeleteCounselor" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="${counselor.id}" />
                                <button type="submit">Delete</button>
                            </form>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
</body>

</html>
