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
@Table(name ="survivor_the_victim_table")
public class SurvivorTheVictim {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "survivor_the_victim_id")
    private int id;

    @Column(name = "survivor_the_victim_username", length = 50, nullable = false, unique = true)
    private String username;

    @Column(name = "survivor_the_victim_password", length = 50, nullable = false)
    private String password;

    @Column(name = "survivor_the_victim_email", length = 100, nullable = false, unique = true)
    private String email;

    @Column(name = "survivor_the_victim_phone", length = 15, nullable = false)
    private String phone;

    @Column(name = "survivor_the_victim_date_of_birth", nullable = false, length = 20)
    private String dateOfBirth;

    @Column(name = "survivor_the_victim_gender", nullable = false)
    private String gender;

    @Column(name = "survivor_the_victim_address", length = 255, nullable = false)
    private String address;

    @Column(name = "survivor_the_victim_aadhaar_number", nullable = false, unique = true, length = 12)
    private String aadhaarNumber;

    //--------------------------------------------------

    
    ///--The @Lob annotation is used to specify that the currently annotated entity attribute represents a large object type
    //we use it because of it
    @Lob
    @Column(name = "survivor_the_victim_image", nullable = false)
    private Blob image;  

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

	public Blob getImage() {
		return image;
	}

	public void setImage(Blob image) {
		this.image = image;
	}

  //--------------------------------------------------
//
//    @Column(name = "survivor_the_victim_assigned_counselor", length = 50)
//    private String assignedCounselor;
//
//    @Column(name = "survivor_the_victim_assigned_doctor", length = 50)
//    private String assignedDoctor;
//
//    @Column(name = "survivor_the_victim_assigned_legal_advisor", length = 50)
//    private String assignedLegalAdvisor;
//
//    @Column(name = "survivor_the_victim_task_list", length = 1000)
//    private String taskList;
//
//    @Column(name = "survivor_the_victim_case_status", length = 100)
//    private String caseStatus;
//	
//	

	//--------------------------------------------------
	//--------------------------------------------------
	//--------------------------------------------------



}
