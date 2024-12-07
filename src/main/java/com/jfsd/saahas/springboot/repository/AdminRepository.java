package com.jfsd.saahas.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.jfsd.saahas.springboot.model.Admin;

public interface AdminRepository extends JpaRepository<Admin, String>{
	
    @Query("select a from Admin a where a.username = ?1 and a.password = ?2")
    public Admin checkAdminLogin(String username, String password);
	
}
