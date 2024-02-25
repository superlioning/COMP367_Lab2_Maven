package com.example.comp367_lab2_maven;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalTime;

@Controller
public class HomeController {

    @GetMapping("/")
    public String welcome(Model model) {
        LocalTime currentTime = LocalTime.now();
        String greeting;

        if (currentTime.isAfter(LocalTime.NOON)) {
            greeting = "Good afternoon, Ninghua, Welcome to COMP367";
        } else {
            greeting = "Good morning, Ninghua, Welcome to COMP367";
        }

        model.addAttribute("message", greeting);
        return "index";
    }
}
