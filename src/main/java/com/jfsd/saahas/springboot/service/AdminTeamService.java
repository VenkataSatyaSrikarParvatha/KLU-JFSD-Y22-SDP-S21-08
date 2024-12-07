package com.jfsd.saahas.springboot.service;

import java.util.List;

import com.jfsd.saahas.springboot.model.AdminTeam;
import com.jfsd.saahas.springboot.model.Counselor;
import com.jfsd.saahas.springboot.model.Doctor;
import com.jfsd.saahas.springboot.model.LegalAdvisor;
import com.jfsd.saahas.springboot.model.SurvivorTheVictim;

public interface AdminTeamService {

	
    public List<Counselor> viewAllCounselors();
    public List<Doctor> viewAllDoctors();
    public List<LegalAdvisor> viewAllLegalAdvisors();
    public List<SurvivorTheVictim> viewAllSurvivors();

    public AdminTeam checkAdminTeamLogin(String username, String password);
    
    public String deleteCounselor(int id);
    public String deleteDoctor(int id);
    public String deleteLegalAdvisor(int id);
    public String deleteSurvivor(int id);
    
    public Counselor displayCounselorById(int id);
    public Doctor displayDoctorById(int id);
    public LegalAdvisor displayLegalAdvisorById(int id);
    public SurvivorTheVictim displaySurvivorById(int id);

    public long counselorCount();
    public long doctorCount();
    public long legalAdvisorCount();
    public long survivorTheVictimCount();

    public String updateCounselorStatus(String status, int id);
    public String updateDoctorStatus(String status, int id);
    public String updateLegalAdvisorStatus(String status, int id);
	
	
}
