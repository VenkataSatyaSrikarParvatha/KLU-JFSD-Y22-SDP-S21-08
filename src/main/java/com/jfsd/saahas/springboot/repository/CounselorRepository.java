package com.jfsd.saahas.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.jfsd.saahas.springboot.model.Counselor;

import jakarta.transaction.Transactional;

public interface CounselorRepository extends JpaRepository<Counselor, Integer> {

	
    @Query("select c from Counselor c where c.email = ?1 and c.password = ?2")
    public Counselor checkCounselorLogin(String email, String password);

    @Query("update Counselor c set c.status = ?1 where c.id = ?2")
    @Modifying
    @Transactional
    public int updateCounselorStatus(String status, int id);
	
}


