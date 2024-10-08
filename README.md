# Chat_room

## Concept
- simple chat room application
- user has to login (can create account)
- after user login, they see all the chats the are in
- by clicking on chat they connect to the specific websocket session to have live messaging
- user can create chats
- user can join chats by entering the chat ID
- user can become frinds with another user
- from tecnical side, I split the application into 3 servers (web, api, database)

#### web-app
The Web-app server is dealing mostly with frond-end, security and linking the pages. All te other back-end activities are performed through API calls.

#### api
Most of the Use cases of this application are performed by API.
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
https://www.youtube.com/watch?v=L9oWG6aj_U8
https://www.youtube.com/watch?v=rW-fTIVBYt4
https://picocss.com/docs
https://www.thecodelab.dev/blog/10

## How to use Vagrant
- start,stop,destroy
    - `vagrant up`
    - `vagrant halt`
    - `vagrant destroy`
- re-run just that named provision file
    - `vagrant provision <box_name> --provision-with <provision_name>`
- server-side troble shooting
    - `vagrant ssh <box_name>`

## Future improvements
- add a personal chat with a AI (LLM).

## Tools
- project initializer ([link](https://start.spring.io/))