package com.jfsd.saahas.springboot.service;

import com.jfsd.saahas.springboot.model.Article;
import com.jfsd.saahas.springboot.model.Doctor;

public interface DoctorService {
	
	
    String registerDoctor(Doctor doctor);
    Doctor checkDoctorLogin(String email, String password);
    Doctor displayDoctorById(int id);
    String updateDoctorProfile(Doctor doctor);
    public String saveArticle(Article article);
	

}
