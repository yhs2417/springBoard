<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring 게시판</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<meta name='viewport' content="width=device-width,initail-scale=1">	

<style>
	
	body
	{
		font-family: 'Helvetica Neue', Helvetica, Arial, "맑은 고딕", "Malgun gothic", sans-serif;	
	}
    @media (max-width: 767px)
    {
	    #ftp1 .nav-item .nav-link {padding-left:1px;}
	    #menu .nav-item .nav-link {padding-left:5px; padding-right:5px}
	    #nav1 {padding-left:1px ; padding-right:1px ;}
    }
    @media (min-width: 768px)
    {
       #ftp1 { padding-left: 20px}
    }
 	
</style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
<nav class="navbar navbar-light bg-white fixed-top border-bottom border-dark">
	<div class="container" id="nav1">	
	<a class ='navbar-brand' href ='/board1/index.jsp' target="_top">
	<i class="fas fa-home text-body"></i>
	</a>
	<ul class="navbar-nav ml-3 mr-auto" id="ftp1">
	<li class="nav-item">
		<a class="nav-link text-body" href="ftp://hyunnn.kr" target="_blank">FTP</a>
	</li>
	</ul>
	<ul class ='nav nav-pills ml-auto' id="menu">
		<c:if test="${session_id==null}">
		<li class="nav-item">
			<a class="nav-link" href="../member/login.jsp" target="main">로그인</a>
		</li>
		<li class='nav-item'>
			<a class='nav-link' href='../member/signup.jsp' target="main">회원가입</a>
		</li>
		</c:if>
	
		<c:if test="${session_id !=null }">

		<li class="nav-item">
			<a class="nav-link" href="logout.do" target="_top">로그아웃</a>
		</li>
		<li class='nav-item'>
			<a class='nav-link' href='withdrawal.do' target="_top">회원탈퇴</a>
		</li>
		</c:if>
		
      </ul>  
	</div>
</nav>

</body>
</html>