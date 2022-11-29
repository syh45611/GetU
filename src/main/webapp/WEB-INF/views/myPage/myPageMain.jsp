<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="resources/myPageCSS/myPageMain.css">
<script class="u-script" type="text/javascript"	src="resources/bootstrap/js/jquery.js" defer=""></script>
<script type="text/javascript">
	function showCon(id) 
	{
		location.href = id + ".do";
	}
	/* 회원탈퇴 */
	function del(){
		var con = confirm("탈퇴 하시겠습니까?");
		if(con) location.href="delete.do";
		else alert("탈퇴가 취소 되었습니다.");
	}
</script>
<style type="text/css">
	#myReservation 
	{
		width : 170px;
		height : 48px;
		left : 28px;
		padding : 12px;
		list-style: none; 
		display: flex;
		text-align : center;
	}
	
	#myReview 
	{ 
		width : 170px;
		height : 48px;
		left : 48px;
		padding : 12px;
		list-style: none; 
		display: flex;
		text-align : center;
	}

	a
	{
		text-decoration : none;
	}
</style>
<div class="menu">
	<ul style="position:relative; left:64px;">
		<li>
			<img alt="프로필사진" src="resources/images/0.png">
		</li>
		<li class="profile_txt">
			<h2 style="font-size:28px; font-weight:bold; padding-top:8px;">  ${member.memberName}  </h2>
			<div style="padding:2px; margin:2px;">
				<a href="updateForm.do?memberNo=${member.memberNo}&memberId=${memberId}">
					<img style="width:44px;" alt="비번수정" src="resources/images/passUpdate.png">
					<span style="position:relative; bottom:12px;">비밀번호 수정</span>
				</a>
			</div>
			<div style="padding:2px; margin:2px;">
				<a href="reviewForm.do?memberNo=${member.memberNo}">
					<img style="width:44px;" alt="리뷰작성" src="resources/images/reviewWrite.png">
					<span style="position:relative; bottom:12px;">리뷰 작성</span>
				</a>
			</div>
			<div style="padding:2px; margin:2px;">
				<a href="reviewUpdateForm.do?memberNo=${member.memberNo}">
					<img style="width:44px;" alt="리뷰수정" src="resources/images/reviewUpdate.png">
					<span style="position:relative; bottom:12px;">리뷰 수정</span>
				</a>
			</div>
			<div style="padding:2px; margin:2px;">
				<a href="#" onclick="del()">
					<img style="width:44px;" alt="회원탈퇴" src="resources/images/memberDelete.png">	
					<span style="position:relative; bottom:12px;">회원 탈퇴</span>			
				</a>
			</div>
		</li>
		<li class="category">
			<ul>
				<li id="myReservation" onclick="showCon(this.id)">
					<span class="dot"></span>결제목록 보기<span class="point-color"></span>
				</li>
				<li id="myReview" onclick="showCon(this.id)">
					<span class="dot"></span>리뷰목록 보기<span class="point-color"></span>
				</li>
			</ul>
		</li>
	</ul>
</div>