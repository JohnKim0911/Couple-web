<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증코드 구현하기</title>
<head>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
    function sendNumber() {
        $("#mail_number").css("display", "block");
        $.ajax({
            url: "/api/v1/email/send",
            type: "post",
            dataType: "json",
            data: {"mail": $("#mail").val()},
            success: function (data) {
                alert("인증번호 발송");
                $("#Confirm").attr("value", data);
            }
        });
    }

    function confirmNumber() {
        let mail = $("#mail").val();
        let number = $("#number").val();

        $.ajax({
           url: "/api/v1/email/verify",
           type: "post",
            dataType: "json",
            data: {"mail": mail, "verifyCode": number},
            success: function (data, status, xhr) {
               console.log(status);
            }
        });
    }
</script>
<body>
    <div id="mail_input" name="mail_input">
        <input type="text" name="mail" id="mail" placeholder="이메일 입력">
        <button type="button" id="sendBtn" name="sendBtn" onclick="sendNumber()">인증번호</button>
    </div>
    <br>
    <div id="mail_number" name="mail_number" style="display: none">
        <input type="text" name="number" id="number" placeholder="인증번호 입력">
        <button type="button" name="confirmBtn" id="confirmBtn" onclick="confirmNumber()">이메일 인증</button>
    </div>
    <br>
    <input type="text" id="Confirm" name="Confirm" style="display: none" value="">
</body>
</html>