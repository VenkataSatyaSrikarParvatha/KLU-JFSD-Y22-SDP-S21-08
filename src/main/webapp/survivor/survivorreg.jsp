<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Survivor Registration</title>
    <link rel="stylesheet" href="survivor/styles.css">
</head>
<body>
    <div class="register-container">
        <div class="form-box">
            <h2>Survivor Registration</h2>
            <form action="insertSurvivor" method="post" enctype="multipart/form-data">
                <div class="input-group">
                    <label for="susername">Username</label>
                    <input type="text" id="susername" name="susername" placeholder="Enter your username" required>
                </div>
                <div class="input-group">
                    <label for="spwd">Password</label>
                    <input type="password" id="spwd" name="spwd" placeholder="Enter your password" required>
                </div>
                <div class="input-group">
                    <label for="semail">Email</label>
                    <input type="email" id="semail" name="semail" placeholder="Enter your email" required>
                </div>
                <div class="input-group">
                    <label for="sphone">Phone</label>
                    <input type="text" id="sphone" name="sphone" placeholder="Enter your phone number" required>
                </div>
                <div class="input-group">
                    <label for="sdob">Date of Birth</label>
                    <input type="date" id="sdob" name="sdob" required>
                </div>
                <div class="input-group">
                    <label for="sgender">Gender</label>
                    <select id="sgender" name="sgender" required>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
                <div class="input-group">
                    <label for="saddress">Address</label>
                    <textarea id="saddress" name="saddress" placeholder="Enter your address" required></textarea>
                </div>
                <div class="input-group">
                    <label for="saadhaar">Aadhaar Number</label>
                    <input type="text" id="saadhaar" name="saadhaar" placeholder="Enter your Aadhaar number" required>
                </div>
                <div class="input-group">
                    <label for="profileImage">Profile Image</label>
                    <input type="file" id="profileImage" name="profileImage" accept="image/*" >
                </div>
                <br>
                <button type="submit" class="btn">Register</button>
            </form>
            <c:if test="${not empty message}">
                <div class="success-message">
                    <p>${message}</p>
                </div>
            </c:if>
            <div class="login-link">
                <p>Already registered? <a href="survivorlogin">Login here</a></p>
            </div>
        </div>
    </div>
</body>
</html>
