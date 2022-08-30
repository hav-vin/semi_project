<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상단메뉴</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/font.css">
    <style>
    div{font-family: 'S-CoreDream-3Light', sans-sesrif;}
a { /* 링크 부분에 밑줄 부분 제거*/
	text-decoration: none !important;
}
/* common header*/
.header_menu {
	padding: 20px 40px;
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 2;
	background-color: white;
	border-bottom: solid 2px rgb(209, 209, 209);
}

.header_menu :after {
	display: block;
	clear: both;
}

.header_icon {
	margin-top: 5px;
	float: left;
	text-align: center;
	margin-left: 20px;
	width: auto;
}

.header_icon a img {
	max-width: 100%;
	height: 65px;
}

#nav {
	float: right;
	width: auto;
	list-style: none;
}

#nav ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

#nav ul :after {
	display: block;
	clear: both;
}

#nav button {
	margin-top: 10px;
	display: block;
	padding: 10px;
	color: rgb(255, 255, 255);
	font-size: 14px;
	text-decoration: none;
}

#ptj_sub {
	margin-top: 130px;
	text-align: center;
}
/* 펀딩 몸통 css*/
#body_funding {
	margin-top: 20px;
	width: 100%;
}

#body_lft {
	width: 65%;
	float: left;
}

#body_right {
	width: 35%;
	float: right;
}

#lft_header {
	height: 500px;
	margin: 20px 20px;
	text-align: center;
}

#lft_header img {
	max-width: 100%;
	height: 500px;
}

#lft_body {
	height: 600px;
	/*border: 1px solid #000;*/
	margin: 20px 20px;
}

#lft_body_head {
	
}

#lft_body_head p {
	float: left;
	margin-right: 25px;
	color: white;
}

#lft_body_bdy {
	
}

#lft_body_bdy_image {
	text-align: center;
}

#lft_body_bdy img {
	max-width: 100%;
	height: 300px;
}
/* 오른쪽 몸통 영역*/
#bdy_right_head {
	margin: 20px 30px;
}

#right_head_top {
	text-align: left;
	/*height: 500px;*/
}
/*
    #bdy_right_head textarea{
        width: 100%;
        overflow-y:auto;
        resize: none;
    }
    */
#done_btn {
	margin: 10px 0;
	width: 100%;
}

#done_reset {
	margin: 10px 0;
	width: 100%;
}

#bdy_right_bdy {
	margin: 0 30px;
}

#bdy_right_bdy button {
	width: 100%;
	padding: 40px 20px;
	margin: 20px 0;
}

#bdy_right_bdy button p {
	white-space: pre-line;
}


</style>
</head>
<body>
    <div class="header_menu">
        <div class="header_icon">
            <a href="../index.do"><img src="../img/crowd.png"></a>       
        </div>
        <ul id="nav">
        	<c:if test="${ empty loginUser}">
          	  <button class="btn btn-info clsbtn" onclick="location.href='funding.do?m=form'">로그인/회원가입</button>
        	</c:if>
        	<c:if test="${ !empty loginUser}">
            	<button class="btn btn-warning clsbtn" onclick="location.href='funding.do?m=out'">로그아웃</button>
        	</c:if>
        </ul>  
    </div>

    <div id="ptj_sub">
        <h1>${fcontent.fundingprj.psubject}</h1>
    </div>
    <div id="body_funding">
        <div id="body_lft">
            <div id="lft_header">
                <img src="../img/${fcontent.fundingprj.piname}" alt="">
            </div>
            <div id="lft_body">
            	<hr></hr>
                <div class="panel panel-primary">                
                    <div class="panel-heading" id="lft_body_head">
                        <a id="infor"><p>소개</p></a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a id="commu"><p>커뮤니티</p></a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a id="notice"><p>공지사항</p></a>
                    </div>
                    <div class="panel-body" id="lft_body_bdy">
                    	<div id="ajax_div">
           
                        <div id="lft_body_bdy_image">
                            <img src="../img/${fcontent.fundingprj.pconiname}" alt="" style="weight:800px;height:auto">
                        </div>
                        
                        <h2>${fcontent.fundingprj.psubject}</h2>
						<p>${fcontent.fundingprj.pcontent}</p>
                        <br/>
                    
                    	</div>
                    </div>
                  </div>
            </div>
        </div>
        <div id="body_right">
            <div id="bdy_right_head">
                <!--<textarea class="form-control" name="" id="" cols="30" rows="10"></textarea> -->
                <div id="right_head_top">
                    <p>목표 금액</p>
                    <h2>${fcontent.fundingprj.pmoney} 원</h2>
                    <p>남은 시간</p>
                    <h2>30 일</h2>
                    <p>모인 금액</p>
                    <h2>${fcontent.fundingprj.pamount}원 &nbsp;&nbsp;<b>${((fcontent.fundingprj.pamount/fcontent.fundingprj.pmoney)*100) - ((fcontent.fundingprj.pamount/fcontent.fundingprj.pmoney)*100)%1} %</b></h2>
<%--                    <h2>${fcontent.fundingprj.pamount}원 &nbsp;&nbsp;<b>${((fcontent.fundingprj.pamount/fcontent.fundingprj.pmoney)*100)} %</b></h2> --%>
                    <h2 id="amount_p"></h2>
                    <p>후원자 수</p>
                    <h2>${fcontent.fundingprj.fundcount} 명</h2>
                </div>
<%--                 <button id="done_btn" class="btn btn-info" onclick="location.href='funding.do?m=don_apply&pnum=${fcontent.fundingprj.pnum}'">후원 적용</button> --%>
            	 <button id="done_btn" class="btn btn-info">후원 적용</button>
            	 <c:if test="${ !empty loginUser}">
           		 	<button id="done_reset" class="btn btn-info">후원 리셋</button>
           		 </c:if>
           		 <c:if test="${ empty loginUser}">
           			 <button id="done_reset" class="btn btn-info" disabled="disabled">후원 리셋</button>
           		 </c:if>
           		 <br/><br/><br/>
            </div>
            <div id="bdy_right_bdy" style="margin-top:32px">
            	<c:if test="${ !empty loginUser}">
            	<c:forEach items="${fcontent.ilist}" var="fund_btn">
            		<button class="btn btn-default donate_btns">
            			<input type="hidden" name="inum_name" value="${fund_btn.inum}">
            			<p> 후원금액 - </p>
                    	<p>${fund_btn.price}원</p>
                    	<br/>
                    	<p>해당 물품 : ${fund_btn.ilineup}</p>
                    	<p></p>
            		</button>
            	</c:forEach>
            	</c:if>
            	
            	<c:if test="${ empty loginUser}">
            	<c:forEach items="${fcontent.ilist}" var="fund_btn">
            		<button class="btn btn-default donate_btns" disabled="disabled">
            			<input type="hidden" name="inum_name" value="${fund_btn.inum}">
            			<p> 후원금액 - </p>
                    	<p>${fund_btn.price}원</p>
                    	<br/>
                    	<p>해당 물품 : ${fund_btn.ilineup}</p>
                    	<p></p>
            		</button>
            	</c:forEach>
            	</c:if>
            </div>
        </div>
    </div>

   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   <script src="../bootstrap/js/bootstrap.min.js"></script>
   <script>
   		var btn_flag = false;
   		var add_money;
   		var this_btn;
   		
     	$(document).ready(function(){
   			$(".donate_btns").click(function(){
//    				console.log($(this)[0].childNodes[5].innerText);
   				this_btn = $(this)[0].childNodes[1].value;
   				console.log(this_btn);
   				add_money = $(this)[0].childNodes[5].innerText;
   				$("#amount_p").append("<p>추가된 금액 : "+ add_money +"</p>");
   				
   				$(".donate_btns").prop("disabled", true);
   				$(".donate_btns").attr("disabled","disabled");

   				btn_flag = true;
   			});
   			
   			$("#done_reset").click(function(){
   				$("#amount_p").empty();
   				
   				$(".donate_btns").prop("disabled", false);
   				$(".donate_btns").removeAttr("disabled");
   				btn_flag = false;
   			});
   			
   			
   			$("#done_btn").click(function(){
   				if(btn_flag == true){
   					//var lastChar = fullStr.charAt(fullStr.length-1); //열   
   					console.log(add_money);
   					var remv_add_money = add_money.slice(0,-1); 
   					console.log(remv_add_money);
   					location.href="funding.do?m=don_apply&pnum=" + ${fcontent.fundingprj.pnum} +"&addmoney="+remv_add_money+"&ditem=" + this_btn +"&did=${fcontent.fundingprj.pid}";

   				}
   				else{
   					console.log("적용안됨");
   				}
   			});
   			
   			$("#commu").click(function(){
   				var var_pnum = ${fcontent.fundingprj.pnum};
   				console.log(var_pnum);
   				$.ajax({
   					type:'get',
   					url:'funding.do?m=reply&pnum='+var_pnum,
   					dataType: 'html',
   					success: function(result){
   						$("#ajax_div").html(result);
   						console.log(result);
   					},
   					error: function(err){
   						console.log(err);
   					}
   				});
   			});
   			$("#infor").click(function(){
   				var var_pnum = ${fcontent.fundingprj.pnum};
   				$.ajax({
   					type:'get',
   					url:'funding.do?m=infor&pnum='+var_pnum,
   					dataType: 'html',
   					success: function(result){
   						$("#ajax_div").html(result);
   						console.log(result);
   					},
   					error: function(err){
   						console.log(err);
   					}
   				});
   			});
   			$("#notice").click(function(){
   				var var_pnum = ${fcontent.fundingprj.pnum};
   				$.ajax({
   					type:'get',
   					url:'funding.do?m=list&pnum='+var_pnum+ "&pid=${fcontent.fundingprj.pid}",
   					dataType: 'html',
   					success: function(result){
   						$("#ajax_div").html(result);
   						console.log(result);
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
    










