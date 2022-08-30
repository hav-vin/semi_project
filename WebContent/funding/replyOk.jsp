<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script language='javascript'>
	if(${flag}){
    	alert("댓글이 작성되었습니다");
    }else{
    	alert("댓글 작성 실패");
    }

 	location.href='funding.do?m=fund_content&pnum=${replyOkPnum}'; 
</script>
