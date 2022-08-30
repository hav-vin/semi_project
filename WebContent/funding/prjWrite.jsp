<%@page contentType="text/html;charset=utf-8" import="java.util.*, semi2.funding.mvc.domain.Board"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Write</title>
		<meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="../css/main.css"/>
		<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">

    <style>
    a{  /* 링크 부분에 밑줄 부분 제거*/
        text-decoration: none !important;
    }
    /* common header*/    
    .header_menu{
        padding: 20px  40px;
        position: fixed;
        top:0;
        width: 100%;
        z-index:2;
        background-color: white;
        border-bottom: solid 2px rgb(209, 209, 209);
    }

    .header_menu :after{
        display: block;
        clear: both;
    }

    .header_icon{
        margin-top: 5px;
        float: left;
        text-align: center;
        margin-left: 20px;
        width:auto;
    }
    .header_icon a img{
    	max-width:100%;
    	height: 65px;
    }
    #nav{
        float: right;
        width: auto;
        list-style: none;
    }

    #nav ul{
        margin: 0;
        padding: 0;
        list-style: none;
    }

    #nav ul :after{
        display: block;
        clear: both;
    }
    
    #nav button{
        margin-top: 10px;
        display: block;
        padding: 10px;
        color: rgb(255, 255, 255);
        font-size: 14px;
        text-decoration: none;
    }

    </style>
	</head>
	<body style="background: #f7f7f7">
		<center>
		<div>
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
		</center>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script> 
     
			<!-- Main -->
				<section id="main">
				<form name="f" method="post" action="funding.do?m=upload" enctype="multipart/form-data">
					<div class="container" style="margin-top:100px">
							<div class="col-8 col-12-medium">

							<!-- Content -->
							
								<article class="box post">
									<a href="#" class="image featured"><img src="../img/pic01.jpg" alt="" /></a>
									<header style="margin-left:30px;margin-right:850px">
										<h2>Project Regist</h2>
										<p>프로젝트 등록</p>
										<hr></hr>
									</header>
									
									<br/><br/><br/>
								
										<div class="form-group" style="margin-left:100px">
												<div style="float:left; margin-right:150px">
											   		<label for="inputsubject">Project name</label>
											   		<input type="psubject" class="form-control" name="psubject" id="psubject" size="60" placeholder="프로젝트 제목">
											   		<input style="margin-top:10px" type="pmoney" class="form-control" name="pmoney" id="pmoney" size="60" placeholder="프로젝트 목표금액">
												</div>
												<div>
											   		<label for="intputfile">썸네일</label>
											   		<input type="file" name="piname" id="piname" accept=".jpg, .jpeg, .png">
												    <p class="help-block">프로젝트 썸네일 첨부</p>
												</div>
												
										</div>
										
									<br/>
										
										<div class="form-group" style="margin-left:100px">
												<div style="margin-right:150px">
													<hr></hr></br>
											   		<label for="inputcontent">Project Content</label>
											   		<textarea class="form-control" name="pcontent" id="pcontent" placeholder="프로젝트 소개" rows="7"></textarea>
												</div>												
										</div>
										
										<div class="form-group" style="margin-left:100px;margin-right:150px">
												</br><hr></hr></br>
											    <label for="intputfile">File</label>
											    <input type="file" id="pconiname" name="pconiname" accept=".jpg, .jpeg, .png">
											    <p class="help-block">프로젝트 내용 첨부</p>
										</div>
										
										<div class="form-group" style="margin-left:100px;margin-right:150px">
												</br><hr></hr></br>
												
												<div style="float:left; margin-right:60px">
													<input type="item1" class="form-control" id="item1" name="item1" size="60" placeholder="1. 상품구성">
												</div>
												<div style="float:left" >
													<input type="price1" class="form-control" id="price1" name="price1" size="30" placeholder="1. 상품가격">
												</div>
												
												<div style="float:left; margin-right:60px; margin-top:10px">
													<input type="item2" class="form-control" id="item2" name="item2" size="60" placeholder="2. 상품구성">
												</div>
												<div style="float:left; margin-top:10px" >
													<input type="price2" class="form-control" id="price2" name="price2" size="30" placeholder="2. 상품가격">
												</div>
												
												<div style="float:left; margin-right:60px; margin-top:10px">
													<input type="item3" class="form-control" id="item3" name="item3" size="60" placeholder="3. 상품구성">
												</div>
												<div style="float:left; margin-top:10px" >
													<input type="price3" class="form-control" id="price3" name="price3" size="30" placeholder="3. 상품가격">
												</div>
												
												</br>	</br>	</br>
										</div>
										
										<div class="form-group" style="float:right;margin-right:150px;margin-top:50px">
											   <button type="submit" class="btn btn-info">Submit</button>
											  
										</div>
											</br>	</br>	</br>	</br>	</br>	</br>	</br>
									
								
								</article>
								
						</div>
					</div>
					 </form>	
				</section>

		<!-- Scripts -->
			<script src="../js/jquery.min.js"></script>
			<script src="../js/jquery.dropotron.min.js"></script>
			<script src="../js/browser.min.js"></script>
			<script src="../js/breakpoints.min.js"></script>
			<script src="../js/util.js"></script>
			<script src="../js/main.js"></script>
			
		<center>
			<footer style="background: #f7f7f7">
		      <div class="container">
		        <div class="row">
		          <div class="col-md-12">
		            <div class="inner-content">
		              <p>Copyright &copy; 젊피중피 Co., Ltd.</a></p>
		              <br/>
		            </div>
		          </div>
		        </div>
		      </div>
		    </footer>
		</center>
	</body>
</html>