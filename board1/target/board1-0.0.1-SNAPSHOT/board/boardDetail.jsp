<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function isUpdating(bdto)
{
	System.out.println("자바스크립트진입");
	if (${session_id}=="")
	{ alert("로그인이 필요합니다");
		location.href="../member/login.jsp";
	}
else
	{
	request.setAttribute("bdto",bdto);
	RequestDispatcher rd=request.getRequestDispatcher("updating.jsp");
	rd.forward(request,response);
	}
}
 
</script>

</head>
<body>

<table border="1">
	<tr>
		<td>글번호</td>
		<td>${bdto.seq}</td>
	</tr>
	<tr>
		<td>글제목</td>
		<td>${bdto.header}</td>
	</tr>
	<tr>
		<td>글내용</td>
		<td>${bdto.content}</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>${bdto.author}</td>
	</tr>
	<tr>
		<td>작성일</td>
		<td>${bdto.logtime}</td>
	</tr>
</table>
<br><br>
<a href="index.jsp?page=1">홈으로</a>

<!-- 로그인필요..bdto로 자료 보내기..js로 함수 만들어서 setattribute? -->
<a href="#" onclick="isUpdating(${bdto})">글수정</a> 

<a href="deleting.do?seq=${bdto.seq}">글삭제</a>

</body>
</html>