<%@page contentType="text/html;charset=utf-8"
 import="java.util.*,semi2.funding.mvc.domain.Notice , semi2.funding.mvc.vo.ListResult"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua|Nanum+Gothic+Coding" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<title>공지사항</title>
<style>

#list{
	margin-top: 20px;
}
.thead-dark tr th{
	text-align: center;
}

#page{
	text-align: center;
	margin-bottom: 20px;
}
#psId{
	width: 20%;
    display: inline-block;
}

#search_form{
	display:flex;
/* 	margin-left:20px; */
}
#search_form select{
	width: 25%;
}
#search{
	width: 55%;
}
#notice_search_btn{
	width: 20%;
}
</style>
</head>
<body>
<div id="all">

	<div id="table">
		<c:if test="${listResult.noticePid == u_id}">
			<button type="button" class="btn btn-info" id="notice_write_btn">글쓰기</button>
		</c:if>

	</div>

	<div id="list" class="table-responsive">
		<table class="table table-sm table-hover">
		  <thead class="thead-dark">
		    <tr>
		      <th id="table1" scope="col">글번호</th>
		      <th id="table2" scope="col">제목</th>
		      <th id="table3" scope="col">작성자</th>
		      <th id="table4" scope="col">작성일</th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:if test="${empty listResult.list}">
				<TR align='center' noshade>
				     <TD colspan="5"> 데이터가 없음 </TD>
				</TR>
			</c:if>
			<c:forEach items="${listResult.list}" var="notice">
				    <TR align='center' noshade>
						<TD>${notice.num}</TD>
						<TD> <a class="notice_cont_read">${notice.nsubject}<input type="hidden" value="${notice.nporject }"><input type="hidden" value="${notice.num }"></a></TD>		
						<TD>${notice.nid}</TD>
					    <TD>${notice.ndate}</TD>
			
					 </TR> 
			</c:forEach>
		  </tbody>
		</table>
	</div>
	<div id="page">
	<hr width='600' size='2' color='gray' noshade>
<font color='gray' size='3' face='휴먼편지체'>
	<c:forEach begin="1" end="${listResult.totalPageCount}" var="i">
		<a> 
			<c:choose>
				<c:when test="${i==listResult.currentPage}">
					<strong class="repl_paging">${i}</strong>
				</c:when>
				<c:otherwise>
             		<span class="repl_paging">${i}</span> 
           		</c:otherwise>
			</c:choose>
		</a>
	</c:forEach>
	
</font>
</div>
			<form method="get" id="search_form">
				<select name="category_nm" class="form-control">
					<option name="not_tit_nm" value="not_tit">글제목</option>
				</select> 
				<input id="search" type="text" class="form-control" name="search_name" required>
				<button id="notice_search_btn" type="button" class="btn btn-info">검색</button>
			</form>

</div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <script>
    	$(document).ready(function(){
   	        $(".repl_paging").click(function(){
			var paging_num = $(this)[0].innerText;
			$.ajax({
				type:'get',
					url:'funding.do?m=list&cp='+paging_num+"&pnum=${listResult.pnum}&pid=${listResult.noticePid}",
					dataType: 'html',
					success: function(result){
						$("#all").html(result);
					},
					error: function(err){
						console.log(err);
					}
				});	
	        });
   	        
   	        $("#notice_write_btn").click(function(){
				$.ajax({
					type:'get',
						url:"funding.do?m=n_write&pnum=${listResult.pnum}",
						dataType: 'html',
						success: function(result){
							$("#all").html(result);
						},
						error: function(err){
							console.log(err);
						}
					});	
		        });
   	        
   	        $(".notice_cont_read").click(function(){
				var pnum = $(this)[0].childNodes[1].value;
   	        	var nproject = $(this)[0].childNodes[2].value;
   	        	
	        	console.log(pnum);
	        	console.log(nproject);
	        	
				$.ajax({
					type:'get',
						url:"funding.do?m=ncontent&num="+pnum+"&nproject="+nproject,
						dataType: 'html',
						success: function(result){
							$("#all").html(result);
						},
						error: function(err){
							console.log(err);
						}
					});	
		        });
   	        $("#notice_search_btn").click(function(){
   	        	var select_el = $('#search_form [name="category_nm"]').val();
   	        	var search_el = $('#search_form [name="search_name"]').val();
				if(search_el != ""){
				// 여기부터 셀렉트찾기 하기
					$.ajax({
						type:'get',
						url:"funding.do?m=not_search&sel="+select_el+"&ser="+search_el+"&pnum=${listResult.pnum}&pid=${listResult.noticePid}",
						dataType: 'html',
						success: function(result){
							$("#all").html(result);
						},
						error: function(err){
							console.log(err);
						}
					});		
				}
				else if(search_el == ""){
					console.log("내용없음");
				}

   	        });
    	});
    </script>
</body>
</html>