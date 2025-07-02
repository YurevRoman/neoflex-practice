package ru.neoflex.practice.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import ru.neoflex.practice.model.CalcOperation;
import ru.neoflex.practice.repository.CalcRepository;

import java.util.List;

@RestController
public class CalcController {

    private final CalcRepository calcRepository;

    public CalcController(CalcRepository calcRepository) {
        this.calcRepository = calcRepository;
    }


    @GetMapping("/operations")
    public List <CalcOperation> getOperations() {
        return calcRepository.findAll();
    }

    @GetMapping("/plus/{a}/{b}")
    public int add (@PathVariable int a, @PathVariable int b){
        int result = a + b;
        calcRepository.save(new CalcOperation("plus", a, b, result));
        return result;
    }

    @GetMapping("/minus/{a}/{b}")
    public int subtract (@PathVariable int a, @PathVariable int b){
        int result = a - b;
        calcRepository.save(new CalcOperation("minus", a, b, result));
        return result;
    }
}
