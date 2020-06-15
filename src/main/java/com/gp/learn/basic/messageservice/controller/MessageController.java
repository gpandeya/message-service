package com.gp.learn.basic.messageservice.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MessageController {

	
	@GetMapping("/check")
	public String sayHello(){
		return "Hello world!";
	}
	@GetMapping("/")
	public String home() {
		return "Welcome to my portal!";
	}
	@GetMapping("/users/welcome")
	public String welcomeUsers() {
		return "Welcome User!";
	}
	@GetMapping("/admins/welcome")
	public String welcomeAdmins() {
		return "Welcome Admin!";
	}
}
