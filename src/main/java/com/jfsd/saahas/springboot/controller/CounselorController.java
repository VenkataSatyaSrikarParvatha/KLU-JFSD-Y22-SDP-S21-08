package com.jfsd.saahas.springboot.controller;

import java.sql.Blob;
import java.time.LocalDateTime;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jfsd.saahas.springboot.model.Article;
import com.jfsd.saahas.springboot.model.Counselor;
import com.jfsd.saahas.springboot.model.Session;
import com.jfsd.saahas.springboot.model.SurvivorTheVictim;
import com.jfsd.saahas.springboot.repository.SurvivorTheVictimRepository;
import com.jfsd.saahas.springboot.service.ArticleService;
import com.jfsd.saahas.springboot.service.CounselorService;
import com.jfsd.saahas.springboot.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CounselorController {

    @Autowired
    private CounselorService counselorService;
    
    @Autowired
    private ArticleService articleService;
    
    
    @Autowired
    private SessionService sessionService;


    @GetMapping("counselorReg")
    public ModelAndView counselorReg() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("counselor/counselorReg");
        return mv;
    }

    @PostMapping("insertCounselor")
    public ModelAndView insertCounselor(HttpServletRequest request, 
                                        @RequestParam("profileImage") MultipartFile cprofileImage, 
                                        @RequestParam("verificationPdf") MultipartFile cverificationPdf) throws Exception {
        String msg = null;
        ModelAndView mv = new ModelAndView();
        
        try {
            String username = request.getParameter("cusername");
            String password = request.getParameter("cpwd");
            String email = request.getParameter("cemail");
            String phone = request.getParameter("cphone");
            String dateOfBirth = request.getParameter("cdob");
            String gender = request.getParameter("cgender");
            String address = request.getParameter("caddress");
            String aadhaarNumber = request.getParameter("caadhaar");
            String specialization = request.getParameter("cspecialization");
            int experience = Integer.parseInt(request.getParameter("cexperience"));
            String bio = request.getParameter("cbio");
            double earnings = 0.0;
            String status = "Registered"; 

            Blob profileImageBlob = null;
            Blob verificationPdfBlob = null;

            if (cprofileImage != null && !cprofileImage.isEmpty()) {
                byte[] profileImageBytes = cprofileImage.getBytes();
                profileImageBlob = new javax.sql.rowset.serial.SerialBlob(profileImageBytes);
            }

            if (cverificationPdf != null && !cverificationPdf.isEmpty()) {
                byte[] verificationPdfBytes = cverificationPdf.getBytes();
                verificationPdfBlob = new javax.sql.rowset.serial.SerialBlob(verificationPdfBytes);
            }

            Counselor counselor = new Counselor();
            counselor.setUsername(username);
            counselor.setPassword(password);
            counselor.setEmail(email);
            counselor.setPhone(phone);
            counselor.setDateOfBirth(dateOfBirth);
            counselor.setGender(gender);
            counselor.setAddress(address);
            counselor.setAadhaarNumber(aadhaarNumber);
            counselor.setSpecialization(specialization);
            counselor.setExperience(experience);
            counselor.setBio(bio);
            counselor.setEarnings(earnings);
            counselor.setStatus(status);

            counselor.setProfileImage(profileImageBlob);
            counselor.setVerificationPdf(verificationPdfBlob);

            msg = counselorService.registerCounselor(counselor); 

            mv.setViewName("counselor/regsuccess");
            mv.addObject("message", msg); 
        } catch (Exception e) {
            msg = e.getMessage();
            System.out.println(msg);
            mv.setViewName("counselor/error");
            mv.addObject("message", msg); 
        }

        return mv;
    }


    @GetMapping("counselorLogin")
    public ModelAndView counselorLogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("counselor/counselorLogin");
        return mv;
    }

    @PostMapping("checkCounselorLogin")
    public ModelAndView checkCounselorLogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String email = request.getParameter("cemail");
        String password = request.getParameter("cpwd");

        Counselor counselor = counselorService.checkCounselorLogin(email, password);

        if (counselor != null) {
            HttpSession session = request.getSession();
            session.setAttribute("counselor", counselor); 
            mv.setViewName("counselor/counselorHome"); 
        } else {
            mv.setViewName("counselor/counselorLogin");
            mv.addObject("message", "Login Failed"); 
        }
        return mv;
    }

    @GetMapping("counselorHome")
    public ModelAndView counselorHome() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("counselor/counselorHome");
        return mv;
    }

    @GetMapping("counselorProfile")
    public ModelAndView counselorProfile(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Counselor counselor = (Counselor) session.getAttribute("counselor");

        ModelAndView mv = new ModelAndView();
        if (counselor != null) {
            mv.setViewName("counselor/counselorProfile");
            mv.addObject("counselor", counselor); 
        } else {
            mv.setViewName("counselor/counselorLogin");
            mv.addObject("message", "Please login first."); 
        }
        return mv;
    }
//
//    @PostMapping("updateCounselorProfile")
//    public ModelAndView updateCounselorProfile(HttpServletRequest request, 
//                                               @RequestParam(value = "profileImage", required = false) MultipartFile profileImage, 
//                                               @RequestParam(value = "verificationPdf", required = false) MultipartFile verificationPdf) {
//        ModelAndView mv = new ModelAndView();
//        try {
//            HttpSession session = request.getSession();
//            Counselor counselorSession = (Counselor) session.getAttribute("counselor");
//            if (counselorSession == null) {
//                throw new Exception("Counselor not logged in.");
//            }
//            int id = counselorSession.getId();  
//
//            // Collect all the counselor data from the form
//            String username = request.getParameter("cusername");
//            String password = request.getParameter("cpwd");
//            String email = request.getParameter("cemail");
//            String phone = request.getParameter("cphone");
//            String dateOfBirth = request.getParameter("cdob");
//            String gender = request.getParameter("cgender");
//            String address = request.getParameter("caddress");
//            String aadhaarNumber = request.getParameter("caadhaar");
//            String specialization = request.getParameter("cspecialization");
//            int experience = Integer.parseInt(request.getParameter("cexperience"));
//            String bio = request.getParameter("cbio");
//            double earnings = Double.parseDouble(request.getParameter("cearnings"));
//
//            Counselor counselor = counselorService.displayCounselorById(id); 
//
//            counselor.setUsername(username);
//            counselor.setPassword(password);
//            counselor.setEmail(email);
//            counselor.setPhone(phone);
//            counselor.setDateOfBirth(dateOfBirth);
//            counselor.setGender(gender);
//            counselor.setAddress(address);
//            counselor.setAadhaarNumber(aadhaarNumber);
//            counselor.setSpecialization(specialization);
//            counselor.setExperience(experience);
//            counselor.setBio(bio);
//            counselor.setEarnings(earnings);
//
//            if (profileImage != null && !profileImage.isEmpty()) {
//                byte[] profileImageBytes = profileImage.getBytes();
//                Blob profileImageBlob = new javax.sql.rowset.serial.SerialBlob(profileImageBytes);
//                counselor.setProfileImage(profileImageBlob);  
//            }
//
//            if (verificationPdf != null && !verificationPdf.isEmpty()) {
//                byte[] verificationPdfBytes = verificationPdf.getBytes();
//                Blob verificationPdfBlob = new javax.sql.rowset.serial.SerialBlob(verificationPdfBytes);
//                counselor.setVerificationPdf(verificationPdfBlob);  
//            }
//
//            String msg = counselorService.updateCounselorProfile(counselor);
//
//            session.setAttribute("counselor", counselor);  
//
//            mv.setViewName("counselor/updateSuccess");
//            mv.addObject("message", msg);  
//        } catch (Exception e) {
//            mv.setViewName("updateError");
//            mv.addObject("counselor/message", e.getMessage());  
//        }
//
//        return mv;
//    }

    
    @PostMapping("updateCounselorProfile")
    public ModelAndView updateCounselorProfile(HttpServletRequest request, 
                                               @RequestParam(value = "profileImage", required = false) MultipartFile cprofileImage, 
                                               @RequestParam(value = "verificationPdf", required = false) MultipartFile cverificationPdf) {
        ModelAndView mv = new ModelAndView();
        try {

        	
        	
        	
            HttpSession session = request.getSession();
            Counselor counselorSession = (Counselor) session.getAttribute("counselor");
            if (counselorSession == null) {
                throw new Exception("Counselor not logged in.");
            }
            int id = counselorSession.getId();  

            String username = request.getParameter("cusername");
            String password = request.getParameter("cpwd");
            String email = request.getParameter("cemail");
            String phone = request.getParameter("cphone");
            String dateOfBirth = request.getParameter("cdob");
            String gender = request.getParameter("cgender");
            String address = request.getParameter("caddress");
            String aadhaarNumber = request.getParameter("caadhaar");
            String specialization = request.getParameter("cspecialization");
            int experience = Integer.parseInt(request.getParameter("cexperience"));
            String bio = request.getParameter("cbio");
            double earnings = Double.parseDouble(request.getParameter("cearnings"));

            Counselor counselor = counselorService.displayCounselorById(id);

            counselor.setUsername(username);
            counselor.setPassword(password);
            counselor.setEmail(email);
            counselor.setPhone(phone);
            counselor.setDateOfBirth(dateOfBirth);
            counselor.setGender(gender);
            counselor.setAddress(address);
            counselor.setAadhaarNumber(aadhaarNumber);
            counselor.setSpecialization(specialization);
            counselor.setExperience(experience);
            counselor.setBio(bio);
            counselor.setEarnings(earnings);

            if (cprofileImage != null && !cprofileImage.isEmpty()) {
                byte[] profileImageBytes = cprofileImage.getBytes();
                Blob profileImageBlob = new javax.sql.rowset.serial.SerialBlob(profileImageBytes);
                counselor.setProfileImage(profileImageBlob);
            }

            if (cverificationPdf != null && !cverificationPdf.isEmpty()) {
                byte[] verificationPdfBytes = cverificationPdf.getBytes();
                Blob verificationPdfBlob = new javax.sql.rowset.serial.SerialBlob(verificationPdfBytes);
                counselor.setVerificationPdf(verificationPdfBlob);
            }

            counselorService.updateCounselorProfile(counselor);

            session.setAttribute("counselor", counselor);

            mv.setViewName("redirect:/counselorProfile");
        } catch (Exception e) {
            mv.setViewName("counselor/error");
            mv.addObject("message", e.getMessage());
        }
        return mv;
    }


    @GetMapping("counselorLogout")
    public ModelAndView counselorLogout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("counselor");
        session.invalidate(); 

        ModelAndView mv = new ModelAndView();
        mv.setViewName("counselor/counselorLogin"); 
        return mv;
    }

    @GetMapping("counselorSessionExpiry")
    public ModelAndView counselorSessionExpiry() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("counselorSessionExpiry");
        return mv;
    }
    
    @GetMapping("counselorUpdateProfile")
    public ModelAndView showUpdateProfilePage(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Counselor counselor = (Counselor) session.getAttribute("counselor");
        ModelAndView mv = new ModelAndView();
        if (counselor != null) {
            mv.setViewName("counselor/updateCounselorProfile");
            mv.addObject("counselor", counselor); 
        } else {
            mv.setViewName("counselor/counselorLogin");
            mv.addObject("message", "Please log in first.");
        }
        return mv;
    }


    
    @PostMapping("/submitArticle")
    public ModelAndView submitArticle(HttpServletRequest request,
                                       @RequestParam("title") String ctitle,
                                       @RequestParam("context") String ccontext,
                                       @RequestParam("content") String ccontent,
                                       @RequestParam(value = "image", required = false) MultipartFile cimage,
                                       @RequestParam(value = "anonymous", required = false) boolean canonymous) {
        HttpSession session = request.getSession();
        Counselor counselor = (Counselor) session.getAttribute("counselor");

        ModelAndView mv = new ModelAndView();
        if (counselor == null) {
            mv.setViewName("counselor/counselorLogin");
            mv.addObject("message", "Please log in first.");
            return mv;
        }

        try {
            Article article = new Article();
            article.setTitle(ctitle);
            article.setContext(ccontext);
            article.setContent(ccontent);

            if (cimage != null && !cimage.isEmpty()) {
                
                byte[] imageBytes = cimage.getBytes();
                Blob imageBlob = new SerialBlob(imageBytes);
                article.setImage(imageBlob);
            }

            if (canonymous) {
                article.setAuthorName("Anonymous");
                article.setAuthorRole("Anonymous");
            } else {
                article.setAuthorId((int) counselor.getId());
                article.setAuthorName(counselor.getUsername());
                article.setAuthorRole("Counselor");
            }

            article.setCreatedAt(LocalDateTime.now());

            String msg = articleService.saveArticle(article);

            mv.setViewName("counselor/counselorarticlesuccess"); 
            mv.addObject("message", msg);

        } catch (Exception e) {
            mv.setViewName("counselor/error");
            mv.addObject("message", "Error while submitting the article: " + e.getMessage());
        }
        return mv;
    }
    
    @GetMapping("/addArticle")
    public String showAddArticleForm(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Object counselor = session.getAttribute("counselor"); 

        if (counselor == null) {
            return "counselor/counselorLogin"; 
        }

        model.addAttribute("article", new Article());
        return "counselor/addArticle"; 
    }
   


    
    
    @GetMapping("/addSession")
    public String showAddSessionForm(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Object counselor = session.getAttribute("counselor"); 
        
        if (counselor == null) {
            return "counselor/counselorLogin"; 

        }

        model.addAttribute("session", new Session());
        return "counselor/addSession";

    }


    @PostMapping("/submitSession")
    public ModelAndView submitSession(HttpServletRequest request,
                                      @RequestParam("title") String title,
                                      @RequestParam("context") String context) {

        HttpSession session = request.getSession();
        Object counselor = session.getAttribute("counselor");

        ModelAndView mv = new ModelAndView();
        if (counselor == null) {
            mv.setViewName("counselor/counselorLogin");
            mv.addObject("message", "Please log in first.");
            return mv;
        }

        try {
            String counselorName = ((Counselor) counselor).getUsername();
            String counselorRole = "Counselor";

            Session sessionObj = new Session();
            sessionObj.setTitle(title);
            sessionObj.setContext(context);
            sessionObj.setCounselorsId(((Counselor) counselor).getId());
            sessionObj.setCounselorPassword(((Counselor) counselor).getPassword());
            sessionObj.setCounselorName(counselorName);
            sessionObj.setCounselorRole(counselorRole);
            sessionObj.setCreatedAt(LocalDateTime.now());

            String msg = sessionService.saveSession(sessionObj);

            mv.setViewName("counselor/sessionSuccess");
            mv.addObject("message", msg);
        } catch (Exception e) {
            mv.setViewName("counselor/error");
            mv.addObject("message", "Error while submitting the session: " + e.getMessage());
        }
        return mv;
    }

  
    @GetMapping("/myArticles")
    public ModelAndView viewArticles(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("counselor/myArticles");  

        
        HttpSession session = request.getSession();
        Counselor counselor = (Counselor) session.getAttribute("counselor");  

        
        if (counselor != null) {


            List<Article> articles = articleService.getArticlesByAuthorId(counselor.getId());  

            mv.addObject("articles", articles);
        } else {
            mv.addObject("message", "No counselor found in session.");
        }
        
        return mv;
    }

    
//---------------
    
    @GetMapping("/viewCounselorSessions")
    public ModelAndView viewCounselorSessions(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Counselor counselor = (Counselor) session.getAttribute("counselor");

        ModelAndView mv = new ModelAndView();
        if (counselor == null) {
            mv.setViewName("counselor/counselorLogin");
            mv.addObject("message", "Please log in first.");
            return mv;
        }

        List<Session> counselorSessions = sessionService.getSessionsByCounselorId(counselor.getId());
        
        mv.setViewName("counselor/viewSessions");
        mv.addObject("sessions", counselorSessions);
        return mv;
    }

    
    @PostMapping("/acceptSurvivorForSession")
    public ModelAndView acceptSurvivorForSession(@RequestParam("sessionId") int sessionId,
                                                 @RequestParam("survivorId") int survivorId) {
        ModelAndView mv = new ModelAndView();
        
        try {
            
            Session session = sessionService.findSessionById(sessionId);
            if (session == null) {
                mv.setViewName("error");
                mv.addObject("message", "Session not found.");
                return mv;
            }
            
            if (session.getSurvivorTheVictimId() == survivorId) {
                session.setSurvivorTheVictimStatus("Accepted");
                sessionService.updateSession(session);  
                
                mv.setViewName("counselor/sessionSuccess");
                mv.addObject("message", "Survivor has been accepted for the session.");
            } else {
                mv.setViewName("error");
                mv.addObject("message", "Survivor not found for this session.");
            }
        } catch (Exception e) {
            mv.setViewName("error");
            mv.addObject("message", "Error while accepting the survivor: " + e.getMessage());
        }
        
        return mv;
    }




    
    @PostMapping("/rejectSurvivorForSession")
    public ModelAndView rejectSurvivorForSession(@RequestParam("sessionId") int sessionId,
                                                 @RequestParam("survivorId") int survivorId) {
        ModelAndView mv = new ModelAndView();
        
        try {
           
            Session session = sessionService.findSessionById(sessionId);
            if (session == null) {
                mv.setViewName("error");
                mv.addObject("message", "Session not found.");
                return mv;
            }

            if (session.getSurvivorTheVictimId() == survivorId) {
                session.setSurvivorTheVictimStatus("Rejected");
                sessionService.updateSession(session);  
                
                mv.setViewName("counselor/sessionSuccess");
                mv.addObject("message", "Survivor has been rejected for the session.");
            } else {
                mv.setViewName("error");
                mv.addObject("message", "Survivor not found for this session.");
            }
        } catch (Exception e) {
            mv.setViewName("error");
            mv.addObject("message", "Error while rejecting the survivor: " + e.getMessage());
        }

        return mv;
    }

    
    @GetMapping("/counselor/mySessions")
    public ModelAndView viewMySessions(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("counselor/mySessions");

        HttpSession session = request.getSession();
        Counselor counselor = (Counselor) session.getAttribute("counselor");

        if (counselor != null) {
            List<Session> sessions = sessionService.getSessionsByCounselorId(counselor.getId());
            mv.addObject("sessions", sessions);
        } else {
            mv.addObject("message", "No counselor found in session.");
        }

        return mv;
    }


    @GetMapping("/counselor/sessionDashboard")
    public ModelAndView viewSessionDashboard(HttpServletRequest request, @RequestParam("sessionId") int sessionId) {
        // Initialize the ModelAndView with the view name
        ModelAndView mv = new ModelAndView("counselor/sessionDashboard");

        // Get the HttpSession and retrieve the Counselor object from the session
        HttpSession httpSession = request.getSession();
        Counselor counselor = (Counselor) httpSession.getAttribute("counselor");

        // Check if the counselor is logged in
        if (counselor != null) {
            // Fetch session details by ID
            Session sessionDetails = sessionService.findSessionById(sessionId);
            
            // If session is found, add session details and list of counselor sessions to the model
            if (sessionDetails != null) {
                mv.addObject("session", sessionDetails);
                
                // Fetch all sessions for this counselor
                List<Session> counselorSessions = sessionService.getSessionsByCounselorId(counselor.getId());
                mv.addObject("sessions", counselorSessions);
            } else {
                mv.addObject("message", "Session not found.");
            }
        } else {
            // If counselor is not logged in, redirect to the login page with a message
            mv.setViewName("counselor/counselorLogin");
            mv.addObject("message", "Please log in first.");
        }

        return mv;
    }



    
}
