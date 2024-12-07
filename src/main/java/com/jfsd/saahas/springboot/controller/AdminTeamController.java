package com.jfsd.saahas.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jfsd.saahas.springboot.model.AdminTeam;
import com.jfsd.saahas.springboot.model.Counselor;
import com.jfsd.saahas.springboot.repository.AdminTeamRepository;
import com.jfsd.saahas.springboot.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminTeamController {

	@Autowired
	public AdminTeamRepository adminTeamRepository;
	
    
    @Autowired
    private AdminService adminService;
  


    @GetMapping("adminteamlogin")
    public ModelAndView adminLogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminTeam/adminTeamlogin");
        return mv;
    }
    
    @PostMapping("checkadminteamlogin")
    public ModelAndView checkAdminTeamLogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String auname = request.getParameter("auname");
        String apwd = request.getParameter("apwd");

        AdminTeam adminTeam = adminTeamRepository.checkAdminTeamLogin(auname, apwd); 
        if (adminTeam != null && "Accepted".equalsIgnoreCase(adminTeam.getStatus())) {
            HttpSession session = request.getSession();
            session.setAttribute("adminTeam", adminTeam);

            mv.setViewName("adminTeam/adminTeamhome"); 


            
        } else {
            mv.setViewName("adminTeam/adminTeamloginfail"); 

            mv.addObject("message", "Login Failed. Invalid username or password.");
        }
        return mv;
    }

    @GetMapping("adminTeamlogout")
    public ModelAndView adminLogout() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminTeam/adminTeamlogin");
        return mv;
    }
	
    


	
	
}
