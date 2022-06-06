package gaya.pe.kr.cicd;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
public class TestController {

    @GetMapping("/")
    public static String test(Model model) {
        return "Testing won 22 06 07 5:31";
    }

}
