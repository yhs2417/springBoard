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
<script>

function rewrite()
{	
	if ('${session_id}'=="")
	{ 
		location.href="/board1/member/login.jsp";
	}
	else if (('${session_id}'!= null) && ('${session_id}'!= '${bdto.author}')) 	
	{
		alert("작성자 본인만 수정이 가능합니다");
	}
	
	else if (('${session_id}'!= null) && ('${session_id}'== '${bdto.author}')) 	
	{	
		window.top.location.href="rewrite.do?seq=${bdto.seq}";	 	
	}
	return false;
}
function deleting()
{
	if ('${session_id}'=="")
	{
		location.href='/board1/member/login.jsp';
	}
	else if (('${session_id}'!= null) && ('${session_id}'!= '${bdto.author}')) 	
	{
		alert("작성자 본인만 삭제 가능합니다");
	}
	
	else if (('${session_id}'!= null) && ('${session_id}'== '${bdto.author}')) 	
	{	
		window.top.location.href="deleting.do?seq=${bdto.seq}";
	}
	return false;
}
</script>

</head>
<body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<h4 class="border-bottom mx-5 pt-3">게시판 </h4>
<div class='container pt-3'>
	<div class="text-right">
	
	<a href="" onclick="return rewrite()">수정</a>
	<a href="" onclick="return deleting()">삭제</a>
	
	</div>
</div>
<div class="container pt-2">
<div class ='table-responsive '>	
	<table class="table table-striped table-hover table-sm 
				text-center table-bordered border-dark">
		<tbody>
		<tr>
			<th scope='row'>글제목</th>
			<td>${bdto.header}</td>
		</tr>
		<tr>
			<th scope='row'>글내용</th>
			<td>${bdto.content}</td>
		</tr>
		<tr>
			<th scope='row'>작성자</th>
			<td>${bdto.author}</td>
		</tr>
		<tr>
			<th scope='row'>작성일</th>
			<td>${bdto.logtime}</td>
		</tr>
		</tbody>
	</table>
</div>
</div>

</body>
</html>