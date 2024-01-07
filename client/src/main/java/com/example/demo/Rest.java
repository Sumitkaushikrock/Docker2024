package main.java.com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Rest {

    @GetMapping("sayHello")
    public String sayHello(){
        return "Heloooooo";
    }
}
