<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>

	<!-- 커플등록 -->
	<div id="fh5co-couple" class="fh5co-section-gray">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-12 text-center heading-section" style="margin-bottom: 0;">
					<h2>😊 커플 등록을 완료하여 주세요.</h2>
					<p>커플 등록을 완료해야만 정상적으로 서비스를 사용할 수 있습니다.<br>아래 2가지 방법 중, 하나를 선택해서 진행해주세요.</p>
				</div>
			</div>
			<div class="row animate-box">
				<div class="col-md-6 text-center heading-section" style="margin-bottom: 0;">
					<h3>방법 1. 초대코드 공유</h3>
					<p>본인의 초대코드를 공유하세요.</p>
					<form class="form-inline" style="display: flex; flex-direction: column; align-items: center;">
						<div class="col-md-6 col-sm-6">
							<div class="form-group">
								<label for="name">나의 초대코드</label>
								<input type="text" class="form-control" id="myInviteCode" value="${ loginUser.inviteCode }" readonly style="width: 100%;">
								<br><br>
								<button type="submit" class="btn btn-primary btn-block">초대코드 공유</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col-md-6 text-center heading-section" style="margin-bottom: 0;">
					<h3>방법 2. 상대방 초대코드 입력</h3>
					<p>상대방의 초대코드를 입력해주세요.</p>
					<form class="form-inline" action="piccheck.me" method="post" style="display: flex; flex-direction: column; align-items: center;">
						<div class="col-md-6 col-sm-6">
							<div class="form-group">
								<label for="email">상대방 초대코드</label>
								<input type="text" class="form-control" name="inviteCode" style="width: 100%;" maxlength="15" required>
								<br><br>
								<button type="submit" class="btn btn-primary btn-block">커플등록</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 상대방 확인 Modal -->
	<c:if test="${ not empty partner }">
		<div class="modal fade" id="partnerCheckModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content" style="padding-top: 10px; margin-top: 150px;">
					<form class="form-inline" action="insert.co" method="post">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" style="font-size: 30px;">&times;</button>
							<h3 class="modal-title">커플등록 - 확인절차</h3>
						</div>
						<div class="modal-body">
							<div class="form-group" style="width: 100%;">
								<br>
								<h4>💡 상대방이 맞는지 확인해주세요.</h4>
								<table style="width: 100%;">
									<input type="hidden" name="email" value="${ partner.email }">
									<tr>
										<td>&nbsp;&nbsp;이름:</td>
										<td><input type="text" name="userName" maxlength="10" value="${ partner.userName }" readonly></td>
									</tr>
									<tr>
										<td>생년월일:</td>
										<td><input type="date" name="brithday" value="${ partner.brithday }" readonly style="width: 200px;"></td>
									</tr>
									<tr>
										<td>초대코드:</td>
										<td><input type="text" name="inviteCode" value="${ partner.inviteCode }" readonly></td>
									</tr>
								</table>
								<br>
							</div>
						</div>
						<div class="modal-footer" style="display: flex; align-items: center; justify-content: center;">
							<button type="submit" class="btn btn-primary btn-block" style="width: 100px; height: 50px; margin-right: 10px;">커플등록</button>
							<button type="button" class="btn btn-secondary btn-block" style="width: 100px; height: 50px;" onclick="onClickCancelBtn()">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<script>
			$("#partnerCheckModal").modal("show");

			// ----------------------- 커플등록 모달 취소버튼 클릭시 -----------------------
			function onClickCancelBtn(){
				$("#partnerCheckModal").modal("hide");
				invalidatePartner();
			};

			// ----------------------- 세션에 파트너 없애기 -----------------------
			function invalidatePartner(){
				$.ajax({
					url:"invalidatePartner.me",
					data:{
					}, success:function(status){
						console.log("invalidatePartner():" + status);
					}, error:function(){
						console.log("invalidatePartner() - ajax 통신 실패!");
					}
				})
			}
		</script>
	</c:if>

	<script>
		$(document).ready(function() {
			initializeInviteCode(); // 내 초대코드 세팅
		});

		// ----------------------- 기존에 내 초대코드가 없었던 경우 -----------------------
		async function initializeInviteCode() {
			if ("${loginUser.inviteCode}" === "") {
				console.log("기존에 내 초대코드가 없었던 경우!");
				let randomString;
				while(true){ // 초대코드 중복안될때까지 반복
					randomString = generateRandomString(10);
					if(await InviteCodeCheck(randomString)) { // 중복되는 초대코드가 없는경우
						break;
					}
				}
				$("#myInviteCode").val(randomString); // 화면에 뿌려주기
				updateInviteCode(randomString); // db에 반영
			}
		}

		// ----------------------- 랜덤코드 생성 -----------------------
		function generateRandomString(length) {
			const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
			let result = '';
			const charactersLength = characters.length;
			for (let i = 0; i < length; i++) {
				result += characters.charAt(Math.floor(Math.random() * charactersLength));
			}
			return result;
		}

		// ----------------------- 내 초대코드 DB 중복검사 -----------------------
		function InviteCodeCheck(randomString){
			return new Promise((resolve, reject) => {
				$.ajax({
					url:"iccheck.me",
					data:{
						inviteCode:randomString,
					}, success:function(status){
						// console.log(status);
						if (status === 'success') { // 중복안됨 -> 사용가능
							resolve(true);
						}else {  // 중복됨 -> 사용불가
							resolve(false);
						}
					}, error:function(){
						reject(new Error('InviteCodeCheck() -  ajax 통신 실패'));
					}
				})
			})
		}

		// ----------------------- 내 초대코드 DB에 업데이트 -----------------------
		function updateInviteCode(randomString){
			$.ajax({
				url:"icupdate.me",
				data:{
					inviteCode: randomString,
					email:'${loginUser.email}',
				}, success:function(status){
					// console.log(status);
					if(status === 'success') {
						console.log("초대코드 DB업데이트 완료");
					}else {
						console.log("updateInviteCode() 결과: " + status);
					}
				}, error:function(){
					console.log("초대코드 수정용 ajax 통신 실패!");
				}
			})
		}
	</script>

</body>
</html>