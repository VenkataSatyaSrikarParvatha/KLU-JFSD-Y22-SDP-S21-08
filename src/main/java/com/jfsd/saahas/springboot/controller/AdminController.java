package com.jfsd.saahas.springboot.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jfsd.saahas.springboot.model.Admin;
import com.jfsd.saahas.springboot.model.AdminTeam;
import com.jfsd.saahas.springboot.model.Counselor;
import com.jfsd.saahas.springboot.model.Doctor;
import com.jfsd.saahas.springboot.model.LegalAdvisor;
import com.jfsd.saahas.springboot.model.SurvivorTheVictim;
import com.jfsd.saahas.springboot.service.AdminService;
import com.jfsd.saahas.springboot.service.ArticleService;
import com.jfsd.saahas.springboot.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;
    
    @Autowired
    private ArticleService articleService;
    
    @Autowired
    private SessionService sessionService;

    @GetMapping("adminlogin")
    public ModelAndView adminLogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/admin_adminlogin");
        return mv;
    }

    @PostMapping("checkadminlogin")
    public ModelAndView checkAdminLogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String auname = request.getParameter("auname");
        String apwd = request.getParameter("apwd");

        Admin admin = adminService.checkAdminLogin(auname, apwd); 
        if (admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin); 
            mv.setViewName("admin/admin_adminhome"); 
            
            
            long counselorCount = adminService.counselorCount();
            mv.addObject("counselorCount", counselorCount);

            long doctorCount = adminService.doctorCount();
            mv.addObject("doctorCount", doctorCount);

            long legalAdvisorCount = adminService.legalAdvisorCount();
            mv.addObject("legalAdvisorCount", legalAdvisorCount);

            long survivorTheVictimCount = adminService.survivorTheVictimCount();
            mv.addObject("survivorTheVictimCount", survivorTheVictimCount);

            long adminTeamCount = adminService.adminTeamCount();
            mv.addObject("adminTeamCount", adminTeamCount);


            
        } else {
            mv.setViewName("admin/admin_adminloginfail"); 
            mv.addObject("message", "Login Failed. Invalid username or password.");
        }
        return mv;
    }


    
    
    
    @GetMapping("adminhome")
    public ModelAndView adminHome() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/admin_adminhome");

        
        
        
        long counselorCount = adminService.counselorCount();
        mv.addObject("counselorCount", counselorCount);

        long doctorCount = adminService.doctorCount();
        mv.addObject("doctorCount", doctorCount);

        long legalAdvisorCount = adminService.legalAdvisorCount();
        mv.addObject("legalAdvisorCount", legalAdvisorCount);

        long survivorTheVictimCount = adminService.survivorTheVictimCount();
        mv.addObject("survivorTheVictimCount", survivorTheVictimCount);

        long adminTeamCount = adminService.adminTeamCount();
        mv.addObject("adminTeamCount", adminTeamCount);

        return mv;
    }
    
    
    

    

    @GetMapping("adminlogout")
    public ModelAndView adminLogout() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/admin_adminlogin");
        return mv;
    }

    
    
    @GetMapping("viewallcounselors")
    public ModelAndView viewAllCounselors() {
        ModelAndView mv = new ModelAndView();
        List<Counselor> counselors = adminService.viewAllCounselors();
        
        // Initialize counters for each status
        long acceptedCount = counselors.stream().filter(c -> c.getStatus().equals("Accepted")).count();
        long rejectedCount = counselors.stream().filter(c -> c.getStatus().equals("Rejected")).count();
        long registeredCount = counselors.stream().filter(c -> c.getStatus().equals("Registered")).count();
        
        // Find the most active counselor
        Counselor mostActiveCounselor = null;
        int maxSessionsByCounselor = 0;
        for (Counselor counselor : counselors) {
            int sessionCount = sessionService.getSessionsByCounselorId(counselor.getId()).size();
            if (sessionCount > maxSessionsByCounselor) {
                maxSessionsByCounselor = sessionCount;
                mostActiveCounselor = counselor;
            }
        }

        // Set the view name and pass data to the JSP
        mv.setViewName("admin/viewallcounselors");
        mv.addObject("counselors", counselors);
        mv.addObject("acceptedCount", acceptedCount);
        mv.addObject("rejectedCount", rejectedCount);
        mv.addObject("registeredCount", registeredCount);
        mv.addObject("mostActiveCounselor", mostActiveCounselor);
        mv.addObject("mostActiveCounselorSessionCount", maxSessionsByCounselor);
        
        return mv;
    }

    @GetMapping("viewalldoctors")
    public ModelAndView viewAllDoctors() {
        ModelAndView mv = new ModelAndView();
        List<Doctor> doctors = adminService.viewAllDoctors(); // Fetch list of doctors from the service
        
        // Count the doctors by their status
        long acceptedCount = doctors.stream().filter(doctor -> "Accepted".equals(doctor.getStatus())).count();
        long registeredCount = doctors.stream().filter(doctor -> "Registered".equals(doctor.getStatus())).count();
        long rejectedCount = doctors.stream().filter(doctor -> "Rejected".equals(doctor.getStatus())).count();
        
        mv.setViewName("admin/viewalldoctors");
        mv.addObject("doctors", doctors);
        mv.addObject("acceptedCount", acceptedCount);
        mv.addObject("registeredCount", registeredCount);
        mv.addObject("rejectedCount", rejectedCount);
        
        return mv;
    }

    @GetMapping("viewalllegaladvisors")
    public ModelAndView viewAllLegalAdvisors() {
        ModelAndView mv = new ModelAndView();
        List<LegalAdvisor> legalAdvisors = adminService.viewAllLegalAdvisors();
        mv.setViewName("admin/viewalllegaladvisors");
        mv.addObject("legalAdvisors", legalAdvisors);
        return mv;
    }

    @GetMapping("viewallsurvivors")
    public ModelAndView viewAllSurvivors() {
        ModelAndView mv = new ModelAndView();
        List<SurvivorTheVictim> survivors = adminService.viewAllSurvivors();
        mv.setViewName("admin/viewallsurvivors");
        mv.addObject("survivors", survivors);
        return mv;
    }

    @GetMapping("viewalladminteam")
    public ModelAndView viewAllAdminTeam() {
        ModelAndView mv = new ModelAndView();
        List<AdminTeam> adminTeam = adminService.viewAllAdminTeam();
        mv.setViewName("admin/viewalladminteam");
        mv.addObject("adminTeam", adminTeam);
        return mv;
    }
    
    
    
    
    
    

    @GetMapping("deletecounselor")
    public ModelAndView deleteCounselor() {
        ModelAndView mv = new ModelAndView();
        List<Counselor> counselors = adminService.viewAllCounselors();
        mv.setViewName("deletecounselor");
        mv.addObject("counselors", counselors);
        return mv;
    }

    @GetMapping("deletecounseloraction")
    public String deleteCounselorAction(@RequestParam("id") int cid) {
        adminService.deleteCounselor(cid);
        return "redirect:/deletecounselor";
    }

    @GetMapping("deletedoctor")
    public ModelAndView deleteDoctor() {
        ModelAndView mv = new ModelAndView();
        List<Doctor> doctors = adminService.viewAllDoctors();
        mv.setViewName("admin/deletedoctor");
        mv.addObject("doctors", doctors);
        return mv;
    }

    @GetMapping("deletedoctoraction")
    public String deleteDoctorAction(@RequestParam("id") int did) {
        adminService.deleteDoctor(did);
        return "redirect:/deletedoctor";
    }

    @GetMapping("deletelegaladvisor")
    public ModelAndView deleteLegalAdvisor() {
        ModelAndView mv = new ModelAndView();
        List<LegalAdvisor> legalAdvisors = adminService.viewAllLegalAdvisors();
        mv.setViewName("admin/deletelegaladvisor");
        mv.addObject("legalAdvisors", legalAdvisors);
        return mv;
    }

    @GetMapping("deletelegaladvisoraction")
    public String deleteLegalAdvisorAction(@RequestParam("id") int lid) {
        adminService.deleteLegalAdvisor(lid);
        return "redirect:/deletelegaladvisor";
    }

    
    
    @GetMapping("deletesurvivor")
    public ModelAndView deleteSurvivor() {
        ModelAndView mv = new ModelAndView();
        List<SurvivorTheVictim> survivors = adminService.viewAllSurvivors();
        mv.setViewName("admin/deletesurvivor");
        mv.addObject("survivors", survivors);
        return mv;
    }
    
    

    @GetMapping("deletesurvivoraction")
    public String deleteSurvivorAction(@RequestParam("id") int sid) {
        adminService.deleteSurvivor(sid);
        return "redirect:/deletesurvivor";
    }

    @GetMapping("deleteadminteam")
    public ModelAndView deleteAdminTeam() {
        ModelAndView mv = new ModelAndView();
        List<AdminTeam> adminTeam = adminService.viewAllAdminTeam();
        mv.setViewName("admin/deleteadminteam");
        mv.addObject("adminTeam", adminTeam);
        return mv;
    }

    @GetMapping("deleteadmintemaction")
    public String deleteAdminTeamAction(@RequestParam("id") int aid) {
        adminService.deleteAdminTeam(aid);
        return "redirect:/deleteadmintem";
    }
    
    
    
    
    
    
    

    @GetMapping("updatecounselorstatus")
    public ModelAndView updateCounselorStatus() {
        ModelAndView mv = new ModelAndView();
        List<Counselor> counselors = adminService.viewAllCounselors();
        mv.setViewName("admin/updatecounselorstatus");
        mv.addObject("counselors", counselors);
        return mv;
    }

    @GetMapping("updatecounselorstatusaction")
    public String updateCounselorStatusAction(@RequestParam("id") int cid, @RequestParam("status") String cstatus) {
        adminService.updateCounselorStatus(cstatus, cid);
        return "redirect:/updatecounselorstatus";
    }

    @GetMapping("updatedoctorstatus")
    public ModelAndView updateDoctorStatus() {
        ModelAndView mv = new ModelAndView();
        List<Doctor> doctors = adminService.viewAllDoctors();
        mv.setViewName("admin/viewalldoctors");
        mv.addObject("doctors", doctors);
        return mv;
    }

    @GetMapping("updatedoctorstatusaction")
    public String updateDoctorStatusAction(@RequestParam("id") int did, @RequestParam("status") String dstatus) {
        adminService.updateDoctorStatus(dstatus, did);
        return "redirect:/updatedoctorstatus";
    }

    @GetMapping("updatelegaladvisorstatus")
    public ModelAndView updateLegalAdvisorStatus() {
        ModelAndView mv = new ModelAndView();
        List<LegalAdvisor> legalAdvisors = adminService.viewAllLegalAdvisors();
        mv.setViewName("admin/viewalllegaladvisor");
        mv.addObject("legalAdvisors", legalAdvisors);
        return mv;
    }

    @GetMapping("updatelegaladvisorstatusaction")
    public String updateLegalAdvisorStatusAction(@RequestParam("id") int lid, @RequestParam("status") String lstatus) {
        adminService.updateLegalAdvisorStatus(lstatus, lid);
        return "redirect:/updatelegaladvisorstatus";
    }

    @GetMapping("updateadmintemstatus")
    public ModelAndView updateAdminTeamStatus() {
        ModelAndView mv = new ModelAndView();
        List<AdminTeam> adminTeam = adminService.viewAllAdminTeam();
        mv.setViewName("admin/viewalladmintem");
        mv.addObject("adminTeam", adminTeam);
        return mv;
    }

    @GetMapping("updateadmintemstatusaction")
    public String updateAdminTeamStatusAction(@RequestParam("id") int aid, @RequestParam("status") String astatus) {
        adminService.updateAdminTeamStatus(astatus, aid);
        return "redirect:/updateadmintemstatus";
    }


    
    
    @PostMapping("/confirmDeleteCounselor")
    public ModelAndView confirmDeleteCounselor(@RequestParam("id") int cid) {
        ModelAndView mv = new ModelAndView("admin/confirmDeleteCounselor");
        mv.addObject("id", cid);
        return mv;
    }

    @PostMapping("/confirmDeleteDoctor")
    public ModelAndView confirmDeleteDoctor(@RequestParam("id") int did) {
        ModelAndView mv = new ModelAndView("admin/confirmDeleteDoctor");
        mv.addObject("id", did);
        return mv;
    }

    @PostMapping("/confirmDeleteLegalAdvisor")
    public ModelAndView confirmDeleteLegalAdvisor(@RequestParam("id") int lid) {
        ModelAndView mv = new ModelAndView("admin/confirmDeleteLegalAdvisor");
        mv.addObject("id", lid);
        return mv;
    }

    @PostMapping("/confirmDeleteSurvivor")
    public ModelAndView confirmDeleteSurvivor(@RequestParam("id") int sid) {
        ModelAndView mv = new ModelAndView("admin/confirmDeleteSurvivor");
        mv.addObject("id", sid);
        return mv;
    }

    @PostMapping("/confirmDeleteAdminTeam")
    public ModelAndView confirmDeleteAdminTeam(@RequestParam("id") int aid) {
        ModelAndView mv = new ModelAndView("admin/confirmDeleteAdminTeam");
        mv.addObject("id", aid);
        return mv;
    }


    
    
    @PostMapping("deleteCounselor")
    public String deleteCounselor(@RequestParam("id") int cid) {
        adminService.deleteCounselor(cid);
        return "redirect:/viewallcounselors"; 
    }

    @PostMapping("deleteDoctor")
    public String deleteDoctor(@RequestParam("id") int did) {
        adminService.deleteDoctor(did);
        return "redirect:/viewalldoctors"; 
    }

    @PostMapping("deleteLegalAdvisor")
    public String deleteLegalAdvisor(@RequestParam("id") int lid) {
        adminService.deleteLegalAdvisor(lid);
        return "redirect:/viewalllegaladvisors"; 
    }

    @PostMapping("deleteSurvivor")
    public String deleteSurvivor(@RequestParam("id") int sid) {
        adminService.deleteSurvivor(sid);
        return "redirect:/viewallsurvivors"; 
    }

    @PostMapping("deleteAdminTeam")
    public String deleteAdminTeam(@RequestParam("id") int aid) {
        adminService.deleteAdminTeam(aid);
        return "redirect:/viewalladminteam"; 
    }

    @PostMapping("updateCounselorStatus")
    public String updateCounselorStatus(@RequestParam("id") int cid, @RequestParam("status") String cstatus) {
        adminService.updateCounselorStatus(cstatus, cid);
        return "redirect:/viewallcounselors"; 
    }

    @PostMapping("updateDoctorStatus")
    public String updateDoctorStatus(@RequestParam("id") int did, @RequestParam("status") String dstatus) {
        adminService.updateDoctorStatus(dstatus, did);
        return "redirect:/updatedoctorstatus"; 
    }

    @PostMapping("updateLegalAdvisorStatus")
    public String updateLegalAdvisorStatus(@RequestParam("id") int lid, @RequestParam("status") String lstatus) {
        adminService.updateLegalAdvisorStatus(lstatus, lid);
        return "redirect:/updatelegaladvisorstatus"; 
    }

    @PostMapping("updateAdminTeamStatus")
    public String updateAdminTeamStatus(@RequestParam("id") int aid, @RequestParam("status") String astatus) {
        adminService.updateAdminTeamStatus(astatus, aid);
        return "redirect:/viewalladminteam"; 
    }


    
    
    @GetMapping("viewCounselorDetails")
    public ModelAndView viewCounselorDetails(@RequestParam("id") int counselorId) {
        ModelAndView mv = new ModelAndView();
        Counselor counselor = adminService.getCounselorById(counselorId);

        
        if (counselor != null) {
            mv.setViewName("admin/viewCounselorDetails");
            mv.addObject("counselor", counselor); 

        } else {
            mv.setViewName("admin/admin_error");
            mv.addObject("message", "Counselor not found.");
        }
        return mv;
    }


    
    @GetMapping("viewDoctorDetails")
    public ModelAndView viewDoctorDetails(@RequestParam("id") int doctorId) {
        ModelAndView mv = new ModelAndView();
        Doctor doctor = adminService.getDoctorById(doctorId);

        if (doctor != null) {
            mv.setViewName("admin/viewDoctorDetails");
            mv.addObject("doctor", doctor);

        } else {
            mv.setViewName("admin/admin_error");
            mv.addObject("message", "Doctor not found.");
        }
        return mv;
    }

    
    @GetMapping("viewSurvivorDetails")
    public ModelAndView viewSurvivorDetails(@RequestParam("id") int survivorId) {
        ModelAndView mv = new ModelAndView();
        SurvivorTheVictim survivor = adminService.getSurvivorById(survivorId); 

        
        
        if (survivor != null) {
            mv.setViewName("admin/viewSurvivorDetails");
            mv.addObject("survivor", survivor); 

            
            
        } else {
            mv.setViewName("admin/admin_error");
            mv.addObject("message", "Survivor not found.");
        }
        return mv;
    }

    
    
    @GetMapping("viewLegalAdvisorDetails")
    public ModelAndView viewLegalAdvisorDetails(@RequestParam("id") int legalAdvisorId) {
        ModelAndView mv = new ModelAndView();
        LegalAdvisor legalAdvisor = adminService.getLegalAdvisorById(legalAdvisorId);

        if (legalAdvisor != null) {
            mv.setViewName("admin/viewLegalAdvisorDetails");
            mv.addObject("legalAdvisor", legalAdvisor);

        } else {
            mv.setViewName("admin/admin_error");
            mv.addObject("message", "Legal Advisor not found.");
        }
        return mv;
    }

    
    
    


    
    
    @GetMapping("viewAdminTeamDetails")
    public ModelAndView viewAdminTeamDetails(@RequestParam("id") int adminTeamId) {
        ModelAndView mv = new ModelAndView();
        AdminTeam adminTeam = adminService.getAdminTeamById(adminTeamId);

        if (adminTeam != null) {
            mv.setViewName("admin/viewAdminTeamDetails");
            mv.addObject("adminTeam", adminTeam);

        } else {
            mv.setViewName("admin/admin_error");
            mv.addObject("message", "Admin Team member not found.");
        }
        return mv;
    }
    


    @GetMapping("/counselor/profileImage")
    public ResponseEntity<byte[]> getProfileImage(@RequestParam("id") int cid) throws Exception {


        Counselor counselor = adminService.getCounselorById(cid); 

            byte[] imageBytes = counselor.getProfileImage().getBytes(1, (int) counselor.getProfileImage().length());


            
            return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);

    }
    
    
    

    
    
    
    @GetMapping("addAdminTeam")
    public String showAddAdminTeamForm(Model model) {
        model.addAttribute("adminTeam", new AdminTeam()); 

        return "admin/addAdminTeam";  

    }
    


    @PostMapping("/insertAdminTeam")
    public ModelAndView insertAdminTeam(@ModelAttribute("adminTeam") AdminTeam adminTeam) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/adminTeamSuccess");  


        String message = adminService.addAdminTeam(adminTeam); 

        mv.addObject("message", message);  

        return mv;
    }



    @GetMapping("/mostActiveEntities")
    public ModelAndView viewMostActiveEntities() {
        ModelAndView mv = new ModelAndView("admin/mostActiveEntities");

        // Fetch all counselors and survivors
        List<Counselor> allCounselors = adminService.viewAllCounselors();
        List<SurvivorTheVictim> allSurvivors = adminService.viewAllSurvivors();

        // Find the most active counselor (the one with the most sessions)
        Counselor mostActiveCounselor = null;
        int maxSessionsByCounselor = 0;

        for (Counselor counselor : allCounselors) {
            int sessionCount = sessionService.getSessionsByCounselorId(counselor.getId()).size();
            if (sessionCount > maxSessionsByCounselor) {
                maxSessionsByCounselor = sessionCount;
                mostActiveCounselor = counselor;
            }
        }

        // Find the most active survivor (the one with the most attended sessions)
        SurvivorTheVictim mostActiveSurvivor = null;
        int maxSessionsBySurvivor = 0;

        for (SurvivorTheVictim survivor : allSurvivors) {
            int sessionCount = sessionService.getSessionsBySurvivorId(survivor.getId()).size();
            if (sessionCount > maxSessionsBySurvivor) {
                maxSessionsBySurvivor = sessionCount;
                mostActiveSurvivor = survivor;
            }
        }

        // Add the most active counselor and survivor to the ModelAndView
        mv.addObject("mostActiveCounselor", mostActiveCounselor);
        mv.addObject("counselorSessionCount", maxSessionsByCounselor);
        mv.addObject("mostActiveSurvivor", mostActiveSurvivor);
        mv.addObject("survivorSessionCount", maxSessionsBySurvivor);

        return mv;
    }
    
    

}
