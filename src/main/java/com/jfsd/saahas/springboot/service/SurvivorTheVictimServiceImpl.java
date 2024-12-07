package com.jfsd.saahas.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jfsd.saahas.springboot.model.SurvivorTheVictim;
import com.jfsd.saahas.springboot.repository.SurvivorTheVictimRepository;

@Service
public class SurvivorTheVictimServiceImpl implements SurvivorTheVictimService {

    @Autowired
    private SurvivorTheVictimRepository survivorTheVictimRepository;

    @Override
    public String registerSurvivor(SurvivorTheVictim survivor) {
        survivorTheVictimRepository.save(survivor);
        return "Victim registered successfully";
    }

    @Override
    public SurvivorTheVictim loginSurvivor(String email, String password) {
        return survivorTheVictimRepository.checkSurvivorLogin(email, password);
    }

//    @Override
//    public int updateCaseStatus(String caseStatus, int id) {
//        return survivorTheVictimRepository.updateCaseStatus(caseStatus, id);
//    }

    @Override
    public SurvivorTheVictim displayById(int id) {
        return survivorTheVictimRepository.findById(id).get();
    }
    @Override
    public String updateSurvivorTheVictimProfile(SurvivorTheVictim survivorTheVictim) {
    	 SurvivorTheVictim srikar = survivorTheVictimRepository.findById(survivorTheVictim.getId()).get();

        // Update fields
    	 srikar.setUsername(survivorTheVictim.getUsername());
    	 srikar.setPassword(survivorTheVictim.getPassword());
    	 srikar.setEmail(survivorTheVictim.getEmail());
    	 srikar.setPhone(survivorTheVictim.getPhone());
    	 srikar.setDateOfBirth(survivorTheVictim.getDateOfBirth());
    	 srikar.setGender(survivorTheVictim.getGender());
    	 srikar.setAddress(survivorTheVictim.getAddress());
    	 srikar.setAadhaarNumber(survivorTheVictim.getAadhaarNumber());

        // Optionally update profile image
        if (survivorTheVictim.getImage() != null) {
        	srikar.setImage(survivorTheVictim.getImage());
        }

        survivorTheVictimRepository.save(srikar);

        return "Survivor profile updated successfully.";
    }
}
