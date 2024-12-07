package com.jfsd.saahas.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jfsd.saahas.springboot.model.Article;
import com.jfsd.saahas.springboot.model.Doctor;
import com.jfsd.saahas.springboot.repository.ArticleRepository;
import com.jfsd.saahas.springboot.repository.DoctorRepository;

@Service
public class DoctorServiceImpl implements DoctorService {

    @Autowired
    private DoctorRepository doctorRepository;

    @Autowired
    private ArticleRepository articleRepository;  

    @Override
    public String registerDoctor(Doctor doctor) {
        doctorRepository.save(doctor);
        return "Doctor registered successfully"; 
    }

    @Override
    public Doctor checkDoctorLogin(String email, String password) {
        Doctor doctor = doctorRepository.checkDoctorLogin(email, password);
        if (doctor != null && doctor.getStatus().equals("Accepted")) {
            return doctor;
        } else {
            return null;
        }
    }

    @Override
    public Doctor displayDoctorById(int id) {
        return doctorRepository.findById(id).orElse(null);  // Better null handling
    }

    @Override
    public String updateDoctorProfile(Doctor doctor) {
        Doctor srikar = doctorRepository.findById(doctor.getId()).orElse(null);

        if (srikar != null) {
        	srikar.setUsername(doctor.getUsername());
        	srikar.setPassword(doctor.getPassword());
        	srikar.setEmail(doctor.getEmail());
        	srikar.setPhone(doctor.getPhone());
        	srikar.setDateOfBirth(doctor.getDateOfBirth());
        	srikar.setGender(doctor.getGender());
        	srikar.setAddress(doctor.getAddress());
        	srikar.setAadhaarNumber(doctor.getAadhaarNumber());
        	srikar.setLicenseNumber(doctor.getLicenseNumber());
        	srikar.setSpecialization(doctor.getSpecialization());
            srikar.setExperience(doctor.getExperience());
            srikar.setBio(doctor.getBio());
            srikar.setRating(doctor.getRating());
            srikar.setEarnings(doctor.getEarnings());

            if (doctor.getImage() != null) {
            	srikar.setImage(doctor.getImage());
            }

            doctorRepository.save(srikar);
            return "Doctor profile updated successfully";
        } else {
            return "Doctor not found";
        }
    }

    @Override
    public String saveArticle(Article article) {
        try {

            Article savedArticle = articleRepository.save(article);
            return "Article added successfully with ID: " + savedArticle.getId();
        } catch (Exception e) {
            return "Error while saving article: " + e.getMessage();
        }
    }
}
