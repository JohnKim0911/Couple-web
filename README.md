# KH 정보교육원 Final Project
**Final Project 4조: 사랑해조**

## 💕프로젝트 주제
**UsTwo : 커플웹(couple-Web). 커플들을 위한 다양한 기능을 제공하는 플랫폼**

## 💑 기획 의도

현재 커플들이 사용할 수 있는 애플리케이션과 SNS는 많지만, 웹사이트 형태로 제공되는 서비스는 부족합니다. 이러한 점을 감안하여, 다양한 기능을 통합한 커플 전용 웹사이트를 개발하게 되었습니다.

기존의 어플리케이션들은 기능이 한정적이어서 사용자들이 필요로 하는 다양한 요구를 충족하지 못하고 있습니다. 저희 웹사이트는 서로의 소중한 추억을 간직하고, 관계를 더욱 돈독히 할 수 있는 다양한 기능을 제공합니다.

또한, 앱 다운로드에 꺼려하는 사용자들을 고려하여 웹 기반으로 개발하였습니다. 이를 통해 더 많은 커플들이 손쉽게 접근하고 활용할 수 있는 공간을 마련하고자 합니다.

결론적으로, 저희 웹사이트는 커플들이 함께하는 경험을 확장하고, 그들의 관계를 더욱 깊게 만들기 위해 기획되었습니다.


## 🕓 개발 기간
- 2024.09.11 ~ 2024.09.18 : 프로젝트 주제 선정
- 2024.09.19 ~ 2024.09.22 : 요구사항 분석 및 구현할 목표 설정
- 2024.09.23 ~ 2024.10.03 : 화면 설계 및 데이터 설계
- 2024.10.04 ~ 2024.10.24 : 화면 구현, 기능개발, 프로젝트 검수 및 테스트
- 2024.10.25 : 프로젝트 발표

## 🔎 개발 환경
- **OS** : Windows 10
- **Tool** : Eclipse, SQL Developer, Visual Studio Code
- **DBMS** : Oracle
- **Collaboration** : Git, SourceTree
- **WAS** : Apache Tomcat 9.0
- **Language** : Java, SQL, HTML, CSS, JavaScript, Ajax, jQeury

## 💻 기술 스택
- **Front-End** : HTML5, CSS3, JavaScript, JQuery, Ajax
- **Back-End** : Java 11, JSP & Servlet, Spring, Mybatis

## 🔑 ERD 설계
![ERD](https://github.com/user-attachments/assets/dcfa2079-3f9d-41a2-862e-9611bdfce516)

## 📋 프로젝트 설명 
📌 **프로젝트 특징**
    <br><br>
    - UsTwo는 연인들이 사용하는 웹사이트로, 개인에게 발급된 고유 코드를 통해 커플을 매칭하고, 이메일이나 카카오톡을 통해 상대방을 초대하여 함께 사이트를 만들어 나가는 플랫폼입니다. 또한, 서로의 소통을 위한 채팅 기능 및 화상채팅을 제공하며, 모바일 중심의 커플 어플리케이션을 웹으로 구현하였습니다.
    <br><br>
    - 커플 모바일 어플리케이션의 장점들을 모아 하나의 플랫폼에서 다양한 기능들을 사용할 수 있습니다.
    <br><br>

 
    

📌 **프로젝트 개선점**

📌 **프로젝트 통해 깨달은 점 및 소감**



## 🏆 팀원 구성 및 역할

- **김동규**
    - 캘린더
        - 공휴일 가져오기 (Google Calendar API)
        - 화면구현 (FullCalendar JS Library)
        - 일정알림 문자보내기 (Twilio API)
        - 일정, 캘린더 CRUD
    - 마인드맵
        - 화면구현 (Go JS Library)
        - 마인드맵 CRUD
    - 마이페이지
        - 초대코드 카카오톡 공유 (Kakao API)
        - 탈퇴 30일 후 계정영구삭제 (DBMS Scheduler을 통한 자동화)
        - 회원 조회/변경/삭제, 커플 등록/삭제
    - 홈
        - 만난지 몇일 D-DAY 카운트
        - 커플 정보 조회/변경
        - 로그인 전/후 홈페이지 화면구현

- **이승헌**
    - 회원가입
        - 이메일 인증 (Gmail API)
        - 주소검색 (kakao 주소검색 API)
    - 로그인
        - 아이디 찾기
        - 비밀번호 변경
    - 1대 1 채팅
        - Websocket을 이용한 1대 1 text 채팅
        - WebRTC를 이용한 영상통화
   
- **이은지**

- **황영찬**
    - 앨범
        - 구글 포토에 등록된 앨범 가져오기 (Google PhotosLibrary API)
        - 앨범 생성, 사진 추가/삭제하기 (Google PhotosLibrary API)
        - 스토리(사진 게시판) 생성 및 댓글 기능 
        - 댓글 좋아요 기능
    - 활동 추천
        - 인기 영화 추천 목록 (TMDB API)
        - 인기 TV프로그램 추천 목록 (TMDB API)
        - 카테고리 별 목록 변경
        - 영화 및 TV 프로그램 상세 정보 조회
        - 랜덤 활동 추천
    - 관리자 페이지
        - 전체 회원 정보 조회
## 👊프로젝트 구현

### ❤ 김동규

#### 🔴 캘린더

##### 캘린더 - 조회

> - 공휴일 가져오기 (Google Calendar API). // 빨간색 일정이 공휴일.
> - 화면구현 (FullCalendar JS Library)
> - 년/월/주/일/목록별 조회

![Calendar_view](https://github.com/user-attachments/assets/e849d7ff-b347-4041-a4bd-7040b351468d)


##### 캘린더 - 알림 문자발신

> - Twilio API 사용

![Calendar_textAlert](https://github.com/user-attachments/assets/fe35bb2f-f878-4b1e-803a-309f88cecd92)

> 핸드폰 받은문자메시지

<img src="https://github.com/user-attachments/assets/a96ede5b-c8be-4d8f-a28b-1783c4f5a0c8" alt="sms message" width="400px">
<!-- ![Calendar_textAlert_result](https://github.com/user-attachments/assets/a96ede5b-c8be-4d8f-a28b-1783c4f5a0c8) -->


##### 캘린더 - 일정 CRUD

> - 월/주/일/년별 View에서 일정 추가
> - 일정 수정/삭제

![Calendar_CRUD](https://github.com/user-attachments/assets/5d2d5ca4-1b74-4b9e-a4a7-0317cbd26f37)


##### 캘린더 - 캘린더별 조회/수정

> - 모든일정 / 우리일정 / 내일정 / 상대방일정별 조회
> - 캘린더별 기본색상 변경

![Calendar_Cal ReadUpdate](https://github.com/user-attachments/assets/d101eed8-887f-48d6-86bf-565558dd8bc7)


#### 🔴 마인드맵


#### 🔴 마이페이지


#### 🔴 홈 

##### 홈 - 커플정보 수정

> - 만난지 몇일 D-DAY 카운트 기능 포함

![memberHome_edit](https://github.com/user-attachments/assets/13611d1f-c504-475c-a37a-ddfb039e5f91)

##### 홈 - 로그인 전/후 화면구현

> 로그인 전

![guestHome](https://github.com/user-attachments/assets/9bd048f1-e3c6-4067-902f-3a4ca8d6bc18)

> 로그인 후

![memberHome](https://github.com/user-attachments/assets/4a5d9caf-3682-4be0-aeb6-e479db097fc9)


### 🧡 이승헌

#### 🟠 로그인/회원가입

##### 회원가입

> 회원가입시 이메일 인증
> 주소 검색을 위한 kakaoAPI 이용

![회원가입 7mb](https://github.com/user-attachments/assets/c39e481a-6cd3-4466-b823-e341ea4206b2)


##### 로그인 기능

> (커플코드 없는 사람의 로그인)

![커플코드없는사람 마이페이지](https://github.com/user-attachments/assets/e221204c-4007-4df2-89eb-0db56026b425)

> (커플코드 있는 사람의 로그인)

![커플코드있는아이디 로그인](https://github.com/user-attachments/assets/f9a61c47-9985-4888-8972-13cfd08887ef)


##### 아이디 찾기
![아이디 찾기](https://github.com/user-attachments/assets/3301ad98-e8c9-4a04-8f5b-c06c965b402a)


##### 비밀번호 찾기

![비밀번호 찾기 및 변경](https://github.com/user-attachments/assets/02d3cd40-68ce-417c-971f-4f573a20c3ba)


#### 🟠 1대 1 채팅

![채팅기능](https://github.com/user-attachments/assets/8e48e5f1-cdd0-474c-a3c3-43f22f0ceac5)
 
#### 🟠 1 대 1 화상통화

![화상통화 다시만듬](https://github.com/user-attachments/assets/2b804ecb-7062-47fc-93a3-675d3b1e6a6b)


### 💛 이은지
#### 🟡 커플 가계부
##### 커플 가계부 - 조회
> - 가계부 조회
##### 커플 가계부 - 추가
> - 입출금 내역 추가
##### 커플 가계부 - 검색
> - 특정 조건으로 내역 검색
#### 🟡 연애고사
##### 연애고사 - 설문
> - 기초 설문 조사
##### 연애고사 - 재촉하기
> - 상대방 재촉하기(상대방이 설문조사에 참여하지 않았을 경우에만 가능한 기능) : KakaoTalk API
##### 연애고사 - 연애고사 응시
> - 연애고사 응시(문제 및 선택지 생성 : Google Gemini API)
##### 연애고사 - 이전 고사 조회
> - 이전 고사 문제 및 정답, 점수 조회
#### 🟡 오늘 뭐먹지?
##### 오늘 뭐먹지? - 사다리 타기
> - 사다리 타기(메뉴 생성 : Google Gemini API)
#### 🟡 오늘의 질문
##### 오늘의 질문 - 조회
> - 오늘의 질문 조회
##### 오늘의 질문 - 답변하기
> - 오늘의 질문에 답변하기
##### 오늘의 질문 - 답변 수정하기
> - 오늘의 질문 답변 수정하기
##### 오늘의 질문 - 추가
> - 자정에 자동으로 INSERT
#### 🟡 AI 연애 상담
##### AI 연애 상담 - 조회 및 질문
> - AI 연애 상담(답변 : Google Gemini API)

### 💚 황영찬
#### 🟢 앨범
##### 앨범 - 조회
> - 앨범 가져오기 (Google PhotosLibrary API)

![앨범 가져오기](https://github.com/user-attachments/assets/bf8d6946-e130-4d0a-a931-decf2fbd0b44)

##### 앨범 - 추가 및 삭제

> - 앨범 만들기 

![앨범 만들기](https://github.com/user-attachments/assets/a666d659-becc-40bd-a2f5-d133b0879fab)

> - 앨범 사진 추가

![앨범 사진 추가하기](https://github.com/user-attachments/assets/946a00cf-9dec-49f4-8b6d-b8a397be2aa7)

> - 앨범 사진 삭제

![앨범 사진 삭제하기](https://github.com/user-attachments/assets/0ac862ef-8bd6-4a37-9f82-080d912fef44)

#### 🟢 스토리
##### 스토리 - 게시
> - 스토리 조회
> - 스토리 새로 등록

![스토리 게시하기](https://github.com/user-attachments/assets/e236b92c-22b2-4aac-9386-eed750977413)

> - 스토리 댓글 작성

![스토리 댓글 작성하기](https://github.com/user-attachments/assets/b01265e7-f2af-4cd7-9bbf-f8565752cf4d)

> - 스토리 댓글 좋아요
> - 스토리 삭제

![스토리 댓글 좋아요 및 삭제](https://github.com/user-attachments/assets/612d5eac-f585-40c0-bca3-723072ca3c6c)

#### 🟢 활동 추천
##### 활동 추천 - 조회

> - 인기 영화 및 TV프로그램 조회
> - 카테고리 별 새로운 리스트업

![영화 조회](https://github.com/user-attachments/assets/03f7fa88-dcae-4991-a8cb-54af97181506)

> - 영화 및 TV 프로그램 상세정보

![영화 상세조회](https://github.com/user-attachments/assets/2b191062-d6b1-4bf8-a6b9-cf183f0a89e0)

##### 활동 추천 - 랜덤 추천
> - 랜덤으로 활동 추천

![랜덤 활동 추천](https://github.com/user-attachments/assets/de1cd766-1870-4e61-9bef-a7e1d04b6658)

#### 🟢 관리자 페이지
##### 관리자 페이지 - 조회
> - 전체 회원 조회

 ![관리자 페이지](https://github.com/user-attachments/assets/7b1da6f6-b4ff-4efc-9a3e-ad2a8154405b)


