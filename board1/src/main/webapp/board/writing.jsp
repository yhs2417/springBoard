<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<meta name='viewport' content="width=device-width,initail-scale=1">	
<title></title>
</head>
<body onload="form1.header.focus()">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<h4 class="border-bottom mx-5 pt-3"> 글 작성 </h4>

<div class='container pt-3'>

<form class="form" method='post' action='writing.do' target="_top" name="form1">

	<div class="form-group row">
		<label for="header" class="col-sm-2 col-md-2 text-center">제목</label>
		<input class="form-control form-control-sm col-sm-6 col-md-6" 
				type='text' name='header' value='${data}' required>
	</div>
	
	<div class="form-group row">
		<label for="content" class="col-sm-2 col-md-2 text-center">내용</label>
	 	<textarea class="form-control form-control-sm col-sm-6 col-md-6" 
	 			rows="10" name='content' value="123" required> </textarea>	
	</div>
	
	<div class="form-group row">
		
		<input class="form-control form-control-sm col-sm-8 col-md-8 text-center" 
				type="submit" value='작성하기'>
	</div>
	 
</form>
</div>

</body>
</html>