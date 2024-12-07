package com.jfsd.saahas.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.jfsd.saahas.springboot.model.SurvivorTheVictim;

public interface SurvivorTheVictimRepository extends JpaRepository<SurvivorTheVictim, Integer> {

	
	
    @Query("select s from SurvivorTheVictim s where s.email = ?1 and s.password = ?2")
    public SurvivorTheVictim checkSurvivorLogin(String email, String password);

//    @Query("update SurvivorTheVictim s set s.caseStatus = ?1 where s.id = ?2")
//    @Modifying
//    @Transactional
//    public int updateCaseStatus(String caseStatus, int id);
//    
	
}
