# Chat_room

## Concept
#### web-app
- simple chat room application
- user has to login (can create account)
- after user login, they see all the chats the are in
- by clicking on chat they connect to the specific websocket session to have live messaging
- user can create chats
- user can join chats by entering the chat ID

#### api
- all api calls have to be send with credentials (json, path)
- get number of messages from a chat room /api/get/{chat ID}/{# of messages}
- send a message to a chat room /api/send/{chat ID}
- create a chat room /api/create/{chat room name}
- join a chat room /api/join/{chat ID}

## learning material
https://www.youtube.com/watch?v=n6ZqOwreFTA
https://www.callicoder.com/spring-boot-websocket-chat-example/
https://github.com/tushar-prabhu/chat_app-springboot
https://www.dariawan.com/tutorials/spring/build-chat-application-using-spring-boot-and-websocket/
https://www.youtube.com/watch?v=wuX2ESOy-Ts

## How to use Vagrant
- start,stop,destroy
    - `vagrant up`
    - `vagrant halt`
    - `vagrant destroy`
- re-run just that named provision file
    - `vagrant provision --provision-with java`
- server-side troble shooting
    - `vagrant ssh`

## Tools
- project initializer ([link](https://start.spring.io/))