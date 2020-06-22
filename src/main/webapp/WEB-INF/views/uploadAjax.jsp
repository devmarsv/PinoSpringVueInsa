<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script>
 $(document).ready(function(){
       $("#uploadBtn").on("click", function(e){
            var formData = new FormData();
            var inputFile = $("input[name='uploadFile']");
            var files = inputFile[0].files;

            console.log(files);

           });
	 });
</script>
<title>피노 인사시스템</title>
</head>
<body>
	 <!-- <form action="uploadFormAction" method="post" enctype="multipart/form-data"> -->
	  <input type='file' name='uploadFile' multiple>
	  <button id ='uploadBtn'>Submit</button>
	 <!-- </form> -->
</body>
	
</html>
