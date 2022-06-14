package gaya.pe.kr.gradle;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.Date;

@SpringBootApplication
public class GradleApplication {

    public static void main(String[] args) {
        System.out.println("[[[ Start System!! " + new Date().toLocaleString() + "]]]]");
        SpringApplication.run(GradleApplication.class, args);
    }

}
