package com.jfsd.saahas.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.jfsd.saahas.springboot.model.Doctor;

import jakarta.transaction.Transactional;

public interface DoctorRepository extends JpaRepository<Doctor, Integer> {

    @Query("select d from Doctor d where d.email = ?1 and d.password = ?2")
    public Doctor checkDoctorLogin(String email, String password);

    @Query("update Doctor d set d.status = ?1 where d.id = ?2")
    @Modifying
    @Transactional
    public int updateDoctorStatus(String status, int id);
    
}

//we are using the transactional here
//because when we do multiple operations on the db we may face diffuculties
//that time it will help in rollback if not succesfully completed