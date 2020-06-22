<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  
  <!-- Bootstrap4 start-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <!-- Bootstrap4 end-->

<title>피노 인사시스템</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container" style="display: flex; justify-content: center; align-items: center; height: 100vh">
    	<div class="grid" style="margin-bottom:100px;">
			<div class="row" style="margin-bottom:50px;">
        		<h1 class="display-4">Pino Insa System</h1> 
    		</div>
     		<div class="row" style="margin-left:100px; text-align:center;">
        		<button type="button" class="btn btn-info" onClick="location.href='/InputForm.do'">Input</button> &nbsp;&nbsp;<button type="button" onClick="location.href='/SearchForm'" class="btn btn-danger">Search</button>
    		</div>
		</div>
	</div>
</body>
</html>
