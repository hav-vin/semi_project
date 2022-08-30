<%@page contentType="text/html;charset=utf-8" import="semi2.funding.mvc.model.LoginSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	if(${rCode} == <%=LoginSet.NO_ID%>){
		alert("로그인 실패 ( 존재하지않는 아이디 )");
	}else if(${rCode} == <%=LoginSet.NO_PWD%>){
		alert("로그인 실패 ( 잘못된 비번 )");
	}else{
		alert("로그인 성공");
	}
	location.href="../index.do";
</script>