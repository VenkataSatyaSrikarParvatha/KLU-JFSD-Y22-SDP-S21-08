package com.jfsd.saahas.springboot.service;

import java.util.List;
import com.jfsd.saahas.springboot.model.Session;

public interface SessionService {
    String saveSession(Session session);
    List<Session> getAllSessions();
    Session loginCounselor(String counselorName, String counselorPassword);
    Session loginSurvivor(String survivorName, String survivorPassword);
    Session getSessionById(int sessionId);
    void registerSurvivor(Session session);
    void updateSurvivorStatus(int sessionId, String status);
    

    String updateSession(Session session);

    Session findSessionById(int id);
    
    
    List<Session> getSessionsByCounselorId(int counselorId);
    
    
    List<Session> getSessionsBySurvivorId(int survivorTheVictimId);
    
    
    public List<Session> searchSessionsByTitleOrContext(String query);
}
