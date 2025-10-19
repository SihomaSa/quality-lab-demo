package com.example.qualitydemo.controller;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class HealthController {

    @GetMapping("/health")
    public String health() {
        return "{\"status\":\"OK\",\"timestamp\":\"" + java.time.LocalDateTime.now() + "\"}";
    }

    @GetMapping("/info")
    public String info() {
        return "{\"name\":\"Quality Lab Demo\",\"version\":\"1.0.0\"}";
    }

    @PostMapping("/register")
    public String register(@RequestBody User user) {
        return "{\"message\":\"User registered successfully\",\"username\":\"" + user.getName() + "\",\"email\":\"" + user.getEmail() + "\"}";
    }

    public static class User {
        private String name;
        private String email;
        private String password;
        
        public String getName() { return name; }
        public void setName(String name) { this.name = name; }
        public String getEmail() { return email; }
        public void setEmail(String email) { this.email = email; }
        public String getPassword() { return password; }
        public void setPassword(String password) { this.password = password; }
    }
}