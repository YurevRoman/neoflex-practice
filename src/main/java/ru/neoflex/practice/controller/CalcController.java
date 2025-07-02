package ru.neoflex.practice.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CalcController {
    @GetMapping("/plus/{a}/{b}")
    public int add (@PathVariable int a, @PathVariable int b){
        return a + b;
    }

    @GetMapping("/minus/{a}/{b}")
    public int subtract (@PathVariable int a, @PathVariable int b){
        return a - b;
    }
}
