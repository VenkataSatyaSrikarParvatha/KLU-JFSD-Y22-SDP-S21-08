package com.jfsd.saahas.springboot.service;

import java.util.List;

import com.jfsd.saahas.springboot.model.Admin;
import com.jfsd.saahas.springboot.model.AdminTeam;
import com.jfsd.saahas.springboot.model.Counselor;
import com.jfsd.saahas.springboot.model.Doctor;
import com.jfsd.saahas.springboot.model.LegalAdvisor;
import com.jfsd.saahas.springboot.model.SurvivorTheVictim;

public interface AdminService {
    public List<Counselor> viewAllCounselors();
    public List<Doctor> viewAllDoctors();
    public List<LegalAdvisor> viewAllLegalAdvisors();
    public List<SurvivorTheVictim> viewAllSurvivors();
    public List<AdminTeam> viewAllAdminTeam();

    public Admin checkAdminLogin(String username, String password);
    
    public String deleteCounselor(int id);
    public String deleteDoctor(int id);
    public String deleteLegalAdvisor(int id);
    public String deleteSurvivor(int id);
    public String deleteAdminTeam(int id);
    
    public Counselor displayCounselorById(int id);
    public Doctor displayDoctorById(int id);
    public LegalAdvisor displayLegalAdvisorById(int id);
    public SurvivorTheVictim displaySurvivorById(int id);
    public AdminTeam displayAdminTeamById(int id);

    public long counselorCount();
    public long doctorCount();
    public long legalAdvisorCount();
    public long survivorTheVictimCount();
    public long adminTeamCount(); 
    

    public String updateCounselorStatus(String status, int id);
    public String updateDoctorStatus(String status, int id);
    public String updateLegalAdvisorStatus(String status, int id);
    public String updateAdminTeamStatus(String status, int id);
    
    public String addAdminTeam(AdminTeam adminTeam);
    
    
    
    
    
    
    
    
    
    public Counselor getCounselorById(int id) ;

    
    public Doctor getDoctorById(int id) ;

    
    public LegalAdvisor getLegalAdvisorById(int id) ;

  
    public SurvivorTheVictim getSurvivorById(int id);

   
    public AdminTeam getAdminTeamById(int id) ;
    
    
    
    
    
}
