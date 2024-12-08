<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Counselor Registration</title>
    <link rel="stylesheet" href="counselor/counselorReg.css">
    <script type="text/javascript">
        function validateForm() {
            // Validate Username
            var username = document.forms["counselorRegForm"]["cusername"].value;
            if (username.trim() === "") {
                alert("Username is required.");
                return false;
            }

            // Validate Password
            var password = document.forms["counselorRegForm"]["cpwd"].value;
            if (password.trim() === "") {
                alert("Password is required.");
                return false;
            }

            // Validate Email
            var email = document.forms["counselorRegForm"]["cemail"].value;
            var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
            if (!emailPattern.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }

            // Validate Phone
            var phone = document.forms["counselorRegForm"]["cphone"].value;
            var phonePattern = /^\d{10}$/;
            if (!phonePattern.test(phone)) {
                alert("Phone number must be exactly 10 digits.");
                return false;
            }

            // Validate Date of Birth (minimum age 18)
            var dob = document.forms["counselorRegForm"]["cdob"].value;
            var dobDate = new Date(dob);
            var currentDate = new Date();
            var age = currentDate.getFullYear() - dobDate.getFullYear();
            if (currentDate.getMonth() < dobDate.getMonth() ||
                (currentDate.getMonth() === dobDate.getMonth() && currentDate.getDate() < dobDate.getDate())) {
                age--;
            }
            if (age < 18) {
                alert("You must be at least 18 years old.");
                return false;
            }

            // Validate Aadhaar Number
            var aadhaar = document.forms["counselorRegForm"]["caadhaar"].value;
            var aadhaarPattern = /^\d{12}$/;
            if (!aadhaarPattern.test(aadhaar)) {
                alert("Aadhaar number must be exactly 12 digits.");
                return false;
            }

            // Validate Experience
            var experience = document.forms["counselorRegForm"]["cexperience"].value;
            if (isNaN(experience) || experience <= 0) {
                alert("Please enter a valid experience in years.");
                return false;
            }

            // Validate Profile Image
            var profileImage = document.forms["counselorRegForm"]["profileImage"].value;
            if (profileImage.trim() !== "") {
                var profileImageExt = profileImage.split('.').pop().toLowerCase();
                if (!['jpg', 'jpeg', 'png'].includes(profileImageExt)) {
                    alert("Profile image must be in JPG, JPEG, or PNG format.");
                    return false;
                }
            }

            // Validate Verification PDF
            var verificationPdf = document.forms["counselorRegForm"]["verificationPdf"].value;
            if (verificationPdf.trim() !== "") {
                var verificationPdfExt = verificationPdf.split('.').pop().toLowerCase();
                if (verificationPdfExt !== 'pdf') {
                    alert("Verification document must be in PDF format.");
                    return false;
                }
            }

            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="form-section">
            <h2>Counselor Registration</h2>
            <form name="counselorRegForm" action="insertCounselor" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">
                <div class="form-group">
                    <label for="cusername">Username:</label>
                    <input type="text" name="cusername" id="cusername" required><br>
                </div>

                <div class="form-group">
                    <label for="cpwd">Password:</label>
                    <input type="password" name="cpwd" id="cpwd" required><br>
                </div>

                <div class="form-group">
                    <label for="cemail">Email:</label>
                    <input type="email" name="cemail" id="cemail" required><br>
                </div>

                <div class="form-group">
                    <label for="cphone">Phone:</label>
                    <input type="tel" name="cphone" id="cphone" required pattern="[0-9]{10}" maxlength="10"><br>
                </div>

                <div class="form-group">
                    <label for="cdob">Date of Birth:</label>
                    <input type="date" name="cdob" id="cdob" required><br>
                </div>

                <div class="form-group">
                    <label for="cgender">Gender:</label>
                    <select name="cgender" id="cgender" required>
                        <option value="">Select Gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select><br>
                </div>

                <div class="form-group">
                    <label for="caddress">Address:</label>
                    <input type="text" name="caddress" id="caddress" required><br>
                </div>

                <div class="form-group">
                    <label for="caadhaar">Aadhaar Number:</label>
                    <input type="text" name="caadhaar" id="caadhaar" required maxlength="12" pattern="\d{12}"><br>
                </div>

                <div class="form-group">
                    <label for="cspecialization">Specialization:</label>
                    <input type="text" name="cspecialization" id="cspecialization" required><br>
                </div>

                <div class="form-group">
                    <label for="cexperience">Experience (in years):</label>
                    <input type="number" name="cexperience" id="cexperience" required><br>
                </div>

                <div class="form-group">
                    <label for="cbio">Bio:</label>
                    <textarea name="cbio" id="cbio" required></textarea><br>
                </div>

                <div class="form-group">
                    <label for="profileImage">Profile Image:</label>
                    <input type="file" name="profileImage" id="profileImage" accept="image/*"><br>
                </div>

                <div class="form-group">
                    <label for="verificationPdf">Verification PDF:</label>
                    <input type="file" name="verificationPdf" id="verificationPdf" accept="application/pdf"><br>
                </div>

                <button type="submit">Register</button>
            </form>

            <p><a href="counselorLogin">Go to Login</a></p>
            <p><a href="visitorHome">Go to Visitor Home</a></p>
        </div>
    </div>
</body>
</html>
