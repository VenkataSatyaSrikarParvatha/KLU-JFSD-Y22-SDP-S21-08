package com.jfsd.saahas.springboot.service;

import java.util.List;

import com.jfsd.saahas.springboot.model.Article;

public interface ArticleService {
    
    public String saveArticle(Article article);

    public List<Article> getAllArticles();

    public List<Article> getArticlesByAuthorId(int authorId);

    public List<Article> getArticlesByAuthorRole(String role);

    public Article getArticleById(int id);

    public void deleteArticleById(int id);
}
