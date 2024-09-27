package com.api.chat_room.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.api.chat_room.repository.CanAccessRepository;
import com.api.chat_room.repository.ChatRoomRepository;
import com.api.chat_room.repository.FriendRepository;
import com.api.chat_room.repository.MessageRepository;
import com.api.chat_room.repository.UserRepository;

import java.util.List;

@RestController
@RequestMapping("/test")
public class TestRestController {
    @Autowired
    UserRepository userRepository;

    @Autowired
    ChatRoomRepository chatRoomRepository;

    @Autowired
    CanAccessRepository canAccessRepository;

    @Autowired
    MessageRepository messageRepository;

    @Autowired
    FriendRepository friendRepository;

    @GetMapping("/hello")
    public String helloWorld() {
        return "Hello World";
    }

    @GetMapping("/getUsernames")
    public ResponseEntity<List<String>> getUsernames() {
        List<String> usernames = userRepository.findAll().stream().map(a -> a.getUsername()).toList();
        System.out.println(usernames);
        return new ResponseEntity<List<String>>(usernames, HttpStatus.OK);
    }
}