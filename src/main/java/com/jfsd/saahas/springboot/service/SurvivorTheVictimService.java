package com.jfsd.saahas.springboot.service;

import com.jfsd.saahas.springboot.model.SurvivorTheVictim;

public interface SurvivorTheVictimService {

	String registerSurvivor(SurvivorTheVictim survivor);
    SurvivorTheVictim loginSurvivor(String email, String password);
 //   int updateCaseStatus(String caseStatus, int id);
    SurvivorTheVictim displayById(int id);
	
    String updateSurvivorTheVictimProfile(SurvivorTheVictim survivorTheVictim);
	
}
