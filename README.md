# UsTwo

## 💕 주제
- 커플웹(couple-Web)
- 커플들을 위한 다양한 기능을 제공하는 플랫폼.
> 사이트명: UsTwo

## 💑 기획 의도

기존 서비스의 단점: 
- 모바일앱은 많지만, 웹사이트 형태로 제공되는 서비스는 부족
- 모바일앱의 기능이 제한적.

➡️ 더 다양한 기능을 제공하는 웹사이트를 만들자.

## 🏆역할

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

## 👊프로젝트 구현

### ❤ 김동규

#### 🔴 캘린더

##### 일정조회

> - 공휴일 가져오기 (Google Calendar API). // 빨간색 일정이 공휴일.
> - 화면구현 (FullCalendar JS Library)
> - 년/월/주/일/목록별 조회

![Calendar_view](https://github.com/user-attachments/assets/e849d7ff-b347-4041-a4bd-7040b351468d)


##### 일정 알림문자 발신

> Twilio API 사용

![Calendar_textAlert](https://github.com/user-attachments/assets/fe35bb2f-f878-4b1e-803a-309f88cecd92)

> 핸드폰 받은문자메시지

<img src="https://github.com/user-attachments/assets/a96ede5b-c8be-4d8f-a28b-1783c4f5a0c8" alt="sms message" width="400px">
<!-- ![Calendar_textAlert_result](https://github.com/user-attachments/assets/a96ede5b-c8be-4d8f-a28b-1783c4f5a0c8) -->


##### 일정 CRUD

> - 월/주/일/년별 View에서 일정 추가
> - 일정 수정/삭제

![Calendar_CRUD](https://github.com/user-attachments/assets/5d2d5ca4-1b74-4b9e-a4a7-0317cbd26f37)


##### 캘린더별 조회/수정

> - 모든일정 / 우리일정 / 내일정 / 상대방일정별 조회
> - 캘린더별 기본색상 변경

![Calendar_Cal ReadUpdate](https://github.com/user-attachments/assets/d101eed8-887f-48d6-86bf-565558dd8bc7)


#### 🔴 마인드맵

> - 화면구현 (Go JS Library)
> - 마인드맵 CRUD

![mindmap](https://github.com/user-attachments/assets/1c4bd257-2782-45a7-b87c-58405ddf029d)


#### 🔴 마이페이지

##### 초대코드 카카오톡 공유

> Kakao API 사용

![myPage_inviteCode_kakaoShare](https://github.com/user-attachments/assets/0ec7eb57-875f-4c99-9cd8-d8f371f236f6)


##### 탈퇴 30일 후 계정영구삭제

> - DBMS Scheduler을 통한 자동화
> - 매일 밤 12시에 탈퇴신청 30일된 계정을 자동 삭제

![탈퇴30일후_계정영구삭제](https://github.com/user-attachments/assets/a604f0a6-e4b8-467c-93bc-93f03c9169ef)

<details>
<summary>계정 자동영구삭제 SQL문</summary>

    -- 탈퇴신청 30일 후 계정영구삭제, 안쓰는 커플코드 영구삭제. 매일 밤 12시에 실행됨 
    BEGIN
        DBMS_SCHEDULER.create_job (
            job_name        => 'DELETE_INACTIVE_MEMBERS_JOB',
            job_type        => 'PLSQL_BLOCK',
            job_action      => 'BEGIN
                                    DELETE FROM C_MEMBER
                                    WHERE status = ''N''
                                    AND modify_date <= SYSDATE - 30;

                                    DELETE FROM C_COUPLE
                                    WHERE couple_code IN (
                                        SELECT cc.couple_code
                                        FROM C_COUPLE cc
                                        LEFT JOIN C_MEMBER cm ON cc.couple_code = cm.couple_code
                                        WHERE cm.couple_code IS NULL
                                    );
                                END;',
            start_date      => SYSTIMESTAMP,
            repeat_interval  => 'FREQ=DAILY; BYHOUR=0; BYMINUTE=0; BYSECOND=0',
            enabled         => TRUE
        );
    END;
    /
    
</details>


##### 커플 등록/삭제

> 커플 등록

![myPage_couple_register](https://github.com/user-attachments/assets/87962db5-1f48-4c85-8894-d4de7084c268)

> 계정 삭제 & 커플 해제

![myPage_cancelAccount](https://github.com/user-attachments/assets/8ea8dc5b-92a0-4ce2-a522-9c630141c4a4)


##### 회원 조회/변경

![myPage_edit](https://github.com/user-attachments/assets/9fbcff9b-05ef-40da-a1d3-9e7377fa5486)


#### 🔴 홈 

##### 커플정보 조회/수정

![memberHome_edit](https://github.com/user-attachments/assets/13611d1f-c504-475c-a37a-ddfb039e5f91)

##### 로그인 전/후 화면구현

> 로그인 전

![guestHome](https://github.com/user-attachments/assets/9bd048f1-e3c6-4067-902f-3a4ca8d6bc18)

> 로그인 후
> - 만난지 몇일인지 D-DAY 카운트 기능 포함

![memberHome](https://github.com/user-attachments/assets/4a5d9caf-3682-4be0-aeb6-e479db097fc9)

## 🔑 ERD 설계
![erd_mypart](https://github.com/user-attachments/assets/37dfe827-fe33-496b-9274-4d2a53bcd8eb)

> - 빨간색으로 마킹된 부분을 담당하였습니다.
> - 외부 library 및 api 사용에 초점을 맞춰서 상대적으로 적은 DB테이블을 사용하였습니다.

## 🔎 개발 환경
- **Back-End** : Java 11, JSP & Servlet, Spring, Mybatis
- **DBMS** : Oracle
- **WAS** : Apache Tomcat 9.0
- **Front-End** : HTML5, CSS3, JavaScript, JQuery, Ajax
- **Tool** : STS, Eclipse, SQL Developer, Visual Studio
- **Collaboration** : Git, SourceTree
- **OS** : Windows 10

## 🕓 개발 기간: 2024.09.11 ~ 2024.10.25
- 2024.09.11 ~ 2024.09.18 : 프로젝트 주제 선정
- 2024.09.19 ~ 2024.09.22 : 요구사항 분석 및 구현할 목표 설정
- 2024.09.23 ~ 2024.10.03 : 화면 설계 및 데이터 설계
- 2024.10.04 ~ 2024.10.24 : 화면 구현, 기능개발, 프로젝트 검수 및 테스트
- 2024.10.25 : 프로젝트 발표

## ℹ️ 참고
- 총 4명이 진행한 프로젝트 입니다.<br>
- 프로젝트 전체에 대한 설명은 다음 링크를 참고해주세요.
    - https://github.com/cbher4444/FinalProject
