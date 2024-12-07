package com.jfsd.saahas.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jfsd.saahas.springboot.model.LegalAdvisor;
import com.jfsd.saahas.springboot.repository.LegalAdvisorRepository;

@Service
public class LegalAdvisorServiceImpl implements LegalAdvisorService {

    @Autowired
    private LegalAdvisorRepository legalAdvisorRepository;

    @Override
    public String registerLegalAdvisor(LegalAdvisor legalAdvisor) {
        legalAdvisorRepository.save(legalAdvisor);
        return "Legal Advisor registered successfully";
    }

    @Override
    public LegalAdvisor checkLegalAdvisorLogin(String email, String password) {
        LegalAdvisor legalAdvisor = legalAdvisorRepository.checkLegalAdvisorLogin(email, password);
        if (legalAdvisor != null && legalAdvisor.getStatus().equals("Accepted")) {
            return legalAdvisor;
        } else {
            return null;
        }
    }

    @Override
    public LegalAdvisor displayLegalAdvisorById(int id) {
        return legalAdvisorRepository.findById(id).get();
    }

    @Override
    public String updateLegalAdvisorProfile(LegalAdvisor legalAdvisor) {
        LegalAdvisor srikar = legalAdvisorRepository.findById(legalAdvisor.getId()).get();

        srikar.setUsername(legalAdvisor.getUsername());
        srikar.setPassword(legalAdvisor.getPassword());
        srikar.setEmail(legalAdvisor.getEmail());
        srikar.setPhone(legalAdvisor.getPhone());
        srikar.setDateOfBirth(legalAdvisor.getDateOfBirth());
        srikar.setGender(legalAdvisor.getGender());
        srikar.setAddress(legalAdvisor.getAddress());
        srikar.setAadhaarNumber(legalAdvisor.getAadhaarNumber());
        srikar.setBarRegistrationNumber(legalAdvisor.getBarRegistrationNumber());
        srikar.setSpecialization(legalAdvisor.getSpecialization());
        srikar.setExperience(legalAdvisor.getExperience());
        srikar.setBio(legalAdvisor.getBio());
        srikar.setRating(legalAdvisor.getRating());
        srikar.setEarnings(legalAdvisor.getEarnings());
        srikar.setStatus(legalAdvisor.getStatus());
            legalAdvisorRepository.save(srikar);
            return "Legal Advisor profile updated successfully";

    }
}
