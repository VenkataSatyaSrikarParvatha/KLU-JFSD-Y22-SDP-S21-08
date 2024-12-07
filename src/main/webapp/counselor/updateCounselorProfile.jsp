<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="counselorNavbar.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
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

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        input, textarea, select {
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 100%;
        }

        input[type="file"] {
            padding: 5px;
        }

        button {
            background-color: #2193b0;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        button:hover {
            background-color: #6dd5ed;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-actions {
            text-align: center;
        }

        .alert {
            text-align: center;
            color: red;
            font-size: 1rem;
        }

        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }

            input, textarea, select {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="content">
        <div class="container">
            <h1>Update Your Profile</h1>

            <!-- Error or Success Message -->
            <c:if test="${not empty message}">
                <div class="alert">${message}</div>
            </c:if>

            <!-- Update Profile Form -->
            <form action="${pageContext.request.contextPath}/updateCounselorProfile" method="post" enctype="multipart/form-data">
                <!-- Hidden ID -->
                <input type="hidden" name="id" value="${counselor.id}">

                <!-- Username -->
                <div class="form-group">
                    <label for="cusername">Username</label>
                    <input type="text" name="cusername" id="cusername" value="${counselor.username}" required>
                </div>

                <!-- Password -->
                <div class="form-group">
                    <label for="cpwd">Password</label>
                    <input type="password" name="cpwd" id="cpwd" value="${counselor.password}" required>
                </div>

                <!-- Email -->
                <div class="form-group">
                    <label for="cemail">Email</label>
                    <input type="email" name="cemail" id="cemail" value="${counselor.email}" required>
                </div>

                <!-- Phone -->
                <div class="form-group">
                    <label for="cphone">Phone</label>
                    <input type="text" name="cphone" id="cphone" value="${counselor.phone}" required>
                </div>

                <!-- Date of Birth -->
                <div class="form-group">
                    <label for="cdob">Date of Birth</label>
                    <input type="date" name="cdob" id="cdob" value="${counselor.dateOfBirth}" required>
                </div>

                <!-- Gender -->
                <div class="form-group">
                    <label for="cgender">Gender</label>
                    <select name="cgender" id="cgender" required>
                        <option value="Male" ${'Male' == counselor.gender ? 'selected' : ''}>Male</option>
                        <option value="Female" ${'Female' == counselor.gender ? 'selected' : ''}>Female</option>
                        <option value="Other" ${'Other' == counselor.gender ? 'selected' : ''}>Other</option>
                    </select>
                </div>

                <!-- Address -->
                <div class="form-group">
                    <label for="caddress">Address</label>
                    <textarea name="caddress" id="caddress" rows="3" required>${counselor.address}</textarea>
                </div>

                <!-- Aadhaar Number -->
                <div class="form-group">
                    <label for="caadhaar">Aadhaar Number</label>
                    <input type="text" name="caadhaar" id="caadhaar" value="${counselor.aadhaarNumber}" required>
                </div>

                <!-- Specialization -->
                <div class="form-group">
                    <label for="cspecialization">Specialization</label>
                    <input type="text" name="cspecialization" id="cspecialization" value="${counselor.specialization}" required>
                </div>

                <!-- Experience -->
                <div class="form-group">
                    <label for="cexperience">Experience (in years)</label>
                    <input type="number" name="cexperience" id="cexperience" value="${counselor.experience}" required>
                </div>

                <!-- Bio -->
                <div class="form-group">
                    <label for="cbio">Bio</label>
                    <textarea name="cbio" id="cbio" rows="4">${counselor.bio}</textarea>
                </div>

                <!-- Profile Image -->
                <div class="form-group">
                    <label for="profileImage">Profile Image (optional)</label>
                    <input type="file" name="profileImage" id="profileImage"  accept="image/*">
                    
                </div>

                <!-- Verification PDF -->
                <div class="form-group">
                    <label for="verificationPdf">Verification PDF (optional)</label>
                    <input type="file" name="verificationPdf" id="verificationPdf" accept="application/pdf">
                </div>

                <!-- Earnings -->
                <div class="form-group">
                    <label for="cearnings">Earnings</label>
                    <input type="text" name="cearnings" id="cearnings" value="${counselor.earnings}" readonly>
                </div>

                <!-- Submit Button -->
                <div class="form-actions">
                    <button type="submit">Update Profile</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
