package com.jfsd.saahas.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "admin_team_table")
public class AdminTeam {
	
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "admin_team_id")
    private int id;

    @Column(name = "admin_team_username", length = 50, nullable = false, unique = true)
    private String username;

    @Column(name = "admin_team_password", length = 50, nullable = false)
    private String password;

    @Column(name = "admin_team_email", length = 100, nullable = false, unique = true)
    private String email;

    @Column(name = "admin_team_phone", length = 15, nullable = false)
    private String phone;

    @Column(name = "admin_team_date_of_birth",nullable=false,length = 20)
    private String dateOfBirth;

    @Column(name = "admin_team_gender", nullable = false)
    private String gender;

    @Column(name = "admin_team_address", length = 255, nullable = false)
    private String address;

    @Column(name = "admin_team_aadhaar_number", nullable = false, unique = true, length = 12)
    private String aadhaarNumber;
	
    @Column(name = "admin_team_status",nullable=false, length = 50)
    private String status;
	

	//--------------------------------------------------
	//--------------------------------------------------
	//--------------------------------------------------
	
	
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
