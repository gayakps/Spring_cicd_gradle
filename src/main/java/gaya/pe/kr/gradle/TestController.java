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
        InetAddress ip = null;
        try {
            ip = InetAddress.getLocalHost();
            return String.format("Testing won 22 06 14 12:54 Case 1 IP : %s HostName : %s", ip.getHostAddress(), ip.getHostName());
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
        return "IP 추출에 문제 발생 Testing won 22 06 14 12:54 Case 1";
    }

}
