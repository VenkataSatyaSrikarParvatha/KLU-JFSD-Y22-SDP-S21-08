package com.jfsd.saahas.springboot.service;

import com.jfsd.saahas.springboot.model.Article;
import com.jfsd.saahas.springboot.model.Counselor;
import com.jfsd.saahas.springboot.model.Session;

public interface CounselorService {
	
    public String registerCounselor(Counselor counselor);
    public Counselor checkCounselorLogin(String email, String password);
    public Counselor displayCounselorById(int id);
    public String updateCounselorProfile(Counselor counselor);
    public String saveArticle(Article article);

    public String saveSession(Session session);
}
