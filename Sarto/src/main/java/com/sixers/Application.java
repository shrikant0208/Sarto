package com.sixers;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
/*@ComponentScan(basePackages = {"com.rein", "com.auth0"})
@EnableAutoConfiguration
@ImportResource("classpath:auth0-security-context.xml")
@PropertySource("classpath:auth0.properties")*/
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
