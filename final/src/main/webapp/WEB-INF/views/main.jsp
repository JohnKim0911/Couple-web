<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <title>My Spring WebSocket Chatting</title>
    <link rel="stylesheet" href="/css/chatroom/main.css"/>
    <style>
        #menu{
            width: 310px;
        }
        button#uploadFile {
            margin-left: 225px;
            margin-top: -55px;
        }
        input {
            padding-left: 5px;
            outline: none;
            width: 250px;
            margin-top: 15px;
        }
        .btn fa fa-download {
            background-color: DodgerBlue;
            border: none;
            color: white;
            padding: 12px 30px;
            cursor: pointer;
            font-size: 20px;
        }

        .input-group{width:80.5%}
        .chat-container{position: relative;}
        .chat-container .btn-group{position:absolute; bottom:-12px; right:-50px; transform: translate(-50%,-50%);}
    </style>
</head>
<body>
<noscript>
    <h2>Sorry! Your browser doesn't support Javascript</h2>
</noscript>


<div id="username-page">
    <div class="username-page-container">
        <h1 class="title">Type your username</h1>
        <form id="usernameForm" name="usernameForm">
            <div  th:if="${user == null}" class="form-group">
                <input type="text" id="name" placeholder="Username" autocomplete="off" class="form-control"/>
            </div>
            <div  th:if="${user != null}" class="form-group">
                <input type="text" id="name" placeholder="Username" autocomplete="off" class="form-control" th:value="${user.nickName}"/>
            </div>
            <div class="form-group">
                <button type="submit" class="accent username-submit">Start Chatting</button>
            </div>
        </form>
    </div>
</div>


<div id="chat-page" class="hidden">
    <div class="btn-group dropend">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="showUserListButton" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
            참가한 유저
        </button>
        <div id="list" class="dropdown-menu" aria-labelledby="showUserListButton">

        </div>
    </div>
    <div class="chat-container">
        <div class="chat-header">
            <h2>[[${room.roomName}]]</h2>
        </div>
        <div class="connecting">
            Connecting...
        </div>
        <ul id="messageArea">

        </ul>
        <form id="messageForm" name="messageForm" nameForm="messageForm">
            <div class="form-group">
                <div class="input-group clearfix">
                    <input type="text" id="message" placeholder="Type a message..." autocomplete="off"
                           class="form-control"/>
                    <button type="submit" class="primary">Send</button>
                </div>
            </div>
        </form>

        <div class="btn-group dropend">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="showMenu" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                추가 메뉴
            </button>
            <div id="menu" class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <input type="file" id="file">
                <button type="button" class="btn btn-primary" id="uploadFile">업로드</button>
            </div>
        </div>
    </div>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="/js/common/ajaxUtil.js"></script>
<script src="/js/chatroom/socket.js"></script>
<script src="/js/common/fileUtil.js"></script>
</body>
</html>