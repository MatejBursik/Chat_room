package com.web.chat_room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController{

    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("/chatroom")
    public String chatroom() {
        return "chatroom";
    }

    @RequestMapping("/create_chatroom")
    public String create_chatroom() {
        return "create_chatroom";
    }

    @RequestMapping("/manage_chatroom")
    public String manage_chatroom() {
        return "manage_chatroom";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    @RequestMapping("/view_acoount")
    public String view_acoount() {
        return "view_acoount";
    }

    @RequestMapping("/manage_acoount")
    public String manage_acoount() {
        return "manage_acoount";
    }
}
