package com.jfsd.saahas.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jfsd.saahas.springboot.model.Session;

@Repository
public interface SessionRepository extends JpaRepository<Session, Integer> {
    Session findByCounselorNameAndCounselorPassword(String counselorName, String counselorPassword);

    Session findBySurvivorTheVictimNameAndSurvivorTheVictimPassword(String survivorTheVictimName, String survivorTheVictimPassword);
    
    
    
    Session findById(int id);
    
    List<Session> findByCounselorsId(int counselorsId);
    
    List<Session> findBySurvivorTheVictimId(int survivorTheVictimId);
    
    List<Session> findByTitleContainingOrContextContaining(String title, String context);
    
    

    
    
}
