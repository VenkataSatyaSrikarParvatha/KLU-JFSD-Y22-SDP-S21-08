<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="adminNavbar.jsp" %>
<html>
<head>
    <title>Add Admin Team Member</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }

        h3 {
            text-align: center;
            color: #2193b0;
            font-size: 2rem;
            margin-top: 50px;
        }

        .form-container {
            width: 80%;
            max-width: 800px;
            margin: 30px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 12px;
            font-size: 1rem;
        }

        label {
            font-weight: bold;
            color: #333;
            display: inline-block;
            margin-bottom: 5px;
        }

        .form-container input[type="text"],
        .form-container input[type="password"],
        .form-container input[type="email"],
        .form-container input[type="date"],
        .form-container input[type="number"],
        .form-container textarea {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-top: 5px;
            box-sizing: border-box;
        }

        .form-container textarea {
            height: 100px;
        }

        .form-container input[type="submit"],
        .form-container input[type="reset"] {
            background-color: #2193b0;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 1.1rem;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .form-container input[type="submit"]:hover,
        .form-container input[type="reset"]:hover {
            background-color: #1a7a8c;
        }

        .button-container {
            text-align: center;
        }

        .form-container .gender-radio {
            margin-top: 5px;
        }

        /* Styling for radio buttons */
        .form-container input[type="radio"] {
            margin-right: 10px;
        }

        /* Add icons for inputs */
        .form-container .icon {
            font-size: 1.2rem;
            color: #2193b0;
            margin-right: 10px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .form-container {
                width: 90%;
            }

            h3 {
                font-size: 1.5rem;
            }

            td {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <h3>Add Curator</h3>
    <div class="form-container">

        <!-- Spring form for adding admin team -->
        <form:form modelAttribute="adminTeam" method="post" action="insertAdminTeam">

            <table>

                <tr>
                    <td><label for="username"><i class="fas fa-user icon"></i> Username</label></td>
                    <td>
                        <form:input path="username" required="required" placeholder="Enter username" />
                    </td>
                </tr>

                <tr>
                    <td><label for="password"><i class="fas fa-lock icon"></i> Password</label></td>
                    <td>
                        <form:password path="password" required="required" placeholder="Enter password" />
                    </td>
                </tr>

                <tr>
                    <td><label for="email"><i class="fas fa-envelope icon"></i> Email</label></td>
                    <td>
                        <form:input path="email" required="required" placeholder="Enter email" type="email" />
                    </td>
                </tr>

                <tr>
                    <td><label for="phone"><i class="fas fa-phone-alt icon"></i> Phone</label></td>
                    <td>
                        <form:input path="phone" required="required" placeholder="Enter phone number" type="tel" />
                    </td>
                </tr>

                <tr>
                    <td><label for="dateOfBirth"><i class="fas fa-calendar icon"></i> Date of Birth</label></td>
                    <td>
                        <form:input path="dateOfBirth" type="date" required="required" />
                    </td>
                </tr>

                <tr>
                    <td><label for="gender"><i class="fas fa-genderless icon"></i> Gender</label></td>
                    <td>
                        <div class="gender-radio">
                            <form:radiobutton path="gender" value="Male" required="required" /> Male
                            <form:radiobutton path="gender" value="Female" required="required" /> Female
                        </div>
                    </td>
                </tr>

                <tr>
                    <td><label for="address"><i class="fas fa-map-marker-alt icon"></i> Address</label></td>
                    <td>
                        <form:textarea path="address" required="required" placeholder="Enter address" />
                    </td>
                </tr>

                <tr>
                    <td><label for="aadhaarNumber"><i class="fas fa-id-card icon"></i> Aadhaar Number</label></td>
                    <td>
                        <form:input path="aadhaarNumber" required="required" placeholder="Enter Aadhaar Number" type="text" pattern="\d{12}" />
                    </td>
                </tr>
                
                <tr>
                    <td><label for="status"></label></td>
                    <td>
                        <!-- Hidden input field for status -->
                        <form:input path="status" value="Accepted" type="hidden" />
                    </td>
                </tr>

                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Add Curator" />
                        <input type="reset" value="Clear" />
                    </td>
                </tr>

            </table>

        </form:form>

    </div>

</body>
</html>
