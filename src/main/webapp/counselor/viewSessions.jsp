<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="counselorNavbar.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Counselor's Sessions</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f0f4f8, #d1e3f3); /* Light gradient background */
            margin: 0;
            padding: 0;
            color: #333;
        }

        /* Content Container */
        .content {
            padding: 30px;
            margin-left: 220px; /* Adjust this if the navbar is wider */
            padding-left: 30px;
        }

        h2 {
            text-align: center;
            color: #2a3d66; /* Darker blue for headers */
            margin-top: 30px;
            font-size: 2.5rem;
            font-weight: bold;
        }

        /* Table Styling */
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        th, td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4a90e2; /* Cool blue */
            color: white;
            font-size: 1.1rem;
        }

        td {
            color: #555;
            font-size: 1rem;
        }

        /* Status Messages */
        .status-message {
            font-weight: bold;
            padding: 6px 12px;
            border-radius: 5px;
            font-size: 1rem;
            display: inline-block;
        }

        .status-registered {
            background-color: #ff9800; /* Warm yellow for registered */
            color: white;
        }

        .status-accepted {
            background-color: #4caf50; /* Green for accepted */
            color: white;
        }

        .status-rejected {
            background-color: #f44336; /* Red for rejected */
            color: white;
        }

        /* Action Buttons */
        button {
            background: linear-gradient(135deg, #56ccf2, #2f80ed); /* Soft blue gradient */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: background 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background: linear-gradient(135deg, #2f80ed, #56ccf2);
            transform: translateY(-4px);
        }

        .reject-button {
            background: linear-gradient(135deg, #ff416c, #ff4b2b); /* Red gradient for reject */
        }

        .reject-button:hover {
            background: linear-gradient(135deg, #ff4b2b, #ff416c);
        }

        /* No Sessions Message */
        .no-sessions-message {
            text-align: center;
            font-size: 1.3rem;
            color: #f44336;
            font-weight: bold;
        }

        /* Responsive Design */
        @media screen and (max-width: 768px) {
            table {
                width: 100%;
            }

            th, td {
                font-size: 0.9rem;
                padding: 10px;
            }

            h2 {
                font-size: 2rem;
            }

            .content {
                margin-left: 0;
                padding-left: 10px;
            }
        }
    </style>
</head>
<body>

    <div class="content">
        <h2>Your Created Sessions</h2>

        <!-- Check if the sessions list is not empty -->
        <c:if test="${not empty sessions}">
            <table>
                <thead>
                    <tr>
                        <th>Session Title</th>
                        <th>Session Context</th>
                        <th>Survivor Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Loop through all the counselor's sessions -->
                    <c:forEach items="${sessions}" var="session">
                        <tr>
                            <td>${session.title}</td>
                            <td>${session.context}</td>
                            <td>
                                <!-- Survivor Status -->
                                <c:choose>
                                    <c:when test="${session.survivorTheVictimStatus == 'Registered'}">
                                        <span class="status-message status-registered">Registered</span>
                                    </c:when>
                                    <c:when test="${session.survivorTheVictimStatus == 'Accepted'}">
                                        <span class="status-message status-accepted">Survivor Accepted</span>
                                    </c:when>
                                    <c:when test="${session.survivorTheVictimStatus == 'Rejected'}">
                                        <span class="status-message status-rejected">Survivor Rejected</span>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>
                                <!-- Show accept/reject buttons if status is 'Registered' -->
                                <c:if test="${session.survivorTheVictimStatus == 'Registered'}">
                                    <form action="${pageContext.request.contextPath}/acceptSurvivorForSession" method="post" style="display:inline;">
                                        <input type="hidden" name="sessionId" value="${session.id}">
                                        <input type="hidden" name="survivorId" value="${session.survivorTheVictimId}">
                                        <button type="submit">Accept Survivor</button>
                                    </form>

                                    <form action="${pageContext.request.contextPath}/rejectSurvivorForSession" method="post" style="display:inline;">
                                        <input type="hidden" name="sessionId" value="${session.id}">
                                        <input type="hidden" name="survivorId" value="${session.survivorTheVictimId}">
                                        <button type="submit" class="reject-button">Reject Survivor</button>
                                    </form>
                                </c:if>

                                <!-- Show a message if the survivor has already been accepted or rejected -->
                                <c:if test="${session.survivorTheVictimStatus == 'Accepted'}">
                                    <span>Survivor Accepted</span>
                                </c:if>
                                <c:if test="${session.survivorTheVictimStatus == 'Rejected'}">
                                    <span>Survivor Rejected</span>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <!-- Message if no sessions are available -->
        <c:if test="${empty sessions}">
            <p class="no-sessions-message">You have not created any sessions yet.</p>
        </c:if>
    </div>

</body>
</html>
