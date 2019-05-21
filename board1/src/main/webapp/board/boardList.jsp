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
<script type="text/javascript">
	if("${page}"=="") 
	{
	location.href="boardlist.do?page=1";
	}
	else{} 


function writing()
{
	if ('${session_id}' == "")
	{
		window.self.location.href="/board1/member/login.jsp";		
	}
	else if ('${session_id}' != null)	
	{
		window.self.location.href="writing.jsp";
	}
}
</script>
<style>
	body
	{
		font-family: 'Helvetica Neue', Helvetica, Arial, "맑은 고딕", "Malgun gothic", sans-serif;	
	}
	
	#current { color : red }
	#pages { color : black }
</style>

</head>
<body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<h4 class="border-bottom mx-5 pt-3">게시판 </h4>

<div class='container pt-3'>
	<div class="text-right">
		<a href="" onclick="writing()" >글작성</a> 
	
	</div>

	<div class ='table-responsive pt-2'>
		<table class ='table table-striped table-hover table-sm text-center'>
			<thead class='thead-dark'>
				<tr> 
					<th style="width:10%" scope='col'>글번호</th>
					<th style="width:30%" scope='col'>제목</th>
					<th style="width:20%" scope='col'>글쓴이</th>
					<th style="width:30%" scope='col'>날짜</th>
				</tr>
			</thead>
			
			<tbody>
		  		<c:forEach var="i" items="${boardlist}">
				<tr>
					<td>${i.num}</td>
					<td><a href="boardDetail.do?seq=${i.seq}">${i.header}</a></td>
					<td>${i.author}</td>
					<td>${i.logtime}</td>
				</tr>
				</c:forEach>
			</tbody>	
		</table>
	</div>
</div>

<div class='container pt-3'>
	<nav>
	<ul class="pagination justify-content-center">
	
	<c:if test="${startpg >5 }">
		<li class="page-item">
			<a class="page-link" href="boardlist.do?page=${startpg-1}">
		        <i class="fas fa-angle-left text-body"></i>
		    </a>
		</li>
	</c:if>

	<c:forEach var="i" begin="${startpg}" end="${endpg}" step="1">
		<c:if test="${page == i}">
			<li class="page-item">
	       	<a id="current" class="page-link" href="boardlist.do?page=${i}">${i}</a>
			</li>
		</c:if>
		<c:if test="${page != i}">
			<li class="page-item">
	       	<a id="pages" class="page-link" href="boardlist.do?page=${i}">${i}</a>
			</li>
		</c:if>
	</c:forEach>		 
			
	<c:if test="${endpg<totalP }">
		<li class="page-item">
	    	<a class="page-link" href="boardlist.do?page=${endpg+1}">
	    	<i class="fas fa-angle-right text-body"></i></a>
	    </li>
	</c:if>
	</ul>
	</nav>
</div>

</body>
</html>