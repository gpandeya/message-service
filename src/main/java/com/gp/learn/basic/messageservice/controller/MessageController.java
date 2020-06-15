package com.gp.learn.basic.messageservice.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MessageController {

	
	@GetMapping("/check")
	public String sayHello(){
		return "Hello world!";
	}
}
