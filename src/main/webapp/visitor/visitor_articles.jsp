<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Read Articles - Visitor</title>
    <link rel="stylesheet" type="text/css" href="visitor/visitorarticles.css">
</head>
<body>
    <%@ include file="visitor_navbar.jsp" %>

    <div class="articles-container">
        <h1>Explore Informative Articles</h1>
        <p class="intro-text">
            Welcome to our collection of articles designed to provide insights into domestic violence, legal rights, and recovery strategies. 
            Stay informed and empowered with the resources below.
        </p>

        <div class="article-section">
            <article class="article-card">
                <h2>The Legal Rights of Domestic Violence Survivors</h2>
                <p>
                    Domestic violence is not just a personal issue but a legal one. Survivors have the right to seek legal aid, 
                    protection orders, and more. Understanding these rights can help empower individuals to take action against abusers.
                </p>
                <a href="/article1" class="read-more">Read More</a>
            </article>

            <article class="article-card">
                <h2>Recognizing Early Signs of Abuse</h2>
                <p>
                    Abuse often starts subtly before escalating. Learn about the red flags in relationships that may indicate 
                    an abusive pattern and how to address them effectively.
                </p>
                <a href="/article2" class="read-more">Read More</a>
            </article>

            <article class="article-card">
                <h2>Coping Mechanisms for Emotional Recovery</h2>
                <p>
                    Emotional recovery from domestic violence is a journey. This article explores coping mechanisms such as 
                    therapy, support groups, and mindfulness practices to help rebuild your life.
                </p>
                <a href="/article3" class="read-more">Read More</a>
            </article>

            <article class="article-card">
                <h2>The Role of Support Systems</h2>
                <p>
                    Having a robust support system can make a world of difference. Learn about how friends, family, 
                    and professional networks can aid in the recovery process.
                </p>
                <a href="/article4" class="read-more">Read More</a>
            </article>
        </div>
    </div>

    <div class="footer">
        <p>&copy; 2024 SAAHAS. All rights reserved.</p>
    </div>
</body>
</html>
