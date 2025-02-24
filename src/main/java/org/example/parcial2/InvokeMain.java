package org.example.parcial2;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.lang.reflect.Method;
import java.util.Arrays;

@RestController
@RequestMapping("/")
public class InvokeMain {

    @GetMapping("/TuNombre")
    public String calcular() {

        return "Sebastian";
    }
}
