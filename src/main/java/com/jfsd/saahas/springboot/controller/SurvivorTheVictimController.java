package com.jfsd.saahas.springboot.controller;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jfsd.saahas.springboot.model.Article;
import com.jfsd.saahas.springboot.model.Counselor;
import com.jfsd.saahas.springboot.model.Session;
import com.jfsd.saahas.springboot.model.SurvivorTheVictim;
import com.jfsd.saahas.springboot.service.AdminService;
import com.jfsd.saahas.springboot.service.ArticleService;
import com.jfsd.saahas.springboot.service.SessionService;
import com.jfsd.saahas.springboot.service.SurvivorTheVictimService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class SurvivorTheVictimController {

    @Autowired
    private SurvivorTheVictimService survivorTheVictimService;


    @Autowired
    private SessionService sessionService;
    
    @Autowired
    private ArticleService articleService;
    
    
    @Autowired
    private AdminService adminService;
    
    
    @GetMapping("survivorreg")
    public ModelAndView survivorReg() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("survivor/survivorreg");
        return mv;
    }

    @PostMapping("insertSurvivor")
    public ModelAndView insertSurvivor(HttpServletRequest request, 
                                       @RequestParam("profileImage") MultipartFile profileImage) throws Exception {
        String msg = null;
        ModelAndView mv = new ModelAndView();
        
        try {
            // Collect all the survivor data from the form
            String username = request.getParameter("susername");
            String password = request.getParameter("spwd");
            String email = request.getParameter("semail");
            String phone = request.getParameter("sphone");
            String dateOfBirth = request.getParameter("sdob");
            String gender = request.getParameter("sgender");
            String address = request.getParameter("saddress");
            String aadhaarNumber = request.getParameter("saadhaar");
            
           
            Blob profileImageBlob = null;

            if (profileImage != null && !profileImage.isEmpty()) {
                byte[] profileImageBytes = profileImage.getBytes();
                profileImageBlob = new javax.sql.rowset.serial.SerialBlob(profileImageBytes);
            }
            
            
            SurvivorTheVictim survivor = new SurvivorTheVictim();
            survivor.setUsername(username);
            survivor.setPassword(password);
            survivor.setEmail(email);
            survivor.setPhone(phone);
            survivor.setDateOfBirth(dateOfBirth);
            survivor.setGender(gender);
            survivor.setAddress(address);
            survivor.setAadhaarNumber(aadhaarNumber);

          
            survivor.setImage(profileImageBlob); 

            
            msg = survivorTheVictimService.registerSurvivor(survivor);

            mv.setViewName("redirect:survivorlogin");
            mv.addObject("message", msg); 
        } catch (Exception e) {
            msg = e.getMessage();
            System.out.println(msg);
            mv.setViewName("error"); 
            mv.addObject("message", msg); 
        }

        return mv;
    }
    
    
    
    
    @GetMapping("survivorlogin")
    public ModelAndView survivorLogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("survivor/survivorlogin");
        return mv;
    }

    @PostMapping("checksurvivorlogin")
    public ModelAndView checkSurvivorLogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String email = request.getParameter("semail");
        String password = request.getParameter("spwd");

        SurvivorTheVictim survivor = survivorTheVictimService.loginSurvivor(email, password);

        if (survivor != null) {
            HttpSession session = request.getSession();
            session.setAttribute("survivor", survivor);
            mv.setViewName("survivor/survivorhome");
        } else {
            mv.setViewName("survivor/survivorlogin");
            mv.addObject("message", "Login Failed");
        }
        return mv;
    }

    @GetMapping("survivorhome")
    public ModelAndView survivorHome() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("survivor/survivorhome");
        return mv;
    }

    @GetMapping("survivorprofile")
    public ModelAndView survivorProfile(HttpServletRequest request) {
        HttpSession session = request.getSession();
        SurvivorTheVictim survivor = (SurvivorTheVictim) session.getAttribute("survivor");

        ModelAndView mv = new ModelAndView();
        if (survivor != null) {
            mv.setViewName("survivor/survivorprofile");
            mv.addObject("survivor", survivor);
        } else {
            mv.setViewName("survivor/survivorlogin");
            mv.addObject("message", "Please login first.");
        }
        return mv;
    }

    @PostMapping("updatesurvivorprofile")
    public ModelAndView updateSurvivorProfile(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        try {
            int id = Integer.parseInt(request.getParameter("sid"));
            String username = request.getParameter("susername");
            String password = request.getParameter("spwd");
            String email = request.getParameter("semail");
            String phone = request.getParameter("sphone");
            String dateOfBirth = request.getParameter("sdob");
            String gender = request.getParameter("sgender");
            String address = request.getParameter("saddress");
            String aadhaarNumber = request.getParameter("saadhaar");

            SurvivorTheVictim survivor = new SurvivorTheVictim();
            survivor.setId(id);
            survivor.setUsername(username);
            survivor.setPassword(password);
            survivor.setEmail(email);
            survivor.setPhone(phone);
            survivor.setDateOfBirth(dateOfBirth);
            survivor.setGender(gender);
            survivor.setAddress(address);
            survivor.setAadhaarNumber(aadhaarNumber);

            String msg = survivorTheVictimService.updateSurvivorTheVictimProfile(survivor);

            mv.setViewName("survivor/updatesuccess");
            mv.addObject("message", msg);
        } catch (Exception e) {
            mv.setViewName("survivor/updateerror");
            mv.addObject("message", e.getMessage());
        }
        return mv;
    }

    @GetMapping("survivorlogout")
    public ModelAndView survivorLogout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("survivor");
        session.invalidate();

        ModelAndView mv = new ModelAndView();
        mv.setViewName("survivor/survivorlogin");
        return mv;
    }

    @GetMapping("survivorsessionexpiry")
    public ModelAndView survivorSessionExpiry() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("survivorsessionexpiry");
        return mv;
    }
    
    
    @GetMapping("/allArticles")
    public ModelAndView viewAllArticles() {
        ModelAndView mv = new ModelAndView("survivor/allArticles");  
        
        List<Article> articles = articleService.getAllArticles();
        
        mv.addObject("articles", articles);  
        
        return mv;
    }

    
    
    @GetMapping("/allSessions")
    public ModelAndView viewAllSessions(HttpServletRequest request) {
        HttpSession session = request.getSession();
        SurvivorTheVictim survivor = (SurvivorTheVictim) session.getAttribute("survivor");

        ModelAndView mv = new ModelAndView();
        if (survivor == null) {
            mv.setViewName("survivor/survivorlogin");
            mv.addObject("message", "Please log in first.");
            return mv;
        }

        List<Session> sessions = sessionService.getAllSessions();
        mv.setViewName("survivor/allSessions");
        mv.addObject("sessions", sessions);
        return mv;
    }


    


    @PostMapping("/registerSurvivorForSession")
    public ModelAndView registerSurvivor(HttpServletRequest request, 
                                         @RequestParam("sessionId") int sessionId,
                                         @RequestParam("survivorTheVictimId") int survivorTheVictimId,
                                         @RequestParam("survivorTheVictimName") String survivorTheVictimName,
                                         @RequestParam("survivorTheVictimPassword") String survivorTheVictimPassword) {

        HttpSession session = request.getSession();
        Object counselor = session.getAttribute("survivor");

        ModelAndView mv = new ModelAndView();
        if (counselor == null) {
            mv.setViewName("survivor/survivorlogin");
            mv.addObject("message", "Please log in first.");
            return mv;
        }

        try {
            Session selectedSession = sessionService.findSessionById(sessionId);
            if (selectedSession == null) {
                mv.setViewName("error");
                mv.addObject("message", "Session not found.");
                return mv;
            }

            selectedSession.setSurvivorTheVictimId(survivorTheVictimId);
            selectedSession.setSurvivorTheVictimName(survivorTheVictimName);
            selectedSession.setSurvivorTheVictimPassword(survivorTheVictimPassword);
            selectedSession.setSurvivorTheVictimStatus("Registered");

            sessionService.updateSession(selectedSession);

            mv.setViewName("survivor/registrationSuccess");
            mv.addObject("message", "You have successfully registered for the session.");
        } catch (Exception e) {
            mv.setViewName("error");
            mv.addObject("message", "Error while registering for the session: " + e.getMessage());
        }
        return mv;
    }

    
//    
//    @PostMapping("/loginSurvivorToSession")
//    public ModelAndView survivorLoginForSession(HttpServletRequest request, 
//                                                 @RequestParam("sessionId") int sessionId,
//                                                 @RequestParam("survivorName") String survivorName,
//                                                 @RequestParam("survivorPassword") String survivorPassword) {
//
//        HttpSession session = request.getSession();
//        ModelAndView mv = new ModelAndView();
//
//        // Find the session by ID
//        Session sessionObj = sessionService.findSessionById(sessionId);
//        if (sessionObj == null) {
//            mv.setViewName("error");
//            mv.addObject("message", "Session not found.");
//            return mv;
//        }
//
//        // Check if the survivor's credentials are correct
//        if (sessionObj.getSurvivorTheVictimName().equals(survivorName) && 
//            sessionObj.getSurvivorTheVictimPassword().equals(survivorPassword)) {
//            session.setAttribute("survivor", survivorName);  // Store the survivor's information in session
//            mv.setViewName("survivor/sessionDashboard");  // Redirect to survivor's session dashboard
//            mv.addObject("session", sessionObj);
//            return mv;
//        } else {
//            mv.setViewName("survivor/survivorLogin");  // Redirect to login page if credentials are incorrect
//            mv.addObject("message", "Invalid credentials.");
//            return mv;
//        }
//    }
//
//    
    
    
//    @GetMapping("/survivor/mySessions")
//    public ModelAndView viewMySessions(HttpServletRequest request) {
//        HttpSession session = request.getSession();
//        SurvivorTheVictim survivor = (SurvivorTheVictim) session.getAttribute("survivor");
//
//        ModelAndView mv = new ModelAndView();
//        if (survivor == null) {
//            mv.setViewName("survivor/survivorLogin");
//            mv.addObject("message", "Please log in first.");
//            return mv;
//        }
//
//        List<Session> sessions = sessionService.getSessionsBySurvivorId(survivor.getId());
//        mv.setViewName("survivor/mySessions");
//        mv.addObject("sessions", sessions);
//        return mv;
//    }
    
    @GetMapping("/mySessions")
    public ModelAndView viewMySessions(HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        SurvivorTheVictim survivor = (SurvivorTheVictim) httpSession.getAttribute("survivor");

        ModelAndView mv = new ModelAndView();
        if (survivor == null) {
            mv.setViewName("survivor/survivorlogin");
            mv.addObject("message", "Please log in first.");
            return mv;
        }

        try {
            List<Session> sessions = sessionService.getSessionsBySurvivorId(survivor.getId());
            mv.setViewName("survivor/mySessions");
            mv.addObject("sessions", sessions);
        } catch (Exception e) {
            mv.setViewName("survivor/error");
            mv.addObject("message", "Error while retrieving sessions: " + e.getMessage());
        }

        return mv;
    }


    
    
    
    @PostMapping("/loginSurvivorToSession")
    public ModelAndView loginSurvivorToSession(HttpServletRequest request, 
                                               @RequestParam("sessionId") int sessionId,
                                               @RequestParam("password") String password) {
        HttpSession session = request.getSession();
        SurvivorTheVictim survivor = (SurvivorTheVictim) session.getAttribute("survivor");

        ModelAndView mv = new ModelAndView();
        if (survivor == null) {
            mv.setViewName("survivor/survivorLogin");
            mv.addObject("message", "Please log in first.");
            return mv;
        }

        Session sessionDetails = sessionService.findSessionById(sessionId);
        if (sessionDetails == null || !sessionDetails.getSurvivorTheVictimPassword().equals(password)) {
            mv.setViewName("error");
            mv.addObject("message", "Invalid session or password.");
            return mv;
        }

        mv.setViewName("survivor/sessionDashboard");
        mv.addObject("session", sessionDetails);
        return mv;
    }

    
    
    @GetMapping("/survivor/profileImage")
    public ResponseEntity<byte[]> getProfileImage(@RequestParam("id") int cid) throws Exception {


        SurvivorTheVictim survivorTheVictim = adminService.getSurvivorById(cid);

            byte[] imageBytes = survivorTheVictim.getImage().getBytes(1, (int) survivorTheVictim.getImage().length());


            
            return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);

    }

    
    @GetMapping("/searchSessions")
    public ModelAndView searchSessions(@RequestParam("query") String query) {
        ModelAndView mv = new ModelAndView("survivor/availableSessions");

        try {
            List<Session> filteredSessions = sessionService.searchSessionsByTitleOrContext(query);
            mv.addObject("sessions", filteredSessions);
        } catch (Exception e) {
            mv.addObject("message", "Error while searching sessions: " + e.getMessage());
        }

        return mv;
    }
    
    @GetMapping("/survivor/sessionDetail")
    public ModelAndView viewSessionDetail(@RequestParam("id") int sessionId) {
        ModelAndView mv = new ModelAndView("survivor/sessionDetail");
        Session session = sessionService.findSessionById(sessionId);
        if (session != null) {
            mv.addObject("session", session);
        } else {
            mv.addObject("message", "Session not found.");
        }
        return mv;
    }
    @GetMapping("/survivor/sessionDashboard")
    public ModelAndView viewSurvivorSessionDashboard(HttpServletRequest request, @RequestParam("sessionId") int sessionId) {
        // Initialize the ModelAndView with the view name for survivor's session dashboard
        ModelAndView mv = new ModelAndView("survivor/sessionDashboard");

        // Get the HttpSession and retrieve the Survivor object from the session
        HttpSession httpSession = request.getSession();
        SurvivorTheVictim survivor = (SurvivorTheVictim) httpSession.getAttribute("survivor");

        // Check if the survivor is logged in
        if (survivor != null) {
            // Fetch session details by sessionId
            Session sessionDetails = sessionService.findSessionById(sessionId);
            
            // If the session exists, add session details to the model
            if (sessionDetails != null) {
                // Check if the survivor is enrolled and their status is ACCEPTED
                if ("ACCEPTED".equals(sessionDetails.getSurvivorTheVictimStatus())) {
                    mv.addObject("session", sessionDetails);
                } else {
                    mv.addObject("message", "You are not enrolled in this session or your enrollment status is not accepted.");
                }
            } else {
                mv.addObject("message", "Session not found.");
            }
        } else {
            // If the survivor is not logged in, redirect to the login page with a message
            mv.setViewName("survivor/survivorLogin");
            mv.addObject("message", "Please log in first.");
        }

        return mv;
    }


    
}
