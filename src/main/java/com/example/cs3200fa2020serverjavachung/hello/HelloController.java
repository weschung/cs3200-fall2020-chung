package com.example.cs3200fa2020serverjavachung.hello;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @RequestMapping("/api/hello/string")
    public String sayHello() {
        return "Hello Wesley Chung!";
    }

    @RequestMapping("/api/hello/object")
    public HelloObject sayHelloObject() {
        HelloObject obj = new HelloObject("Hello Wesley Chung!");
        return obj;
    }
}
