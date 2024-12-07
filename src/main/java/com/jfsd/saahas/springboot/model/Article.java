package com.jfsd.saahas.springboot.model;

import java.sql.Blob;
import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;

@Entity
@Table(name = "article_table")
public class Article {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "article_title", nullable = false, length = 200)
    private String title;

    @Column(name = "article_context", nullable = true, length = 500)
    private String context; 

    @Lob
    @Column(name = "article_content", nullable = false)
    private String content;

    @Lob
    @Column(name = "article_image", nullable = true)
    private Blob image; 

    @Column(name = "article_author_id", nullable = false)
    private int authorId; 

    @Column(name = "article_author_name", nullable = false)
    private String authorName;

    @Column(name = "article_author_role", nullable = false)
    private String authorRole; 

    @Column(name = "article_is_anonymous", nullable = false)
    private boolean isAnonymous; 

    @Column(name = "article_created_at", nullable = false)
    private LocalDateTime createdAt; 

    //if needed to string it is at last
    //check it if any needed 
    //no need at prsent 
    
    
    //created a constutor -- you it if needed - any time 
    public Article() {
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Blob getImage() {
        return image;
    }

    public void setImage(Blob image) {
        this.image = image;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getAuthorRole() {
        return authorRole;
    }

    public void setAuthorRole(String authorRole) {
        this.authorRole = authorRole;
    }

    public boolean isAnonymous() {
        return isAnonymous;
    }

    public void setAnonymous(boolean isAnonymous) {
        this.isAnonymous = isAnonymous;
    }
    
    public boolean getIsAnonymous() {
        return isAnonymous;
    }


    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", context='" + context + '\'' +
                ", content='" + content + '\'' +
                ", authorId=" + authorId +
                ", authorName='" + (isAnonymous ? "Anonymous" : authorName) + '\'' +
                ", authorRole='" + authorRole + '\'' +
                ", createdAt=" + createdAt +
                '}';
    }
}
