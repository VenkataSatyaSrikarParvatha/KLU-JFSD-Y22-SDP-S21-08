package com.jfsd.saahas.springboot.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;

@Entity
@Table(name = "counselors")
public class Counselor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "username", length = 50, nullable = false, unique = true)
    private String username;

    @Column(name = "password", length = 50, nullable = false)
    private String password;

    @Column(name = "email", length = 100, nullable = false, unique = true)
    private String email;

    @Column(name = "phone", length = 15, nullable = false)
    private String phone;

    @Column(name = "date_of_birth", nullable = false, length = 20)
    private String dateOfBirth;

    @Column(name = "gender", nullable = false)
    private String gender;

    @Column(name = "address", length = 255, nullable = false)
    private String address;

    @Column(name = "aadhaar_number", nullable = false, unique = true, length = 12)
    private String aadhaarNumber;

    @Column(name = "specialization", length = 100, nullable = false)
    private String specialization;

    @Column(name = "experience", nullable = false)
    private int experience;

    @Column(name = "bio", length = 500)
    private String bio;

    @Column(name = "earnings")
    private double earnings;

    @Column(name = "status", length = 20)
    private String status;

    @Lob
    @Column(name = "profile_image")
    private Blob profileImage;

    @Lob
    @Column(name = "verification_pdf")
    private Blob verificationPdf;

 

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAadhaarNumber() {
        return aadhaarNumber;
    }

    public void setAadhaarNumber(String aadhaarNumber) {
        this.aadhaarNumber = aadhaarNumber;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public int getExperience() {
        return experience;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public double getEarnings() {
        return earnings;
    }

    public void setEarnings(double earnings) {
        this.earnings = earnings;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Blob getProfileImage() {
        return profileImage;
    }

    public void setProfileImage(Blob profileImage) {
        this.profileImage = profileImage;
    }

    public Blob getVerificationPdf() {
        return verificationPdf;
    }

    public void setVerificationPdf(Blob verificationPdf) {
        this.verificationPdf = verificationPdf;
    }
}


//
//package com.jfsd.saahas.springboot.model;
//
//import java.sql.Blob;
//
//import jakarta.persistence.Column;
//import jakarta.persistence.Entity;
//import jakarta.persistence.GeneratedValue;
//import jakarta.persistence.GenerationType;
//import jakarta.persistence.Id;
//import jakarta.persistence.Lob;
//import jakarta.persistence.Table;
//
//@Entity
////@DiscriminatorValue("counselor_table")
//@Table(name ="counselor_table") 
//public class Counselor{
//	
//	 @Id
//	    @GeneratedValue(strategy = GenerationType.IDENTITY)
//	    @Column(name = "counselor_id")
//	    private int id;
//
//	    @Column(name = "counselor_username", length = 50, nullable = false, unique = true)
//	    private String username;
//
//	    @Column(name = "counselor_password", length = 50, nullable = false)
//	    private String password;
//
//	    @Column(name = "counselor_email", length = 100, nullable = false, unique = true)
//	    private String email;
//
//	    @Column(name = "counselor_phone", length = 15, nullable = false)
//	    private String phone;
//
//	    @Column(name = "counselor_date_of_birth", nullable = false, length = 20)
//	    private String dateOfBirth;
//
//	    @Column(name = "counselor_gender", nullable = false)
//	    private String gender;
//
//	    @Column(name = "counselor_address", length = 255, nullable = false)
//	    private String address;
//
//	    @Column(name = "counselor_aadhaar_number", nullable = false, unique = true, length = 12)
//	    private String aadhaarNumber;
//
//	    //--------------------------------------------------
//
//	    @Column(name = "counselor_specialization", length = 100)
//	    private String specialization;
//
//	    @Column(name = "counselor_experience", nullable = false)
//	    private int experience;
//
//	    @Column(name = "counselor_bio", length = 500)
//	    private String bio;
//
//	    @Column(name = "counselor_rating")
//	    private double rating;
//
//	    @Column(name = "counselor_earnings")
//	    private double earnings;
//
//	    @Column(name = "counselor_status", nullable = false, length = 50)
//	    private String status;
//
//	    //--------------------------------------------------
//
//	    // Fields for storing image and verification document
//
//	    @Lob
//	    @Column(name = "counselor_image", nullable = false)
//	    private Blob image;  // Profile image stored as Blob
//
//	    @Lob
//	    @Column(name = "counselor_verification_pdf", nullable = false)
//	    private Blob verificationDoc;  // PDF file for verification stored as Blob
//
//		public int getId() {
//			return id;
//		}
//
//		public void setId(int id) {
//			this.id = id;
//		}
//
//		public String getUsername() {
//			return username;
//		}
//
//		public void setUsername(String username) {
//			this.username = username;
//		}
//
//		public String getPassword() {
//			return password;
//		}
//
//		public void setPassword(String password) {
//			this.password = password;
//		}
//
//		public String getEmail() {
//			return email;
//		}
//
//		public void setEmail(String email) {
//			this.email = email;
//		}
//
//		public String getPhone() {
//			return phone;
//		}
//
//		public void setPhone(String phone) {
//			this.phone = phone;
//		}
//
//		public String getDateOfBirth() {
//			return dateOfBirth;
//		}
//
//		public void setDateOfBirth(String dateOfBirth) {
//			this.dateOfBirth = dateOfBirth;
//		}
//
//		public String getGender() {
//			return gender;
//		}
//
//		public void setGender(String gender) {
//			this.gender = gender;
//		}
//
//		public String getAddress() {
//			return address;
//		}
//
//		public void setAddress(String address) {
//			this.address = address;
//		}
//
//		public String getAadhaarNumber() {
//			return aadhaarNumber;
//		}
//
//		public void setAadhaarNumber(String aadhaarNumber) {
//			this.aadhaarNumber = aadhaarNumber;
//		}
//
//		public String getSpecialization() {
//			return specialization;
//		}
//
//		public void setSpecialization(String specialization) {
//			this.specialization = specialization;
//		}
//
//		public int getExperience() {
//			return experience;
//		}
//
//		public void setExperience(int experience) {
//			this.experience = experience;
//		}
//
//		public String getBio() {
//			return bio;
//		}
//
//		public void setBio(String bio) {
//			this.bio = bio;
//		}
//
//		public double getRating() {
//			return rating;
//		}
//
//		public void setRating(double rating) {
//			this.rating = rating;
//		}
//
//		public double getEarnings() {
//			return earnings;
//		}
//
//		public void setEarnings(double earnings) {
//			this.earnings = earnings;
//		}
//
//		public String getStatus() {
//			return status;
//		}
//
//		public void setStatus(String status) {
//			this.status = status;
//		}
//
//		public Blob getImage() {
//			return image;
//		}
//
//		public void setImage(Blob image) {
//			this.image = image;
//		}
//
//		public Blob getVerificationDoc() {
//			return verificationDoc;
//		}
//
//		public void setVerificationDoc(Blob verificationDoc) {
//			this.verificationDoc = verificationDoc;
//		}
//	
//}
