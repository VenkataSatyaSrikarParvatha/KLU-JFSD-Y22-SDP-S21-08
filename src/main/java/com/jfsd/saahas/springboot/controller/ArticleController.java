package com.jfsd.saahas.springboot.controller;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jfsd.saahas.springboot.model.Article;
import com.jfsd.saahas.springboot.service.ArticleService;

@Controller
public class ArticleController {

    @Autowired
    private ArticleService articleService;


    @GetMapping("/articles")
    public String listArticles(Model model) {
        List<Article> articles = articleService.getAllArticles();
        model.addAttribute("articles", articles);
        return "article/articles"; 
        
    }


    @GetMapping("/viewArticle")
    public ModelAndView viewArticle(@RequestParam("id") int id) {
        Article article = articleService.getArticleById(id);

        ModelAndView mv = new ModelAndView();
        if (article != null) {
            mv.setViewName("article/viewArticle"); 

            mv.addObject("article", article);
        } else {
            mv.setViewName("error"); 

            mv.addObject("message", "Article not found.");
        }
        return mv;
    }
    
    
    @GetMapping("/getArticleImage")
    public ResponseEntity<byte[]> getArticleImage(@RequestParam("id") int id) {
        Article article = articleService.getArticleById(id);
        if (article != null && article.getImage() != null) {
            Blob imageBlob = article.getImage();
            try {
                byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                return ResponseEntity.ok()
                        .contentType(MediaType.IMAGE_JPEG)  

                        .body(imageBytes);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return ResponseEntity.notFound().build();
    }


}
