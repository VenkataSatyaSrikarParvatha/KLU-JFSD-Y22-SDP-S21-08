package com.jfsd.saahas.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jfsd.saahas.springboot.model.LegalAdvisor;
import com.jfsd.saahas.springboot.service.LegalAdvisorService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class LegalAdvisorController {

    @Autowired
    private LegalAdvisorService legalAdvisorService;



    @GetMapping("legaladvisorreg")
    public ModelAndView legalAdvisorReg() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("legaladvisorreg");
        return mv;
    }

    @PostMapping("insertlegaladvisor")
    public ModelAndView insertLegalAdvisor(HttpServletRequest request) {
        String username = request.getParameter("lusername");
        String password = request.getParameter("lpassword");
        String email = request.getParameter("lemail");
        String phone = request.getParameter("lphone");
        String dateOfBirth = request.getParameter("ldateOfBirth");
        String gender = request.getParameter("lgender");
        String address = request.getParameter("laddress");
        String aadhaarNumber = request.getParameter("laadhaarNumber");
        String barRegistrationNumber = request.getParameter("lbarRegistrationNumber");
        String specialization = request.getParameter("lspecialization");
        int experience = Integer.parseInt(request.getParameter("lexperience"));
        String bio = request.getParameter("lbio");
        double earnings = Double.parseDouble(request.getParameter("learnings"));
        double rating = Double.parseDouble(request.getParameter("lrating"));
        String status = "Registered";
        
        
        

        LegalAdvisor legalAdvisor = new LegalAdvisor();
        legalAdvisor.setUsername(username);
        legalAdvisor.setPassword(password);
        legalAdvisor.setEmail(email);
        legalAdvisor.setPhone(phone);
        legalAdvisor.setDateOfBirth(dateOfBirth);
        legalAdvisor.setGender(gender);
        legalAdvisor.setAddress(address);
        legalAdvisor.setAadhaarNumber(aadhaarNumber);
        legalAdvisor.setBarRegistrationNumber(barRegistrationNumber);
        legalAdvisor.setSpecialization(specialization);
        legalAdvisor.setExperience(experience);
        legalAdvisor.setEarnings(earnings);
        legalAdvisor.setBio(bio);
        legalAdvisor.setRating(rating);
        legalAdvisor.setStatus(status);

        String msg = legalAdvisorService.registerLegalAdvisor(legalAdvisor);

        ModelAndView mv = new ModelAndView("regsuccess");
        mv.addObject("message", msg);
        return mv;
    }

    @GetMapping("legaladvisorlogin")
    public ModelAndView legalAdvisorLogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("legaladvisorlogin");
        return mv;
    }

    @PostMapping("checklegaladvisorlogin")
    public ModelAndView checkLegalAdvisorLogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        LegalAdvisor legalAdvisor = legalAdvisorService.checkLegalAdvisorLogin(email, password);

        if (legalAdvisor != null) {
            HttpSession session = request.getSession();
            session.setAttribute("legalAdvisor", legalAdvisor);
            mv.setViewName("legaladvisorhome");
        } else {
            mv.setViewName("legaladvisorlogin");
            mv.addObject("message", "Login Failed");
        }
        return mv;
    }

    @GetMapping("legaladvisorhome")
    public ModelAndView legalAdvisorHome() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("legaladvisorhome");
        return mv;
    }

    @GetMapping("legaladvisorprofile")
    public ModelAndView legalAdvisorProfile(HttpServletRequest request) {
        HttpSession session = request.getSession();
        LegalAdvisor legalAdvisor = (LegalAdvisor) session.getAttribute("legalAdvisor");

        ModelAndView mv = new ModelAndView();
        if (legalAdvisor != null) {
            mv.setViewName("legaladvisorprofile");
            mv.addObject("legalAdvisor", legalAdvisor);
        } else {
            mv.setViewName("legaladvisorlogin");
            mv.addObject("message", "Please login first.");
        }
        return mv;
    }

    @PostMapping("updatelegaladvisorprofile")
    public ModelAndView updateLegalAdvisorProfile(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String dateOfBirth = request.getParameter("dateOfBirth");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String aadhaarNumber = request.getParameter("aadhaarNumber");
            String barRegistrationNumber = request.getParameter("barRegistrationNumber");
            String specialization = request.getParameter("specialization");
            int experience = Integer.parseInt(request.getParameter("experience"));
            double rating = Double.parseDouble(request.getParameter("rating"));

            String bio = request.getParameter("lbio");
            double earnings = Double.parseDouble(request.getParameter("learnings"));


            LegalAdvisor legalAdvisor = new LegalAdvisor();
            legalAdvisor.setUsername(username);
            legalAdvisor.setPassword(password);
            legalAdvisor.setEmail(email);
            legalAdvisor.setPhone(phone);
            legalAdvisor.setDateOfBirth(dateOfBirth);
            legalAdvisor.setGender(gender);
            legalAdvisor.setAddress(address);
            legalAdvisor.setAadhaarNumber(aadhaarNumber);
            legalAdvisor.setBarRegistrationNumber(barRegistrationNumber);
            legalAdvisor.setSpecialization(specialization);
            legalAdvisor.setExperience(experience);
            legalAdvisor.setRating(rating);
            legalAdvisor.setBio(bio);
            legalAdvisor.setEarnings(earnings);

            String msg = legalAdvisorService.updateLegalAdvisorProfile(legalAdvisor);

            mv.setViewName("updatesuccess");
            mv.addObject("message", msg);
        } catch (Exception e) {
            mv.setViewName("updateerror");
            mv.addObject("message", e.getMessage());
        }
        return mv;
    }

    @GetMapping("legaladvisorlogout")
    public ModelAndView legalAdvisorLogout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("legalAdvisor");
        session.invalidate();

        ModelAndView mv = new ModelAndView();
        mv.setViewName("legaladvisorlogin");
        return mv;
    }

    @GetMapping("legaladvisor sessionexpiry")
    public ModelAndView legalAdvisorSessionExpiry() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("legaladvisorsessionexpiry");
        return mv;
    }
}

