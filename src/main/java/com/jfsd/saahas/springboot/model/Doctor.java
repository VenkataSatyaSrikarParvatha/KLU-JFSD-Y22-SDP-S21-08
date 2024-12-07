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
@Table(name = "doctor_table")
public class Doctor {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "doctor_id")
    private int id;

    @Column(name = "doctor_username", length = 50, nullable = false, unique = true)
    private String username;

    @Column(name = "doctor_password", length = 50, nullable = false)
    private String password;

    @Column(name = "doctor_email", length = 100, nullable = false, unique = true)
    private String email;

    @Column(name = "user_phone", length = 15, nullable = false)
    private String phone;

    @Column(name = "doctor_date_of_birth", nullable = false, length = 20)
    private String dateOfBirth;

    @Column(name = "doctor_gender", nullable = false)
    private String gender;

    @Column(name = "doctor_address", length = 255, nullable = false)
    private String address;

    @Column(name = "doctor_aadhaar_number", nullable = false, unique = true, length = 12)
    private String aadhaarNumber;

    //--------------------------------------------------

    @Column(name = "doctor_license_number", length = 50, nullable = false, unique = true)
    private String licenseNumber;  // the pattern --- needed -- license number for doctors

    //--------------------------------------------------

    @Column(name = "doctor_specialization", length = 100)
    private String specialization;

    @Column(name = "doctor_experience", nullable = false)
    private int experience;

    @Column(name = "doctor_bio", length = 500)
    private String bio;

    @Column(name = "doctor_rating")
    private double rating;

    @Column(name = "doctor_earnings")
    private double earnings;

    @Column(name = "doctor_status", nullable = false, length = 50)
    private String status;

    //--------------------------------------------------

 //why lob in survivor
    @Lob
    @Column(name = "doctor_image", nullable = false)
    private Blob image; 

    @Lob
    @Column(name = "doctor_verification_pdf", nullable = false)
    private Blob verificationDoc;  

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

	public String getLicenseNumber() {
		return licenseNumber;
	}

	public void setLicenseNumber(String licenseNumber) {
		this.licenseNumber = licenseNumber;
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

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
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

	public Blob getImage() {
		return image;
	}

	public void setImage(Blob image) {
		this.image = image;
	}

	public Blob getVerificationDoc() {
		return verificationDoc;
	}

	public void setVerificationDoc(Blob verificationDoc) {
		this.verificationDoc = verificationDoc;
	}
}
