<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Counselor's Sessions</title>
</head>
<body>
    <h2>Your Created Sessions</h2>

    <!-- Check if the sessions list is not empty -->
    <c:if test="${not empty sessions}">
        <table border="1">
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
                        <td>${session.survivorTheVictimStatus}</td>
                        <td>
                            <!-- If the survivor's status is 'Registered', show buttons to accept or reject -->
                            <c:if test="${session.survivorTheVictimStatus == 'Registered'}">
                                <form action="${pageContext.request.contextPath}/acceptSurvivorForSession" method="post" style="display:inline;">
                                    <input type="hidden" name="sessionId" value="${session.id}">
                                    <input type="hidden" name="survivorId" value="${session.survivorTheVictimId}">
                                    <button type="submit">Accept Survivor</button>
                                </form>

                                <form action="${pageContext.request.contextPath}/rejectSurvivorForSession" method="post" style="display:inline;">
                                    <input type="hidden" name="sessionId" value="${session.id}">
                                    <input type="hidden" name="survivorId" value="${session.survivorTheVictimId}">
                                    <button type="submit">Reject Survivor</button>
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
        <p>No sessions created yet.</p>
    </c:if>

</body>
</html>
