<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<script language='javascript'>
	if(${flag}){
		alert("글쓰기 작성 완료");
		
	}else{
		alert("글쓰기 작성 실패");
	}
	location.href='funding.do?m=fund_content&pnum=${noticePnumSet}'; 
//	location.href='../index.do';
	
</script>
