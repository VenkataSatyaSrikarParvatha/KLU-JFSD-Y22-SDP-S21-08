package com.jfsd.saahas.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jfsd.saahas.springboot.model.Admin;
import com.jfsd.saahas.springboot.model.AdminTeam;
import com.jfsd.saahas.springboot.model.Counselor;
import com.jfsd.saahas.springboot.model.Doctor;
import com.jfsd.saahas.springboot.model.LegalAdvisor;
import com.jfsd.saahas.springboot.model.SurvivorTheVictim;
import com.jfsd.saahas.springboot.repository.AdminRepository;
import com.jfsd.saahas.springboot.repository.AdminTeamRepository;
import com.jfsd.saahas.springboot.repository.CounselorRepository;
import com.jfsd.saahas.springboot.repository.DoctorRepository;
import com.jfsd.saahas.springboot.repository.LegalAdvisorRepository;
import com.jfsd.saahas.springboot.repository.SurvivorTheVictimRepository;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminRepository adminRepository;
    
    @Autowired
    private CounselorRepository counselorRepository;
    
    @Autowired
    private DoctorRepository doctorRepository;
    
    @Autowired
    private LegalAdvisorRepository legalAdvisorRepository;
    
    @Autowired
    private SurvivorTheVictimRepository survivorTheVictimRepository;
    
    @Autowired
    private AdminTeamRepository adminTeamRepository;

    @Override
    public List<Counselor> viewAllCounselors() {
        return counselorRepository.findAll();
    }

    @Override
    public List<Doctor> viewAllDoctors() {
        return doctorRepository.findAll();
    }

    @Override
    public List<LegalAdvisor> viewAllLegalAdvisors() {
        return legalAdvisorRepository.findAll();
    }

    @Override
    public List<SurvivorTheVictim> viewAllSurvivors() {
        return survivorTheVictimRepository.findAll();
    }

    @Override
    public List<AdminTeam> viewAllAdminTeam() {
        return adminTeamRepository.findAll();
    }

    @Override
    public Admin checkAdminLogin(String username, String password) {
        return adminRepository.checkAdminLogin(username, password);
    }

    @Override
    public String deleteCounselor(int id) {
        counselorRepository.deleteById(id);
        return "Counselor deleted successfully";
    }
    
    @Override
    public String deleteDoctor(int id) {
        doctorRepository.deleteById(id);
        return "Doctor deleted successfully";
    }

    @Override
    public String deleteLegalAdvisor(int id) {
        legalAdvisorRepository.deleteById(id);
        return "Legal Advisor deleted successfully";
    }

    @Override
    public String deleteSurvivor(int id) {
        survivorTheVictimRepository.deleteById(id);
        return "Survivor deleted successfully";
    }

    @Override
    public String deleteAdminTeam(int id) {
        adminTeamRepository.deleteById(id);
        return "Admin Team Member deleted successfully";
    }

    @Override
    public Counselor displayCounselorById(int id) {
        return counselorRepository.findById(id).get();
    }

    @Override
    public Doctor displayDoctorById(int id) {
        return doctorRepository.findById(id).get();
    }

    @Override
    public LegalAdvisor displayLegalAdvisorById(int id) {
        return legalAdvisorRepository.findById(id).get();
    }

    @Override
    public SurvivorTheVictim displaySurvivorById(int id) {
        return survivorTheVictimRepository.findById(id).get();
    }

    @Override
    public AdminTeam displayAdminTeamById(int id) {
        return adminTeamRepository.findById(id).get();
    }

    @Override
    public long counselorCount() {
        return counselorRepository.count();
    }

    @Override
    public long doctorCount() {
        return doctorRepository.count();
    }

    @Override
    public long legalAdvisorCount() {
        return legalAdvisorRepository.count();
    }

    @Override
    public long survivorTheVictimCount() {
        return survivorTheVictimRepository.count();
    }

    @Override
    public long adminTeamCount() {
        return adminTeamRepository.count();
    }

    @Override
    public String updateCounselorStatus(String status, int id) {
        counselorRepository.updateCounselorStatus(status, id);
        return "Counselor status updated successfully";
    }

    @Override
    public String updateDoctorStatus(String status, int id) {
        doctorRepository.updateDoctorStatus(status, id);
        return "Doctor status updated successfully";
    }

    @Override
    public String updateLegalAdvisorStatus(String status, int id) {
        legalAdvisorRepository.updateLegalAdvisorStatus(status, id);
        return "Legal Advisor status updated successfully";
    }

    @Override
    public String updateAdminTeamStatus(String status, int id) {
        adminTeamRepository.updateAdminTeamStatus(status, id);
        return "Admin Team status updated successfully";
    }
    
    public Counselor getCounselorById(int id) {
        return counselorRepository.findById(id).get(); 
    }

   
    public Doctor getDoctorById(int id) {
        return doctorRepository.findById(id).get(); 
    }

    
    public LegalAdvisor getLegalAdvisorById(int id) {
        return legalAdvisorRepository.findById(id).get();
    }

  
    public SurvivorTheVictim getSurvivorById(int id) {
        return survivorTheVictimRepository.findById(id).get();
    }

  
    public AdminTeam getAdminTeamById(int id) {
        return adminTeamRepository.findById(id).get(); 
    }

	@Override
	public String addAdminTeam(AdminTeam adminTeam) {
		adminTeamRepository.save(adminTeam);
		return "Admin Team Member Added successfully";
	}


}
