package com.jfsd.saahas.springboot.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jfsd.saahas.springboot.model.Counselor;
import com.jfsd.saahas.springboot.model.Session;
import com.jfsd.saahas.springboot.model.SurvivorTheVictim;
import com.jfsd.saahas.springboot.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class SessionController {
	
	@Autowired
	private SessionService sessionService;


	@GetMapping("/sessionDashboard")
	public ModelAndView viewSessionDashboard(HttpServletRequest request, @RequestParam("sessionId") int sessionId) {
	    ModelAndView mv = new ModelAndView("sessionDashboard");

	    // Get the session object (common for both counselor and survivor)
	    Session sessionDetails = sessionService.findSessionById(sessionId);


	    
	    
	    if (sessionDetails != null) {
	        HttpSession httpSession = request.getSession();
	        
	        if (httpSession.getAttribute("chatMessages") == null) {
	            httpSession.setAttribute("chatMessages", new ArrayList<String>());
	        }
	        
	        
	        // Counselor logic
	        Counselor counselor = (Counselor) httpSession.getAttribute("counselor");
	        if (counselor != null) {
	            mv.addObject("role", "counselor");
	            mv.addObject("session", sessionDetails);
	            mv.addObject("userName", counselor.getUsername()); // Add counselor's name
	            List<Session> counselorSessions = sessionService.getSessionsByCounselorId(counselor.getId());
	            mv.addObject("sessions", counselorSessions);
	            return mv;
	        }

	        // Survivor logic
	        SurvivorTheVictim survivor = (SurvivorTheVictim) httpSession.getAttribute("survivor");
	        if (survivor != null) {
	            if ("Accepted".equals(sessionDetails.getSurvivorTheVictimStatus())) {
	                mv.addObject("role", "survivor");
	                mv.addObject("session", sessionDetails);
	                mv.addObject("userName", survivor.getUsername()); // Add survivor's name
	                return mv;
	            } else {
	                mv.addObject("message", "You are not enrolled in this session or your status is not accepted.");
	                mv.setViewName("survivor/noAccess");
	                return mv;
	            }
	        }

	        // If neither counselor nor survivor is found in session, ask for login
	        mv.setViewName("login");
	        mv.addObject("message", "Please log in first.");
	        return mv;
	    } else {
	        mv.addObject("message", "Session not found.");
	        mv.setViewName("error");
	        return mv;
	    }
	}

	@PostMapping("/sendMessage")
	@ResponseBody
	public String sendMessage(HttpServletRequest request, @RequestParam("message") String message) {
	    HttpSession session = request.getSession();
	    List<String> chatMessages = (List<String>) session.getAttribute("chatMessages");
	    if (chatMessages != null) {
	        chatMessages.add(message);
	    }
	    return "Message sent!";
	}

	// AJAX endpoint for getting all chat messages
	@GetMapping("/getMessages")
	@ResponseBody
	public List<String> getMessages(HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    List<String> chatMessages = (List<String>) session.getAttribute("chatMessages");
	    return chatMessages != null ? chatMessages : new ArrayList<>();
	} 
    
    
}
