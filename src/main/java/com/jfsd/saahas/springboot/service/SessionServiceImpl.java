package com.jfsd.saahas.springboot.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jfsd.saahas.springboot.model.Session;
import com.jfsd.saahas.springboot.repository.SessionRepository;


@Service
public class SessionServiceImpl implements SessionService {

    @Autowired
    private SessionRepository sessionRepository;

    @Override
    public String saveSession(Session session) {
        session.setCreatedAt(java.time.LocalDateTime.now());
        sessionRepository.save(session);
        return "Session Added Successfully";
    }

    @Override
    public List<Session> getAllSessions() {
        return sessionRepository.findAll();
    }

    @Override
    public Session loginCounselor(String counselorName, String counselorPassword) {
        return sessionRepository.findByCounselorNameAndCounselorPassword(counselorName, counselorPassword);
    }

    @Override
    public Session loginSurvivor(String survivorName, String survivorPassword) {
        return sessionRepository.findBySurvivorTheVictimNameAndSurvivorTheVictimPassword(survivorName, survivorPassword);
    }

    @Override
    public Session getSessionById(int sessionId) {
        return sessionRepository.findById(sessionId);
    }

    @Override
    public void registerSurvivor(Session session) {
        session.setSurvivorTheVictimStatus("Registered");
        sessionRepository.save(session);
    }

    @Override
    public void updateSurvivorStatus(int sessionId, String status) {
        Session session = getSessionById(sessionId);
        if (session != null) {
            session.setSurvivorTheVictimStatus(status);
            sessionRepository.save(session);
        }
    }
    
    @Override
    public String updateSession(Session session) {
        Session srikar = sessionRepository.findById(session.getId());
        if (srikar != null) {
        	srikar.setSurvivorTheVictimId(session.getSurvivorTheVictimId());
        	srikar.setSurvivorTheVictimName(session.getSurvivorTheVictimName());
        	srikar.setSurvivorTheVictimPassword(session.getSurvivorTheVictimPassword());
        	srikar.setSurvivorTheVictimStatus(session.getSurvivorTheVictimStatus());
            sessionRepository.save(srikar);  
            return "Session updated successfully!";
        } else {
            return "Session not found!";
        }
    }

    // Find session by ID
    @Override
    public Session findSessionById(int id) {
        return sessionRepository.findById(id);
    }

    public List<Session> getSessionsByCounselorId(int counselorId) {
        return sessionRepository.findByCounselorsId(counselorId);
    }

	@Override
	public List<Session> getSessionsBySurvivorId(int survivorTheVictimId) {
		 return sessionRepository.findBySurvivorTheVictimId(survivorTheVictimId);
	}
	@Override	
	public List<Session> searchSessionsByTitleOrContext(String query) {
	    return sessionRepository.findByTitleContainingOrContextContaining(query, query);
	}

	
	



}
