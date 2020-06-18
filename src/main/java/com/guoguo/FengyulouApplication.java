package com.guoguo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication(exclude = MongoAutoConfiguration.class)
public class FengyulouApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(FengyulouApplication.class, args);
        System.out.println("启动成功");
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(FengyulouApplication.class);
    }

}
