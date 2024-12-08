<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Session Dashboard</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #fafbfc;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .content {
            padding: 20px;
            max-width: 900px;
            margin: 0 auto;
        }
        h2 {
            font-size: 2.5rem;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 30px;
        }
        .session-details {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .session-details table {
            width: 100%;
            border-collapse: collapse;
        }
        .session-details th, .session-details td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .message {
            color: #e74c3c;
            font-size: 1.2rem;
            text-align: center;
        }
        .chat-box {
            margin-top: 20px;
            background-color: #fff;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .chat-messages {
            max-height: 300px;
            overflow-y: auto;
            margin-bottom: 10px;
        }
        .chat-messages div {
            margin-bottom: 10px;
        }
        .chat-input {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

    <div class="content">
        <h2>Session Dashboard</h2>
        
        
                 <div class="user-header">
            <c:if test="${not empty userName}">
                Welcome, ${userName}!
            </c:if>
        </div>


        <!-- Show session details only -->
        <c:if test="${not empty session}">
            <div class="session-details">
                <h3>Session: ${session.title}</h3>
                <table>
                    <tr>
                        <th>Session ID</th>
                        <td>${session.id}</td>
                    </tr>
                    <tr>
                        <th>Context</th>
                        <td>${session.context}</td>
                    </tr>
                    <tr>
                        <th>Created At</th>
                        <td>${session.createdAt}</td>
                    </tr>
                    <tr>
                        <th>Counselor Name</th>
                        <td>${session.counselorName}</td>
                    </tr>
                    <tr>
                        <th>Counselor Role</th>
                        <td>${session.counselorRole}</td>
                    </tr>
                    <tr>
                        <th>Survivor Name</th>
                        <td>${session.survivorTheVictimName}</td>
                    </tr>
                    <tr>
                        <th>Survivor Status</th>
                        <td>${session.survivorTheVictimStatus}</td>
                    </tr>
                </table>
            </div>
        </c:if>

        <div class="session-details">
            <h3>Session: ${session.title}</h3>
            <!-- Display session details as you already have in the previous code -->
        </div>

        <!-- Chat Interface -->
        <div class="chat-box">
            <div class="chat-messages" id="chatMessages">
                <!-- Chat messages will be displayed here -->
            </div>
            <input type="text" class="chat-input" id="chatInput" placeholder="Type a message..." />
            <button onclick="sendMessage()">Send</button>
        </div>

        <!-- Error or message displays -->
        <c:if test="${not empty message}">
            <div class="message">${message}</div>
        </c:if>
    </div>

<script>
    // Function to send a message
    function sendMessage() {
        var message = $('#chatInput').val();
        var userName = "${userName}"; // Fetch the username from JSP variable
        
        if (message.trim() === '') {
            return;
        }

        var fullMessage = userName + ": " + message; // Add username to the message

        // Send the message via AJAX
        $.post('/sendMessage', { message: fullMessage }, function(response) {
            $('#chatInput').val(''); // Clear input
            loadMessages(); // Reload messages
        });
    }

    // Function to load messages
    function loadMessages() {
        $.get('/getMessages', function(messages) {
            $('#chatMessages').empty();
            messages.forEach(function(message) {
                $('#chatMessages').append('<div>' + message + '</div>'); // Display messages
            });
        });
    }

    // Load messages when the page loads
    $(document).ready(function() {
        loadMessages();
    });

    // Auto-refresh messages every 3 seconds
    setInterval(loadMessages, 3000);
</script>


</body>
</html>
