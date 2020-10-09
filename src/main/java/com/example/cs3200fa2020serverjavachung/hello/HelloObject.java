package com.example.cs3200fa2020serverjavachung.hello;

public class HelloObject {
    private String message;
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }
    public HelloObject(String message) {
        this.message = message;
    }
    public HelloObject() {
    }
}