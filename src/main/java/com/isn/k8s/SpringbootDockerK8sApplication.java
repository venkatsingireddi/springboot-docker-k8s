package com.isn.k8s;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

import com.isn.k8s.model.AuditorAwareImpl;

@SpringBootApplication
@EnableJpaAuditing(auditorAwareRef = "auditorAware")
public class SpringbootDockerK8sApplication {

	@Bean
	public AuditorAware<String> auditorAware(){

		return new AuditorAwareImpl();
	}

	public static void main(String[] args) {
		SpringApplication.run(SpringbootDockerK8sApplication.class, args);
	}

}
