//image and pdf added
//but only image done
//pdf has to be dnoe

package com.jfsd.saahas.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jfsd.saahas.springboot.model.Article;
import com.jfsd.saahas.springboot.model.Counselor;
import com.jfsd.saahas.springboot.model.Session;
import com.jfsd.saahas.springboot.repository.ArticleRepository;
import com.jfsd.saahas.springboot.repository.CounselorRepository;
import com.jfsd.saahas.springboot.repository.SessionRepository;

@Service
public class CounselorServiceImpl implements CounselorService {

    @Autowired
    private CounselorRepository counselorRepository;
    
    @Autowired
    private ArticleRepository articleRepository;
    
    @Autowired
    private SessionRepository sessionRepository;

    @Override
    public String registerCounselor(Counselor counselor) {
        counselorRepository.save(counselor);
        return "Counselor registered successfully"; 
    }

    @Override
    public Counselor checkCounselorLogin(String email, String password) {
        Counselor counselor = counselorRepository.checkCounselorLogin(email, password);
        if (counselor != null && counselor.getStatus().equals("Accepted")) {
            return counselor;
        } else {
            return null;
        }
    }

    @Override
    public Counselor displayCounselorById(int id) {
        return counselorRepository.findById(id).get();
    }

    @Override
    public String updateCounselorProfile(Counselor counselor) {
        Counselor srikar = counselorRepository.findById(counselor.getId()).get(); // Using get() because it's existing

        if (srikar != null) {
            
        	srikar.setUsername(counselor.getUsername());
        	srikar.setPassword(counselor.getPassword());
        	srikar.setEmail(counselor.getEmail());
        	srikar.setPhone(counselor.getPhone());
        	srikar.setDateOfBirth(counselor.getDateOfBirth());
        	srikar.setGender(counselor.getGender());
        	srikar.setAddress(counselor.getAddress());
        	srikar.setAadhaarNumber(counselor.getAadhaarNumber());
            srikar.setSpecialization(counselor.getSpecialization());
            srikar.setExperience(counselor.getExperience());
            srikar.setBio(counselor.getBio());
            srikar.setEarnings(counselor.getEarnings());

            if (counselor.getProfileImage() != null) {
            	srikar.setProfileImage(counselor.getProfileImage());
            }

            if (counselor.getVerificationPdf() != null) {
            	srikar.setVerificationPdf(counselor.getVerificationPdf());
            }

            counselorRepository.save(srikar);
            return "Counselor profile updated successfully";
        }

        return "Counselor not found";
    }
    
    
    
    
    public String saveArticle(Article article) {
        articleRepository.save(article);
        return "Article added successfully";
    }

	@Override
	public String saveSession(Session session) {
		sessionRepository.save(session);
		return "Session saved";
	}


    
}
