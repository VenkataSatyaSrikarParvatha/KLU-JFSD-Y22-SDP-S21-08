package com.jfsd.saahas.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.jfsd.saahas.springboot.model.LegalAdvisor;

import jakarta.transaction.Transactional;

public interface LegalAdvisorRepository extends JpaRepository<LegalAdvisor, Integer> {

	
    @Query("select l from LegalAdvisor l where l.email = ?1 and l.password = ?2")
    public LegalAdvisor checkLegalAdvisorLogin(String email, String password);

    @Query("update LegalAdvisor l set l.status = ?1 where l.id = ?2")
    @Modifying
    @Transactional
    public int updateLegalAdvisorStatus(String status, int id);
    

}
