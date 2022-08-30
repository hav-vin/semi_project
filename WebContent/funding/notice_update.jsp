<%@page contentType="text/html;charset=utf-8"
	import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Notice</title>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 5px;
}

a {
	text-decoration: none
}

#notice_area {
/* 	width: 50%; */
/* 	height: 800px; */
/* 	padding: 70px 70px 70px 70px; */
/* 	margin: 0; */
/* 	background-color: rgb(255, 255, 255); */
}
#inputEmail3{
	resize:none;
	height: 300px;
}
#wrt_btn{
	margin-top:10px;
	width:100%;
}

</style>
<script language="javascript">
</script>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
</head>
<body onload="input.writer.focus()" style="min-width:1600px">
	<font color="black" size='4' face="굴림체">
		<center>
			<h3></h3>
			
	</font>

	<div id="notice_area">
		<h3>공지사항 글 수정</h3>
<%-- 		<p>${noticeWritePnum}</p> --%>
		<form name="input" id="write_form_id" method="post" action="funding.do?m=nupdateOk">
			<table border="0" width="600" align="center" cellpadding="0"
				cellspacing="0" bordercolor="black">
<!-- 				<form class="form-horizontal"> -->
					<input type="hidden" id="hidn_uid_id" name="hidn_uid_nm" value="${update.nid}">
					<input type="hidden" id="hidn_nnum_id" name="hidn_nnum_nm" value="${update.num}">
					<input type="hidden" id="hidn_nporject_id" name="hidn_nporject_nm" value="${update.nporject}">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label" >제목</label>
						<div class="col-sm-10">
							<input class="form-control" id="inputEmail3" name="notice_sub" type="text" style="height:34px;" value="${update.nsubject}" required>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10"></div>
					</div><br /><br />

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label" >내용</label>
						<div class="col-sm-10">
							<textarea class="form-control" id="inputEmail3" name="notice_cont" type="text" required>${update.ncontent}</textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10"></div>
					</div><br/><br/>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10" align="right">
							<button id="wrt_btn" type="submit" class="btn btn-info" >완료</button>
						</div>
					</div>
	</div id="notice_area">				
<!-- 				</form> -->
				</center>
			</table>
		</form>
		</font>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   		<script src="../bootstrap/js/bootstrap.min.js"></script>

</body>
</html>