<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta charset="utf-8">
<title>Welcome</title>
<meta name='viewport' content="width=device-width,initail-scale=1">	
<script>

if("${msg}" != "")
{
	alert("${msg}")
}
</script>

<frameset rows="90px,*" frameborder="0">
	<frame name="header" src="/board1/board/header.jsp">
	<frame name="main" src="/board1/board/boardList.jsp">	
</frameset>
</head> 
<body>
</body>
</html>
