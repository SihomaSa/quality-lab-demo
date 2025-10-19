package com.example.qualitydemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {
    @GetMapping("/register")
    public String register() { return "register"; }

    @GetMapping("/login-page")
    public String login() { return "login"; }
}