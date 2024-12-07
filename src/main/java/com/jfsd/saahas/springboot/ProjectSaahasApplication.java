package com.jfsd.saahas.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ProjectSaahasApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectSaahasApplication.class, args);
		System.out.println("Finally ran");
	}

}
