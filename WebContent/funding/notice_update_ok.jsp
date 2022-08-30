<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		
<script language='javascript'>
	if(${flag}){
		alert("수정 되었습니다");
	}else{
		alert("수정 실패"); 
	}
	location.href='funding.do?m=fund_content&pnum=${nporject_nm}'; 
	
</script>
