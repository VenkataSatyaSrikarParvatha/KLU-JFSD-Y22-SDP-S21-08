<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="adminNavbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Most Active Entities</title>
    <link rel="stylesheet" href="<c:url value='/css/adminStyles.css' />">
	
	<style>
	/* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f9;
    color: #333;
}

.container {
    width: 80%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    font-size: 32px;
    margin-bottom: 20px;
    color: #333;
}

.entity-section {
    margin-bottom: 30px;
    padding: 20px;
    background-color: #fafafa;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

h2 {
    font-size: 24px;
    color: #007BFF;
    margin-bottom: 10px;
}

p {
    font-size: 16px;
    margin-bottom: 8px;
}

strong {
    color: #555;
}

/* Table Style for Counselors and Survivors Section */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

table th, table td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: left;
}

table th {
    background-color: #007BFF;
    color: #fff;
    font-size: 16px;
}

table tr:nth-child(even) {
    background-color: #f9f9f9;
}

table tr:hover {
    background-color: #f1f1f1;
}

table td button {
    padding: 8px 16px;
    background-color: #28a745;
    color: #fff;
    border: none;
    cursor: pointer;
    border-radius: 5px;
}

table td button:hover {
    background-color: #218838;
}

/* Mobile Responsive */
@media screen and (max-width: 768px) {
    .container {
        width: 90%;
    }

    h1 {
        font-size: 24px;
    }

    h2 {
        font-size: 20px;
    }

    p {
        font-size: 14px;
    }

    table th, table td {
        font-size: 14px;
    }
}
	
	</style>
	
	
</head>
<body>
    <div class="container">
        <h1>Most Active Entities</h1>

        <div class="entity-section">
            <h2>Most Active Counselor</h2>
            <c:choose>
                <c:when test="${not empty mostActiveCounselor}">
                    <p><strong>Name:</strong> ${mostActiveCounselor.username}</p>
                    <p><strong>Email:</strong> ${mostActiveCounselor.email}</p>
                    <p><strong>Sessions Hosted:</strong> ${counselorSessionCount}</p>
                </c:when>
                <c:otherwise>
                    <p>No data available for counselors.</p>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="entity-section">
            <h2>Most Active Survivor</h2>
            <c:choose>
                <c:when test="${not empty mostActiveSurvivor}">
                    <p><strong>Name:</strong> ${mostActiveSurvivor.username}</p>
                    <p><strong>Email:</strong> ${mostActiveSurvivor.email}</p>
                    <p><strong>Sessions Attended:</strong> ${survivorSessionCount}</p>
                </c:when>
                <c:otherwise>
                    <p>No data available for survivors.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>
