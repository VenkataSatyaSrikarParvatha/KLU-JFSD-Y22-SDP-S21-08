package com.jfsd.saahas.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jfsd.saahas.springboot.model.Article;

@Repository
public interface ArticleRepository extends JpaRepository<Article, Integer> {
   
    List<Article> findAllByOrderByCreatedAtDesc();

    List<Article> findByAuthorId(int authorId);

    List<Article> findByAuthorRole(String role);
    
   
}
