package com.example.qualitydemo.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.Map;

@RestController
public class AuthController {
    @PostMapping("/login")
    public ResponseEntity<?> loginApi(@RequestBody Map<String, String> body) {
        String user = body.getOrDefault("user", "");
        String pass = body.getOrDefault("pass", "");
        
        if (user.isEmpty() || pass.isEmpty()) {
            return ResponseEntity.badRequest().body(Map.of("error", "Missing fields"));
        }
        return ResponseEntity.ok(Map.of("message", "Login successful", "token", "abc123"));
    }
}