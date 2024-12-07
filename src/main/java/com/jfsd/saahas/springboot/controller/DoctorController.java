package com.jfsd.saahas.springboot.controller;

import java.sql.Blob;
import java.time.LocalDateTime;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jfsd.saahas.springboot.model.Article;
import com.jfsd.saahas.springboot.model.Counselor;
import com.jfsd.saahas.springboot.model.Doctor;
import com.jfsd.saahas.springboot.service.AdminService;
import com.jfsd.saahas.springboot.service.ArticleService;
import com.jfsd.saahas.springboot.service.DoctorService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class DoctorController {

    @Autowired
    private DoctorService doctorService;
    
    @Autowired
    private AdminService adminService;
  

    @GetMapping("doctorReg")
    public ModelAndView doctorReg() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("doctor/doctorReg");
        return mv;
    }

    @PostMapping("insertDoctor")
    public ModelAndView insertDoctor(HttpServletRequest request, 
                                     @RequestParam("profileImage") MultipartFile profileImage, 
                                     @RequestParam("verificationPdf") MultipartFile verificationPdf) throws Exception {
        String msg;
        ModelAndView mv = new ModelAndView();

        try {
            // Collect all doctor data from the form
            String username = request.getParameter("dusername");
            String password = request.getParameter("dpwd");
            String email = request.getParameter("demail");
            String phone = request.getParameter("dphone");
            String dateOfBirth = request.getParameter("ddob");
            String gender = request.getParameter("dgender");
            String address = request.getParameter("daddress");
            String aadhaarNumber = request.getParameter("daadhaar");
            String licenseNumber = request.getParameter("dlicense");
            String specialization = request.getParameter("dspecialization");
            int experience = Integer.parseInt(request.getParameter("dexperience"));
            String bio = request.getParameter("dbio");
            double rating = 0.0;
            double earnings = 0.0;
            String status = "Registered";

            Blob profileImageBlob = null;
            Blob verificationPdfBlob = null;

            if (profileImage != null && !profileImage.isEmpty()) {
                profileImageBlob = new SerialBlob(profileImage.getBytes());
            }

            if (verificationPdf != null && !verificationPdf.isEmpty()) {
                verificationPdfBlob = new SerialBlob(verificationPdf.getBytes());
            }

            Doctor doctor = new Doctor();
            doctor.setUsername(username);
            doctor.setPassword(password);
            doctor.setEmail(email);
            doctor.setPhone(phone);
            doctor.setDateOfBirth(dateOfBirth);
            doctor.setGender(gender);
            doctor.setAddress(address);
            doctor.setAadhaarNumber(aadhaarNumber);
            doctor.setLicenseNumber(licenseNumber);
            doctor.setSpecialization(specialization);
            doctor.setExperience(experience);
            doctor.setBio(bio);
            doctor.setRating(rating);
            doctor.setEarnings(earnings);
            doctor.setStatus(status);

            doctor.setImage(profileImageBlob);
            doctor.setVerificationDoc(verificationPdfBlob);

            msg = doctorService.registerDoctor(doctor);

            mv.setViewName("doctor/regsuccess");
            mv.addObject("message", msg);
        } catch (Exception e) {
            msg = e.getMessage();
            mv.setViewName("doctor/error");
            mv.addObject("message", msg);
        }

        return mv;
    }
    
    
    
    
    

    @GetMapping("doctorLogin")
    public ModelAndView doctorLogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("doctor/doctorLogin");
        return mv;
    }

    @PostMapping("checkDoctorLogin")
    public ModelAndView checkDoctorLogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String email = request.getParameter("demail");
        String password = request.getParameter("dpwd");

        Doctor doctor = doctorService.checkDoctorLogin(email, password);

        if (doctor != null) {
            HttpSession session = request.getSession();
            session.setAttribute("doctor", doctor);
            mv.setViewName("doctor/doctorHome");
        } else {
            mv.setViewName("doctor/doctorLogin");
            mv.addObject("message", "Login Failed");
        }
        return mv;
    }

    @GetMapping("doctorHome")
    public ModelAndView doctorHome() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("doctor/doctorHome");
        return mv;
    }

    @GetMapping("doctorProfile")
    public ModelAndView doctorProfile(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Doctor doctor = (Doctor) session.getAttribute("doctor");

        ModelAndView mv = new ModelAndView();
        if (doctor != null) {
            mv.setViewName("doctor/doctorProfile");
            mv.addObject("doctor", doctor);
        } else {
            mv.setViewName("doctor/doctorLogin");
            mv.addObject("message", "Please login first.");
        }
        return mv;
    }

    @PostMapping("updateDoctorProfile")
    public ModelAndView updateDoctorProfile(HttpServletRequest request, 
                                            @RequestParam(value = "profileImage", required = false) MultipartFile profileImage, 
                                            @RequestParam(value = "verificationPdf", required = false) MultipartFile verificationPdf) {
        ModelAndView mv = new ModelAndView();
        try {
            HttpSession session = request.getSession();
            Doctor doctorSession = (Doctor) session.getAttribute("doctor");
            if (doctorSession == null) {
                throw new Exception("Doctor not logged in.");
            }

            int id = doctorSession.getId();

            String username = request.getParameter("dusername");
            String password = request.getParameter("dpwd");
            String email = request.getParameter("demail");
            String phone = request.getParameter("dphone");
            String dateOfBirth = request.getParameter("ddob");
            String gender = request.getParameter("dgender");
            String address = request.getParameter("daddress");
            String aadhaarNumber = request.getParameter("daadhaar");
            String licenseNumber = request.getParameter("dlicense");
            String specialization = request.getParameter("dspecialization");
            int experience = Integer.parseInt(request.getParameter("dexperience"));
            String bio = request.getParameter("dbio");
            double rating = Double.parseDouble(request.getParameter("drating"));
            double earnings = Double.parseDouble(request.getParameter("dearnings"));

            Doctor doctor = doctorService.displayDoctorById(id);

            doctor.setUsername(username);
            doctor.setPassword(password);
            doctor.setEmail(email);
            doctor.setPhone(phone);
            doctor.setDateOfBirth(dateOfBirth);
            doctor.setGender(gender);
            doctor.setAddress(address);
            doctor.setAadhaarNumber(aadhaarNumber);
            doctor.setLicenseNumber(licenseNumber);
            doctor.setSpecialization(specialization);
            doctor.setExperience(experience);
            doctor.setBio(bio);
            doctor.setRating(rating);
            doctor.setEarnings(earnings);

            if (profileImage != null && !profileImage.isEmpty()) {
                doctor.setImage(new SerialBlob(profileImage.getBytes()));
            }

            if (verificationPdf != null && !verificationPdf.isEmpty()) {
                doctor.setVerificationDoc(new SerialBlob(verificationPdf.getBytes()));
            }

            String msg = doctorService.updateDoctorProfile(doctor);

            session.setAttribute("doctor", doctor);

            mv.setViewName("redirect:/doctorProfile");
        } catch (Exception e) {
            mv.setViewName("doctor/error");
            mv.addObject("message", e.getMessage());
        }
        return mv;
    }

    @GetMapping("doctorLogout")
    public ModelAndView doctorLogout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("doctor");
        session.invalidate();

        ModelAndView mv = new ModelAndView();
        mv.setViewName("doctor/doctorLogin");
        return mv;
    }
    
    @GetMapping("doctorSessionExpiry")
    public ModelAndView doctorSessionExpiry() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("doctorSessionExpiry");
        return mv;
    }

    @GetMapping("doctorUpdateProfile")
    public ModelAndView showUpdateProfilePage(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Doctor doctor = (Doctor) session.getAttribute("doctor");
        ModelAndView mv = new ModelAndView();
        if (doctor != null) {
            mv.setViewName("doctor/updateDoctorProfile");
            mv.addObject("doctor", doctor); 
        } else {
            mv.setViewName("doctor/doctorLogin");
            mv.addObject("message", "Please log in first.");
        }
        return mv;
    }


    @GetMapping("/doctor/profileImage")
    public ResponseEntity<byte[]> getProfileImage(@RequestParam("id") int cid) throws Exception {


        Doctor doctor = adminService.getDoctorById(cid); 

            byte[] imageBytes = doctor.getImage().getBytes(1, (int) doctor.getImage().length());


            
            return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);

    }
    
    
    
    
    
}
