package com.jfsd.saahas.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jfsd.saahas.springboot.model.Article;
import com.jfsd.saahas.springboot.repository.ArticleRepository;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleRepository articleRepository;

    @Override
    public String saveArticle(Article article) {
        articleRepository.save(article); 
        return "Article Added Successfully";
    }

    @Override
    public List<Article> getAllArticles() {
        return articleRepository.findAllByOrderByCreatedAtDesc(); 
    }

    @Override
    public List<Article> getArticlesByAuthorId(int authorId) {
        return articleRepository.findByAuthorId(authorId); 
    }

    @Override
    public List<Article> getArticlesByAuthorRole(String role) {
        return articleRepository.findByAuthorRole(role); 
    }

    @Override
    public Article getArticleById(int id) {
        return articleRepository.findById(id).get();
    }

    @Override
    public void deleteArticleById(int id) {
        articleRepository.deleteById(id); 
    }
}
