package com.api.chat_room.model;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "users")
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "username", length = 50)
    private String username;

    @Column(name = "password", length = 100)
    private String password;

    @Column(name = "pictureURL", length = 100)
    private String pictureURL;

    @Column(name = "color", length = 7)
    private String color;

    @Column(name = "created_at", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    private LocalDateTime createdAt;

    @OneToMany(mappedBy = "owner", cascade = CascadeType.ALL)
    private List<ChatRoom> ownedChatRooms;

    @OneToMany(mappedBy = "user")
    private List<CanAccess> accessibleChatRooms;

    @OneToMany(mappedBy = "sendBy")
    private List<Message> messages;

    // Constructors
    public User() {
    }

    public User(String username, String password, String pictureURL, String color, LocalDateTime createdAt) {
        this.username = username;
        this.password = password;
        this.pictureURL = pictureURL;
        this.color = color;
        this.createdAt = createdAt;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPictureURL() {
        return pictureURL;
    }

    public void setPictureURL(String pictureURL) {
        this.pictureURL = pictureURL;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public List<ChatRoom> getOwnedChatRooms() {
        return ownedChatRooms;
    }

    public void setOwnedChatRooms(List<ChatRoom> ownedChatRooms) {
        this.ownedChatRooms = ownedChatRooms;
    }

    public List<CanAccess> getAccessibleChatRooms() {
        return accessibleChatRooms;
    }

    public void setAccessibleChatRooms(List<CanAccess> accessibleChatRooms) {
        this.accessibleChatRooms = accessibleChatRooms;
    }

    public List<Message> getMessages() {
        return messages;
    }

    public void setMessages(List<Message> messages) {
        this.messages = messages;
    }
}
