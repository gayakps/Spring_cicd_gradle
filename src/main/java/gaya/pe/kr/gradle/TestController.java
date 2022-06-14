package gaya.pe.kr.gradle;


import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RestController;

import java.net.InetAddress;
import java.net.UnknownHostException;

@RestController
public class TestController {

    @GetMapping("/")
    public static String test(Model model) {
        String defaultTime = "Testing 22 06 14 13:33 Case 1";
        InetAddress ip;
        try {
            ip = InetAddress.getLocalHost();
            return String.format("%s IP : %s HostName : %s",defaultTime , ip.getHostAddress(), ip.getHostName());
        } catch (UnknownHostException e) {
            e.printStackTrace();
            return defaultTime;
        }
    }

}
