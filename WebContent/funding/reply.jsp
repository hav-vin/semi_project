<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상단메뉴</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">

<style>
#reply_add_div {
	margin: 10px 0 0 0;
}

#reply_add_div textarea {
	resize: none;
}

#reply_add_div button {
	margin: 10px 0;
	width: 100%;
}

.commu_all_area {
	margin-top: 20px;
}

#commu_all_area{

}

.reply_area {
	margin: 20px 0;
}

.icon_div_id p b {
	margin-left: 20px;
}

.icon_div {
	float: left;
}

.reply_body {
	clear: both;
	display: flow-root;
	margin-top: 30px;
}
</style>
</head>
<body>
	<div id="reply_add_div">
<%-- 		<p>${Replylist.pnum}</p> --%>
		<h4>댓글 작성</h4>
		<c:if test="${ !empty loginUser}">
		<form method="post" id="form_attr" name="reply_form_nm">
			<textarea name="reply_cont" id="reply_cont_id" class="form-control"
				placeholder="댓글을 작성해주세요" required></textarea>
			<button id="reply_btn" class="btn btn-primary">댓글 작성</button>
		</form>
		</c:if>
		<c:if test="${ empty loginUser}">
		<form method="post" id="form_attr" name="reply_form_nm">
			<textarea name="reply_cont" id="reply_cont_id" class="form-control"
				placeholder="로그인을 해주세요" readonly></textarea>
			<button id="reply_btn" class="btn btn-primary" disabled="disabled">댓글 작성</button>
		</form>
		</c:if>
	</div>

	<c:if test="${ empty Replylist.comlist}">
		<div class="commu_all_area">
			<h3>데이터가 없음</h3>
		</div>
	</c:if>
	
<div id="commu_all_area">
	<c:forEach items="${ Replylist.comlist }" var="board">
		
			<!-- 해당 div 반복하기-->
			<div>
				<!--c:if로 글쓴이 본인이면 해당 버튼이 나오게 아니면 다른 버튼-->
				<button class="btn btn-info" disabled="disabled">댓글 업데이트</button>
			</div>
			<div class="reply_area">
				<div class="icon_div">
					<i class="fas fa-user-circle fa-4x"></i>
				</div>
				<div class="icon_div_id">
					<p>
						<b>${ board.cname }</b>
					</p>
				</div>
			</div>

			<div class="reply_body">
				<br />
				<p>${ board.ccontent }</p>
			</div>
		
	</c:forEach>
</div>

<div id="paging_div">
	<c:forEach begin="1" end="${Replylist.totalPageCount}" var="i">
<%-- 		<a href="funding.do?m=reply&cp=${i}">  --%>
	
		<a> 
			<c:choose>
				<c:when test="${i==Replylist.currentPage}">
					<strong class="repl_paging">${i}</strong>
				</c:when>
				<c:otherwise>
             		<span class="repl_paging">${i}</span> 
           		</c:otherwise>
			</c:choose>
		</a>&nbsp;
	</c:forEach>
</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<script>
   		$(document).ready(function(){
   			$("#reply_btn").click(function(){
   				$("#form_attr").attr("action", "funding.do?m=replyOk&pnum=${Replylist.pnum}");
   			});
   			
   	        $('#reply_cont_id').on('keyup', function(){
   	            if($(this).val().length > 100){
   	                alert("글자수 제한 100자를 넘었습니다.");
   	                $(this).val($(this).val().substring(0, 100));
   	            }
   	        });
   	           	        
   	        $(".repl_paging").click(function(){
//    	        	console.log($(this)[0].innerText);
				var paging_num = $(this)[0].innerText;
				$.ajax({
					type:'get',
   					url:'funding.do?m=reply&cp='+paging_num+"&pnum=${Replylist.pnum}",
   					dataType: 'html',
// 					cache: false,
   					success: function(result){
   						$(".commu_all_area").empty();
   						$("#commu_all_area").empty();
   						$("#paging_div").empty(); 
   						$("#reply_add_div").empty();
   						$("#commu_all_area").html(result);
//    						console.log(result);
   					},
   					error: function(err){
   						console.log(err);
   					}
   				});	
   	        });
   	        
   		});
   </script>
</body>
</html>











