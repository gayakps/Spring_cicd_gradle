package gaya.pe.kr.gradle;


import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping("/")
    public static String test(Model model) {
        return "Testing won 22 06 07 5:52 Case 1";
    }

}
