package com.jfsd.saahas.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class VisitorController {
	
    @GetMapping("/")
    public ModelAndView home() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("visitor/home");
        return mv;
    }
    
    @GetMapping("/visitor_about")
    public ModelAndView visitor_about() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("visitor/visitor_about");
        return mv;
    }
    
    
    @GetMapping("/visitor_requirements")
    public ModelAndView visitor_requirements() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("visitor/visitor_requirements");
        return mv;
    }
    
    
    
    @GetMapping("/visitor_articles")
    public ModelAndView visitor_articles() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("visitor/visitor_articles");
        return mv;
    }
    
    
    
    @GetMapping("/visitor_help")
    public ModelAndView visitor_help() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("visitor/visitor_help");
        return mv;
    }
    
    @GetMapping("/privacy_policy")
    public ModelAndView privacy_policy() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("visitor/privacy_policy");
        return mv;
    }
	
	
}



/*
@RestController
@RequestMapping("saahas")
public class VisitorController {


    @GetMapping("/")
    public String home() {
        return "Hello";
    }
	
}
*/
