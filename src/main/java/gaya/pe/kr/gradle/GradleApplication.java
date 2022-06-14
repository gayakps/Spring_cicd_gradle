package gaya.pe.kr.gradle;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.Date;

@SpringBootApplication
public class GradleApplication {

    public static void main(String[] args) {
        System.out.println("[---------------------------------------------]");
        System.out.println("|              서버가 시작 됩니다             |");
        System.out.println("[---------------------------------------------]");
        SpringApplication.run(GradleApplication.class, args);
    }

}
