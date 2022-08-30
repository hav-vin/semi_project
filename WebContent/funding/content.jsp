<%@page contentType="text/html;charset=utf-8" import="java.util.*, semi2.funding.mvc.domain.Notice"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Notice ncontent = (Notice)request.getAttribute("ncontent");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua|Nanum+Gothic+Coding" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
    href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
    crossorigin="anonymous">
<title>content</title>
<style>
#content{
	width: 100%;
	height: 100%;
	margin: 0;
	
}

#content_box{	
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
	border-top: 1px solid #eee;
	border-bottom: 1px solid #eee;

}
#content_top{
	
	margin-left: 20px;
}
#content_top h6{
	margin-bottom: 10px;
}
#content_top button{
	float: left;
	margin-right: 10px;
	padding-top: 10px;
}
#line{
	border-bottom: 1px solid #eee;
	margin-right: 20px;
}

#icon{
	margin-right: 10px;
	padding: 10px;
}
#content_mid{
	margin-left: 20px;
	padding: 30px;
}
#content_bottom{
/* 	float: right; */
	text-align: center;
	margin-top: 10px;
}
</style>
</head>
<body style="margin:0;">
<div id="content">
	<div id="content_box">
		<div id="content_top">	
			<button type="button" class="btn btn-danger">공지</button>
			<h2><%=ncontent.getNsubject()%></h2>
			<h4><i id="icon" class="fas fa-user-circle fa-2x"></i><%=ncontent.getNid()%></h4>
			<h6><%=ncontent.getNdate()%></h6>
			<p id="line">
		</div>	
	
		<div id="content_mid">
			<h4><%=ncontent.getNcontent()%></h4>
		</div>
	</div>
	<div id="content_bottom">
		<c:if test="${ncontent.nid == u_id}">
			<button type="button" id="update_btn" class="btn btn-info">수정</button>
		</c:if>
		<button type="button" class="btn btn-info" onclick="location.href='funding.do?m=fund_content&pnum=<%=ncontent.getNporject()%>'">목록</button>
		<c:if test="${ncontent.nid == u_id}">
			<button type="button" class="btn btn-info" onclick="location.href='funding.do?m=ndel&nnum=<%=ncontent.getNum()%>&nproject=<%=ncontent.getNporject()%>'">삭제</button>
   		</c:if>
    </div>
</div>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <script>
    	$(document).ready(function(){
   			$("#update_btn").click(function(){
   				var nnum = ${ncontent.num};
   				console.log(nnum);
   				$.ajax({
   					type:'get',
   					url:'funding.do?m=nupdate&nnum='+nnum,
   					dataType: 'html',
   					success: function(result){
   						$("#content").html(result);
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