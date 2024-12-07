//--no imp

package com.jfsd.saahas.springboot.service;

import com.jfsd.saahas.springboot.model.LegalAdvisor;

public interface LegalAdvisorService {

	
    String registerLegalAdvisor(LegalAdvisor legalAdvisor);
    LegalAdvisor checkLegalAdvisorLogin(String email, String password);
    LegalAdvisor displayLegalAdvisorById(int id);
    String updateLegalAdvisorProfile(LegalAdvisor legalAdvisor);
	
	
}
