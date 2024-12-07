package com.jfsd.saahas.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.jfsd.saahas.springboot.model.AdminTeam;

import jakarta.transaction.Transactional;

public interface AdminTeamRepository extends JpaRepository<AdminTeam, Integer> {
	
	
    @Query("select a from AdminTeam a where a.username = ?1 and a.password = ?2")
    public AdminTeam checkAdminTeamLogin(String username, String password);
    
    @Query("update AdminTeam a set a.status = ?1 where a.id = ?2")
    @Modifying
    @Transactional
    public int updateAdminTeamStatus(String status, int id);
    

}

