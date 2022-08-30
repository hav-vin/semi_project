<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
<script language='javascript'>
	if(${flag}){
		alert("회원가입이 성공적으로 완료되었습니다");
		location.href='funding.do?m=form'; 
	}else{
		alert("아이디가 중복입니다.");
		location.href='funding.do?m=addmission'; 
	}
	
	
</script>
