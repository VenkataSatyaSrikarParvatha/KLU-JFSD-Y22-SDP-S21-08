package com.jfsd.saahas.springboot.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "session_table")
public class Session {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "session_title", nullable = false, length = 200)
    private String title;

    @Column(name = "session_context", nullable = true, length = 500)
    private String context;

    @Column(name = "session_counselor_id", nullable = false)
    private int counselorsId;
    
    @Column(name = "session_counselor_password", length = 50, nullable = false)
    private String counselorPassword;
    


    @Column(name = "session_counselor_name", nullable = false)
    private String counselorName; 
    
    @Column(name = "session_counselor_role", nullable = false)
    private String counselorRole; 



    @Column(name = "session_survivor_the_victim_id")
    private int survivorTheVictimId;
    

    @Column(name = "session_survivor_the_victim_name")
    private String survivorTheVictimName; 
    
    @Column(name = "session_survivor_the_victim_password", length = 50)
    private String survivorTheVictimPassword;
    
    @Column(name = "session_survivor_the_victim_status")
    private String survivorTheVictimStatus; 
    
    

    @Column(name = "session_created_at", nullable = false)
    private LocalDateTime createdAt;



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getContext() {
		return context;
	}



	public void setContext(String context) {
		this.context = context;
	}



	public int getCounselorsId() {
		return counselorsId;
	}



	public void setCounselorsId(int counselorsId) {
		this.counselorsId = counselorsId;
	}



	public String getCounselorPassword() {
		return counselorPassword;
	}



	public void setCounselorPassword(String counselorPassword) {
		this.counselorPassword = counselorPassword;
	}



	public String getCounselorName() {
		return counselorName;
	}



	public void setCounselorName(String counselorName) {
		this.counselorName = counselorName;
	}



	public String getCounselorRole() {
		return counselorRole;
	}



	public void setCounselorRole(String counselorRole) {
		this.counselorRole = counselorRole;
	}



	public int getSurvivorTheVictimId() {
		return survivorTheVictimId;
	}



	public void setSurvivorTheVictimId(int survivorTheVictimId) {
		this.survivorTheVictimId = survivorTheVictimId;
	}



	public String getSurvivorTheVictimName() {
		return survivorTheVictimName;
	}



	public void setSurvivorTheVictimName(String survivorTheVictimName) {
		this.survivorTheVictimName = survivorTheVictimName;
	}



	public String getSurvivorTheVictimPassword() {
		return survivorTheVictimPassword;
	}



	public void setSurvivorTheVictimPassword(String survivorTheVictimPassword) {
		this.survivorTheVictimPassword = survivorTheVictimPassword;
	}



	public String getSurvivorTheVictimStatus() {
		return survivorTheVictimStatus;
	}



	public void setSurvivorTheVictimStatus(String survivorTheVictimStatus) {
		this.survivorTheVictimStatus = survivorTheVictimStatus;
	}



	public LocalDateTime getCreatedAt() {
		return createdAt;
	}



	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	} 
	
	 public Session() {
	       
	    }
	


}
