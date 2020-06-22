<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<html>
<head>
  <meta charset="utf-8">
  <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  
  <!-- Bootstrap4 start-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <!-- Bootstrap4 end-->
  
  <!-- Bootstrap4 반응형 제거 start-->
  <style> 
  .container {
  width: 1120px;
  max-width: none !important;
  }
  </style>
  <!-- Bootstrap4 반응형 제거 end-->
  
  <!-- jQuery UI for Datepicker start-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="/resources/js//datepicker-ko.js"></script>
  <!-- jQuery UI for Datepicker End-->
  
  <!-- daum 주소 API start-->
  <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
  <!-- daum 주소 API end-->

  <!-- vue.js start -->
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
  <!-- vue.js end -->

<title>피노 인사시스템</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div id="app" style="padding:50 150 150 150px;">
		<div class="row" style="margin-left:1050px;">
        	<button type="button" v-on:click="insertSubmit" class="btn btn-info">Register</button> &nbsp;&nbsp;<button type="button" onClick="history.back();" class="btn btn-danger">Back</button>
    	</div>
  		<form action="/Insert" method="post" id="registerForm" enctype="multipart/form-data">
  			<h1 style="margin-top:50px; margin-bottom:50px;">Register Employee</h1>
  		
  			
  		 <!-- 
  		     <Layout 구성>
  	
			 01) 1행 1열 (프로필 사진)
  			 02) 1행 2열 (사번, 아이디, 전화번호 연령, 우편번호, 직위)
  			 03) 1행 3열 (한글성명, 패스워드, 핸드폰번호, 이메일, 주소1, 부서)
  			 04) 1행 4열 (영문성명, 패스워드 확인, 주민번호, 직종체크, 주소2)
  			 04) 2행 1열 (입사구분, 군별, KOSA등록)
  			 05) 2행 2열 (등급, 계급, KOSA등록)
  			 06) 2행 3열 (투입여부, 입영일자, 입사일자)
  			 07) 2행 4열 (군필여부, 전역일자, 퇴사일자)
  			 08) 3행 1열 (사업자번호)
  			 09) 3행 2열 (업체명)
  			 10) 3행 3열 (사업자등록증, 파일선택)
  			 11) 3행 4열 (PREVIEW버튼, UPLOAD버튼)
  			 11) 3행 1열 (자기소개, 이력서, PREVIEW버튼, UPLOAD 버튼)  
  			 
  	     -->
  	     
  	      <!-- 
  		     <DB 정보>
  	          
			 01) SABUN 				사번
  			 02) JOIN_DAY 			입사일 
  			 03) RETIRE_DAY 		퇴사일
  			 04) PUT_YN     		투입여부
  			 05) NAME       		이름
  			 06) REG_NO				주민등록번호
  			 07) ENG_NAME			영어이름
  			 08) PHONE				전화번호
  			 09) HP					핸드폰번호
  			 10) CARRIER			이력서
  			 11) POS_GBN_CODE		직위구분코드
  			 12) CMP_REG_NO			사업자등록번호
  			 13) CMP_REG_IMAGE  	사업자등록증
  			 14) SEX				성별
  			 15) YEARS				나이
  			 16) EMAIL				이메일
  			 17) ZIP				우편번호
  			 18) ADDR1				주소1(도-리 주소)
  			 19) ADDR2				주소2(세부주소)
  			 20) DEPT_CODE			부서코드
  			 21) JOIN_GBN_CODE		직종
  			 22) ID					아이디
  			 23) PWD				패스워드
  			 24) SALARY				연봉
  			 25) KOSA_REG_YN	 	KOSA등록
  			 26) KOSA_CLASS_CODE	KOSA등급
  			 27) MIL_YN				입대여부
  			 28) MIL_TYPE			군별
  			 29) MIL_LEVEL			계급
  			 30) MIL_STARTDATE		입영일자
  			 31) MIL_ENDDATE		전역일자
  			 32) JOB_TYPE			직종체크
  			 33) GART_LEVEL			등급
  			 34) SELF_INTRO			자기소개
  			 35) CRM_NAME			업체
  			 36) PROFILE			프로필사진명
  			 
  	     -->
   			 
  			<!-- row 1 -->
  			<div class="row">
  			
  				<!-- 1행 1열 (프로필 사진)-->
  				<div class="col-xs-3">	
  				     <div id='preview'><img id='originalImage' src="/resources/person.png" width="150px;" style="margin-bottom:15px;" /><br></div>
					<input type="file" id="uploadFile" name='uploadFile' width="100px;" accept="image/gif, image/jpeg, image/png" multiple/>
				</div>
				
				<!-- 1행 2열 (사번, 아이디, 전화번호 연령, 우편번호, 직위) -->
   				<div class="col-xs-3" style="padding-left:20px">
      				<div class="short-div"><label for="SABUN"><font color="red">*</font>사번 </label><input readonly style="margin-left:43px; background-color:#f5f5f5" type="text" id="SABUN" name="SABUN"></div>
     			    <div class="short-div"><label for="ID"><font color="red">*</font>아이디 </label><input style="width:90px; margin-left:26px;" type="text" id="ID" name="ID"><button type="button" onClick="idChk();" style="margin-left:10px; width:80px;">중복확인</button></div>
       		        <input type="hidden" id="idChkBool" value="false"/>
       				<div class="short-div"><label for="PHONE">전화번호 </label><input style="margin-left:18px;" type="text" id="PHONE" name="PHONE"></div>
         			<div class="short-div"><label for="YEARS">연령 </label><input style="margin-left:50px;" type="number" id="YEARS" name="YEARS" ></div>
         			<div class="short-div"><label for="ZIP">주소 </label><input placeholder="우편번호" style="margin-left:36px; width:100px;" type="text" id="ZIP" name="ZIP"><button type="button" onClick="openAddr();" style="margin-left:10px; width:80px;">주소검색</button></div>
         			<div class="short-div"><label for="POS_GBN_CODE">직위 </label>
         			<c:choose>
        				<c:when test="${!empty commonList}">
   							<select name="POS_GBN_CODE" id="POS_GBN_CODE" style="margin-left:48px; width:178px; height:28px;" class="select_02">
      							<c:forEach var="commonList" items="${commonList}" varStatus="i">
        		    				<c:if test="${commonList.GUBUN == '직위'}" >
       				  				<option value="${commonList.CODE}">${commonList.NAME}</option>
        							</c:if>
      							</c:forEach>
      						</select>
      				  	</c:when>
      					<c:otherwise>
      						<select name="DEPT_CODE" id="DEPT_CODE" style="margin-left:48px; width:178px; height:28px;" class="select_02">
       				  			<option value="">DB데이터없음</option>
        					</select>
      					</c:otherwise>
      				</c:choose>
         			</div> 
    			</div>
    			
    			<!-- 1행 3열 (한글성명, 패스워드, 핸드폰번호, 이메일, 주소1, 부서) -->	
         		<div class="col-xs-3" style="padding-left:20px">
      				<div class="short-div"><label for="NAME"><font color="red">*</font>한글성명 </label><input style="margin-left:30px;" type="text" id="NAME" name="NAME" value="${member.NAME}" ></div>
     				<div class="short-div"><label for="PWD"><font color="red">*</font>패스워드 </label><input style="margin-left:30px;" type="password" id="PWD" name="PWD" ></div>
        			<div class="short-div"><label for="HP"><font color="red">*</font>핸드폰번호 </label><input style="margin-left:15px;" type="text" id="HP" name="HP" maxlength="13" onKeyup="inputPhoneNumber(this);"></div>
        			<%-- <div class="short-div"><label for="EMAIL"><font color="red">*</font>이메일 </label><input style="margin-left:25px; width:200px;" type="text" id="EMAIL" name="EMAIL" value="${member.EMAIL}" ></div> --%>
       				<div class="short-div"><label for="EMAIL"><font color="red">*</font>이메일</label><input type="text" name="str_email01" id="str_email01" style="width:100px"> @ <select style="width:100px;margin-right:10px" name="selectEmail" id="selectEmail"><option value="1" selected>선택</option><option value="naver.com">naver.com</option> <option value="hanmail.net">hanmail.net</option> <option value="hotmail.com">hotmail.com</option> <option value="nate.com">nate.com</option> <option value="yahoo.co.kr">yahoo.co.kr</option> <option value="empas.com">empas.com</option> <option value="dreamwiz.com">dreamwiz.com</option> <option value="freechal.com">freechal.com</option> <option value="lycos.co.kr">lycos.co.kr</option> <option value="korea.com">korea.com</option> <option value="gmail.com">gmail.com</option> <option value="hanmir.com">hanmir.com</option> <option value="paran.com">paran.com</option> </select></div>
       				<input type="hidden" id="EMAIL" name="EMAIL"> 
       				<div class="short-div"><input placeholder="주소" style="margin-bottom:5px; width:280px;" type="text" id="ADDR1" name="ADDR1" value="${member.ADDR1}" ></div> 
        			<div class="short-div"><label for="DEPT">부서 </label>
        			<c:choose>
        				<c:when test="${!empty commonList}">
   							<select name="DEPT_CODE" id="DEPT_CODE" style="margin-left:66px; width:178px; height:28px;" class="select_02">
      							<c:forEach var="commonList" items="${commonList}" varStatus="i">
        		    				<c:if test="${commonList.GUBUN == '부서'}" >
       				  				<option value="${commonList.CODE}">${commonList.NAME}</option>
        							</c:if>
      							</c:forEach>
      						</select>
      				  	</c:when>
      					<c:otherwise>
      						<select name="DEPT_CODE" id="DEPT_CODE" style="margin-left:66px; width:178px; height:28px;" class="select_02">
       				  			<option value="">DB데이터없음</option>
        					</select>
      					</c:otherwise>
      				</c:choose>
        			</div> 
        		</div>
        		
        		<!-- 1행 4열 (영문성명, 패스워드 확인, 주민번호, 직종체크, 주소2) -->	
         		<div class="col-xs-3" style="padding-left:20px">
      				<div class="short-div"><label for="ENG_NAME">영문성명 </label><input style="margin-left:52px; width:200px;" type="text" id="ENG_NAME" name="ENG_NAME"></div>
       				<div class="short-div"><label for="PWD_CONFIRM"><font color="red">*</font>패스워드 확인</label><input style="margin-left:10px; width:200px;" type="password" id="PWD_CONFIRM" name="PWD_CONFIRM" ></div>
       				<div class="short-div"><label for="REG_NO">주민번호 </label><input style="margin-left:52px; width:200px;" size="14" maxLength="14" onKeyUp="juminFormat(this);" type="text" id="REG_NO" name="REG_NO" ></div>
        			<div class="short-div"><label for="JOB_TYPE">직종체크 </label>
        			<c:choose>
        				<c:when test="${!empty commonList}">
   							<select name="JOB_TYPE" id="JOB_TYPE" style="margin-left:45px; width:80px; height:28px;" class="select_02">
      							<c:forEach var="commonList" items="${commonList}" varStatus="i">
        		    				<c:if test="${commonList.GUBUN == '직종체크'}" >
       				  				<option value="${commonList.CODE}">${commonList.NAME}</option>
        							</c:if>
      							</c:forEach>
      						</select>
      				  	</c:when>
      					<c:otherwise>
      						<select name="JOB_TYPE" id="JOB_TYPE" style="margin-left:52px; width:80px; height:28px;" class="select_02">
       				  			<option value="">DB데이터없음</option>
        					</select>
      					</c:otherwise>
      				</c:choose>
        			<label for="SEX" style="margin-left:10px;">성별 </label>
        				<select name="SEX" id="SEX" style="margin-left:23px; width:50px; height:28px;" class="select_02">
       				  		<option value="F">여</option>
       				  		<option value="M">남</option>
        				</select>
        			</div>
  					<div class="short-div"><input placeholder="세부주소" style="margin-bottom:5px; width:315px;" type="text" id="ADDR2" name="ADDR2" value="${member.ADDR2}" ></div> 
         			<div class="short-div"><label for="SALARY">연봉(만원) </label><input style="margin-left:42px; width:200px" type="text" id="SALARY" name="SALARY" value="${member.SALARY}" ></div> 
         		</div>
         	</div>
         	
         	<!-- row 2 -->
         	<div class="row" style="margin-top:0px;">
         	
         		<!-- 2행 1열 (입사구분, 군별, KOSA등록, 사업자번호) -->
         		<div class="col-xs-3" style="padding-left:0px">
         			<div class="short-div"><label for="JOIN_GBN_CODE">입사구분 </label>
      					<c:choose>
        				<c:when test="${!empty commonList}">
   							<select name="JOIN_GBN_CODE" id="JOIN_GBN_CODE" style="margin-left:34px; width:178px; height:28px;" class="select_02">
      							<c:forEach var="commonList" items="${commonList}" varStatus="i">
        		    				<c:if test="${commonList.GUBUN == '입사구분'}" >
       				  				<option value="${commonList.CODE}">${commonList.NAME}</option>
        							</c:if>
      							</c:forEach>
      						</select>
      				  	</c:when>
      					<c:otherwise>
      						<select name="JOIN_GBN_CODE" id="JOIN_GBN_CODE" style="margin-left:34px; width:178px; height:28px;" class="select_02">
       				  			<option value="">DB데이터없음</option>
        					</select>
      					</c:otherwise>
      				</c:choose>
      				</div>
         			<div class="short-div"><label for="MIL_TYPE">군별 </label>
						<c:choose>
        				<c:when test="${!empty commonList}">
   							<select name="MIL_TYPE" id="MIL_TYPE" style="margin-left:65px; width:178px; height:28px;" class="select_02">
      							<c:forEach var="commonList" items="${commonList}" varStatus="i">
        		    				<c:if test="${commonList.GUBUN == '군별'}" >
       				  				<option value="${commonList.NAME}">${commonList.NAME}</option>
        							</c:if>
      							</c:forEach>
      						</select>
      				  	</c:when>
      					<c:otherwise>
      						<select name="MIL_TYPE" id="MIL_TYPE" style="margin-left:65px; width:178px; height:28px;" class="select_02">
       				  			<option value="">DB데이터없음</option>
        					</select>
      					</c:otherwise>
      				</c:choose>
         			</div>
        			<div class="short-div"><label for="KOSA_REG_YN">KOSA등록 </label>
						<c:choose>
        				<c:when test="${!empty commonList}">
   							<select name="KOSA_REG_YN" id="KOSA_REG_YN" onchange="showKosa(this);" style="margin-left:24px; width:178px; height:28px;" class="select_02">
      							<c:forEach var="commonList" items="${commonList}" varStatus="i">
        		    				<c:if test="${commonList.GUBUN == 'KOSA등록'}" >
       				  				<option value="${commonList.NAME}">${commonList.NAME}</option>
        							</c:if>
      							</c:forEach>
      						</select>
      				  	</c:when>
      					<c:otherwise>
      						<select name="KOSA_REG_YN" id="KOSA_REG_YN" style="margin-left:24px; width:178px; height:28px;" class="select_02">
       				  			<option value="">DB데이터없음</option>
        					</select>
      					</c:otherwise>
      				</c:choose>
        			</div>
    			</div>
    			
    			<!-- 2행 2열 (등급, 계급, KOSA등록, 업체명) -->
    			<div class="col-xs-3" style="padding-left:30px">
      				<div class="short-div"><label for="GART_LEVEL">등급 </label>
      				<c:choose>
        				<c:when test="${!empty commonList}">
   							<select name="GART_LEVEL" id="GART_LEVEL" style="margin-left:50px; width:178px; height:28px;" class="select_02">
      							<c:forEach var="commonList" items="${commonList}" varStatus="i">
        		    				<c:if test="${commonList.GUBUN == '등급'}" >
       				  				<option value="${commonList.NAME}">${commonList.NAME}</option>
        							</c:if>
      							</c:forEach>
      						</select>
      				  	</c:when>
      					<c:otherwise>
      						<select name="GART_LEVEL" id="GART_LEVEL" style="margin-left:50px; width:178px; height:28px;" class="select_02">
       				  			<option value="">DB데이터없음</option>
        					</select>
      					</c:otherwise>
      				</c:choose>
      				</div>
      				<div class="short-div"><label for="MIL_LEVEL">계급 </label>
      				<c:choose>
        				<c:when test="${!empty commonList}">
   							<select name="MIL_LEVEL" id="MIL_LEVEL" style="margin-left:50px; width:178px; height:28px;" class="select_02">
      							<c:forEach var="commonList" items="${commonList}" varStatus="i">
        		    				<c:if test="${commonList.GUBUN == '계급'}" >
       				  				<option value="${commonList.NAME}">${commonList.NAME}</option>
        							</c:if>
      							</c:forEach>
      						</select>
      				  	</c:when>
      					<c:otherwise>
      						<select name="MIL_LEVEL" id="MIL_LEVEL" style="margin-left:50px; width:178px; height:28px;" class="select_02">
       				  			<option value="">DB데이터없음</option>
        					</select>
      					</c:otherwise>
      				</c:choose>
      				</div>
       				<div class="short-div" id="kosaForm" style="display:none"><label for="KOSA_CLASS_CODE">KOSA등급 </label>
						<c:choose>
        				<c:when test="${!empty commonList}">
   							<select name="KOSA_CLASS_CODE" id="KOSA_CLASS_CODE" style="margin-left:8px; width:178px; height:28px;" class="select_02">
      							<c:forEach var="commonList" items="${commonList}" varStatus="i">
        		    				<c:if test="${commonList.GUBUN == 'KOSA등급'}" >
       				  				<option value="${commonList.CODE}">${commonList.NAME}</option>
        							</c:if>
      							</c:forEach>
      						</select>
      				  	</c:when>
      					<c:otherwise>
      						<select name="KOSA_CLASS_CODE" id="KOSA_CLASS_CODE" style="margin-left:8px; width:178px; height:28px;" class="select_02">
       				  			<option value="">DB데이터없음</option>
        					</select>
      					</c:otherwise>
      				</c:choose>
       				</div>
    			</div>
    			
    			<!-- 2행 3열 (투입여부, 입영일자, 입사일자) -->
        	    <div class="col-xs-3" style="padding-left:26px">
      				<div class="short-div"><label for="PUT_YN">투입여부 </label>
      				<c:choose>
        				<c:when test="${!empty commonList}">
   							<select name="PUT_YN" id="PUT_YN" style="margin-left:35px; width:178px; height:28px;" class="select_02">
      							<c:forEach var="commonList" items="${commonList}" varStatus="i">
        		    				<c:if test="${commonList.GUBUN == '투입여부'}" >
       				  				<option value="${commonList.NAME}">${commonList.NAME}</option>
        							</c:if>
      							</c:forEach>
      						</select>
      				  	</c:when>
      					<c:otherwise>
      						<select name="PUT_YN" id="PUT_YN" style="margin-left:40px; width:178px; height:28px;" class="select_02">
       				  			<option value="">DB데이터없음</option>
        					</select>
      					</c:otherwise>
      				</c:choose>
      				</div>
     			    <div class="short-div" id="milDateForm" style="display:none"><label for="MIL_STARTDATE">입영일자 </label><input autocomplete="off" style="margin-left:40px; width:180px" type="text" name="MIL_STARTDATE" id="MIL_STARTDATE" size="12" /></div>
       				<div class="short-div"><label for="JOIN_DAY"><font color="red">*</font>입사일자 </label><input autocomplete="off" style="margin-left:32px; width:180px;" type="text" name="JOIN_DAY" id="JOIN_DAY" size="12" /></div>
    			</div>
    			
    			<!-- 2행 4열 (군필여부, 전역일자, 퇴사일자) -->
         		<div class="col-xs-3" style="padding-left:26px">
      				<div class="short-div"><label for="MIL_YN">군필여부 </label>
      				<c:choose>
        				<c:when test="${!empty commonList}">
   							<select onchange="showDate(this);" name="MIL_YN" id="MIL_YN" style="margin-left:46px; width:200px; height:30px;" class="select_02">
      							<c:forEach var="commonList" items="${commonList}" varStatus="i">
        		    				<c:if test="${commonList.GUBUN == '군필여부'}" >
       				  				<option value="${commonList.NAME}">${commonList.NAME}</option>
        							</c:if>
      							</c:forEach>
      						</select>
      				  	</c:when>
      					<c:otherwise>
      						<select name="MIL_YN" id="MIL_YN" style="margin-left:24px; width:178px; height:28px;" class="select_02">
       				  			<option value="">DB데이터없음</option>
        					</select>
      					</c:otherwise>
      				</c:choose></div>
      				<div class="short-div" id="milDateForm2" style="display:none"><label for="MIL_ENDDATE">전역일자 </label><input autocomplete="off" type="text" style="margin-left:50px; width:200px;" name="MIL_ENDDATE" id="MIL_ENDDATE" size="12" /></div>
      			    <div class="short-div"><label for="RETIRE_DAY">퇴사일자 </label><input autocomplete="off" style="margin-left:50px; width:200px;" type="text" name="RETIRE_DAY" id="RETIRE_DAY"/></div>
       			</div>
       		</div>
       		
       		<!-- row 3 -->
  			<div class="row">	
  			
				<!-- 3행 1열 (사업자번호) -->
   				<div class="col-xs-3" style="padding-left:0px">
      				<div class="short-div"><label for="CMP_REG_NO">사업자번호 </label><input style="margin-left:20px;" type="text" id="CMP_REG_NO" name="CMP_REG_NO" ></div>
    			</div>
    			
    			<!-- 3행 2열 (업체명) -->
   				<div class="col-xs-3" style="padding-left:30px">
      				<div class="short-div"><label for="CRM_NAME">업체명 </label><input style="margin-left:35px;" type="text" id="CRM_NAME" name="CRM_NAME" ></div>   
    			</div>
    			
    			<!-- 3행 3열 (사업자등록증) -->
   				<div class="col-xs-3" style="padding-left:30px">
      				<div class="short-div"><label for="CMP_REG_IMAGE">사업자등록증 </label><input type="file" id="uploadFile2" name='uploadFile' width="100px;" accept="image/gif, image/jpeg, image/png" multiple style="padding:0px; margin:0px;"/></div>
    			</div>
    			
    			<!-- 3행 4열 (PREVIEW 버튼, UPLOAD 버튼) -->
   				<div class="col-xs-3">
      				<div class="short-div">
       				<button type="button" onClick="showImage()">Preview</button>
       				<!-- <button style="width:80px;">Upload</button> --></div>
    			</div>
    		</div>
    		
       		<!-- row 4 -->
       		<!-- 4행 1열 (자기소개, 이력서, PREVIEW 버튼, UPLOAD 버튼)  -->
   			<div class="row" style="margin-top:5px;">
   				<div style="padding-left:12px;">
      				<div class="short-div"><label for="SELF_INTRO">자기소개 </label></div>
      			</div>
       			<div style="padding:0px">
       				<textarea style="margin-left:10px; width:493px; height:80px;" name="SELF_INTRO" id="SELF_INTRO" rows="4" cols="50" placeholder="100자 내외로 적으시오."></textarea>
       			</div>
       			<div style="padding-left:0px; margin-left:70px;">
       				<label for="CARRIER">이력서 </label><input type="file" id="uploadFile3" name='uploadFile' width="100px;" accept="image/gif, image/jpeg, image/png" multiple/>
       				<!-- <button style="margin-left:0px; width:80px;">Preview</button> -->
       				<button type="button" onClick="showImage2()">Preview</button>
       				<!-- <button style="width:80px;margin-left:3px;">Upload</button> -->
       			</div>
       		</div> 
       	</form>
	</div>
	
	<div id="dialog"><!-- <img src='/resources/logo.png' id="mytext" /> -->
	<%-- <img src="<spring:url value='/image/download1.jpg'/>" id="mytext" />  --%>
	<img id='originalImage2' src="/resources/person.png" /><br>
	</div>
	<div id="dialog2"><!-- <img src='/resources/logo.png' id="mytext" /> -->
	<%-- <img src="<spring:url value='/image/download1.jpg'/>" id="mytext" />  --%>
	<img id='originalImage3' src="/resources/person.png" /><br>
	</div>

	<!-- vue converting start -->
	<script>
     new Vue({
       el:"#app",
       data:{
			count:'${member.ENG_NAME}'
           },
           methods:{
        	   insertSubmit:function(){
        		   var form = document.getElementById('registerForm');


        			var chk = false;
        				var form = document.getElementById('registerForm');

        				var mil_startdate = $("#MIL_STARTDATE").val();
        				var mil_enddate = $("#MIL_ENDDATE").val();

        				var join_day = $("#JOIN_DAY").val();
        				var retire_day = $("#RETIRE_DAY").val();


        				var name = $('#NAME').val();
        				
        				if(name == ''){
        					alert('이름을 입력해주세요.');
        					$('#NAME').focus();
        		                return false;
        					}


        				var id = $('#ID').val();
        				
        				if(id == ''){
        					alert('아이디를 입력해주세요.');
        					$('#ID').focus();
        		                return false;
        					}



        				var hp = $('#HP').val();
        				
        				if(hp == ''){
        					alert('핸드폰번호를 입력해주세요.');
        					$('#HP').focus();
        		                return false;
        					}

        				var email = $('#str_email01').val()+"@"+$('#selectEmail').val();
        			
        				
        			    $('#EMAIL').val(email);

        			
        				if($('#str_email01').val()==''){
        					alert('이메일을 입력해주세요.');
        					$('#str_email01').focus();
        					return false;
        					}

        				
        				if($('#selectEmail')=='1')
        					{
        					alert('이메일 도메인을 선택해주세요.');
        					$('#selectEmail').focus();
        					return false;
        					}

        				var join_day = $('#JOIN_DAY').val();
        				
        				if(join_day == ''){
        					alert('입사일자를 입력해주세요.');
        					$('#JOIN_DAY').focus();
        		                return false;
        					}
        			
        				var pwd = $('#PWD').val();
        				
        				if(pwd == ''){
        					alert('패스워드를 입력해주세요.');
        					$('#PWD').focus();
        		                return false;
        					}


        				var pwd_confirm = $('#PWD_CONFIRM').val();
        				
        				if(pwd_confirm == ''){
        					alert('패스워드 확인란을 입력해주세요.');
        					$('#PWD_CONFIRM').focus();
        		                return false;
        					}


        				if($("#MIL_YN")=='Y')
        			  		{
        					if(("#MIL_STARTDATE") == '' ||("#MIL_ENDDATE") == '' ){
        			  			alert('입영일자 및 전역일자를 입력해주세요.');
        			  			
        			                    return false;
        			  			}
        			  		}

        				if(join_day!='' && retire_day!=''){
        				if(join_day > retire_day){
        					alert('입사일자와 퇴사일자를 다시 확인하세요.');
        		                return false;
        					}

        				}
        				if(mil_startdate != '' && mil_enddate!=''){
        				if(mil_startdate > mil_enddate){
        					alert('입영일자와 전역일자를 다시 확인하세요.');
        		                return false;
        					}
        				}

        				
        			 if($("#idChkBool").val() == 'false'){
        				 alert('아이디 중복확인을 해주세요');
        		            return false;
        				 }


        			 if($("#ENG_NAME").val()!=''){
        			 if(onOnlyAlpha($("#ENG_NAME").val()) == 'fail')
        		         return false;
        			 }
        		     if(onOnlyHangul($("#NAME").val()) == 'fail')
        		         return false;

        			 
        			form.submit();
        			
                    }
               }
         })
	</script>
	<!-- vue converting end -->

	<script>
	// 화면 로딩시 코사여부와 군필여부 'N'으로 초기화
	 $(document).ready(function(){    
		  $("#MIL_YN").val('N').attr("selected", "selected");
		  $("#KOSA_REG_YN").val('N').attr("selected", "selected");
 	 });

	// 군필여부 'Y' 일때, 날짜 폼 보이기
	function showDate(val){
		if(val.value=='Y')
		{
			$("#milDateForm").css("display","block");
			$("#milDateForm2").css("display","block");
		}
		else
		{
			$("#milDateForm").css("display","none");
			$("#milDateForm2").css("display","none");
		}
	}

	// KOSA등록 'Y' 일때, 날짜 폼 보이기
	function showKosa(val){
			if(val.value=='Y')
			{
			$("#kosaForm").css("display","block");
			
			}
			else
			{
			$("#kosaForm").css("display","none");
			
			}
			} 
	// 주소 검색 버튼 클릭시
	function openAddr(){new daum.Postcode({
	    oncomplete: function(data) {
	        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	        // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	        var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	        var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	            extraRoadAddr += data.bname;
	        }
	        // 건물명이 있고, 공동주택일 경우 추가한다.
	        if(data.buildingName !== '' && data.apartment === 'Y'){
	           extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	        }
	        // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	        if(extraRoadAddr !== ''){
	            extraRoadAddr = ' (' + extraRoadAddr + ')';
	        }
	        // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	        if(fullRoadAddr !== ''){
	            fullRoadAddr += extraRoadAddr;
	        }

	        // 우편번호와 주소 정보를 해당 필드에 넣는다.
	        console.log(data.zonecode);
	        console.log(fullRoadAddr);
	        
	        
	        $("#ZIP").val(data.zonecode);
	        $("#ADDR1").val(fullRoadAddr);
	        
	        /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
	        document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
	        document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
	    }
	 }).open();
	}


    // 사업자등록증 Preview 버튼 클릭시 보여주는 화면 설정
	$("#dialog").dialog({
	    autoOpen: false,
	    width: 'auto',
	    maxWidth:600,
	    height: 'auto',
	    position: { my: 'top', at: 'top+10' },
	    modal: true,
	    resizable: false,
	    closeOnEscape: false
	});

    // 이력서 Preview 버튼 클릭시 보여주는 화면 설정
	$("#dialog2").dialog({
	    autoOpen: false,
	    width: 'auto',
	    maxWidth:600,
	    height: 'auto',
	    position: { my: 'top', at: 'top+10' },
	    modal: true,
	    resizable: false,
	    closeOnEscape: false
	});

    // 사업자등록증 Preview 버튼 클릭시
	function showImage(){
		$('#dialog').dialog('open');
		var x = document.getElementById("uploadFile2");
		var file = x.files[0];
		}

	// 이력서 Preview 버튼 클릭시
	function showImage2(){
		$('#dialog2').dialog('open');
		var x = document.getElementById("uploadFile3");
		var file = x.files[0];
		}

	// Datepicker 설정
	$(function(){
	    $("#JOIN_DAY").datepicker({ dateFormat: 'yymmdd' }); 
	    $("#RETIRE_DAY").datepicker({ dateFormat: 'yymmdd' }); 
	    $("#MIL_STARTDATE").datepicker({ dateFormat: 'yymmdd' });
	    $("#MIL_ENDDATE").datepicker({ dateFormat: 'yymmdd' });  
	});

	// Register 버튼 클릭시
	function insertSubmit(){
	var form = document.getElementById('registerForm');


	var chk = false;
		var form = document.getElementById('registerForm');

		var mil_startdate = $("#MIL_STARTDATE").val();
		var mil_enddate = $("#MIL_ENDDATE").val();

		var join_day = $("#JOIN_DAY").val();
		var retire_day = $("#RETIRE_DAY").val();


		var name = $('#NAME').val();
		
		if(name == ''){
			alert('이름을 입력해주세요.');
			$('#NAME').focus();
                return false;
			}


		var id = $('#ID').val();
		
		if(id == ''){
			alert('아이디를 입력해주세요.');
			$('#ID').focus();
                return false;
			}



		var hp = $('#HP').val();
		
		if(hp == ''){
			alert('핸드폰번호를 입력해주세요.');
			$('#HP').focus();
                return false;
			}


		var email = $('#str_email01').val()+"@"+$('#selectEmail');
		alert(email);
		
	    $('#EMAIL').val(email);

	
		if($('#str_email01').val()==''){
			alert('이메일을 입력해주세요.');
			$('#str_email01').focus();
			return false;
			}

		
		if($('#selectEmail')=='1')
			{
			alert('이메일 도메인을 선택해주세요.');
			$('#selectEmail').focus();
			return false;
			}

		var join_day = $('#JOIN_DAY').val();
		
		if(join_day == ''){
			alert('입사일자를 입력해주세요.');
			$('#JOIN_DAY').focus();
                return false;
			}
	
		var pwd = $('#PWD').val();
		
		if(pwd == ''){
			alert('패스워드를 입력해주세요.');
			$('#PWD').focus();
                return false;
			}


		var pwd_confirm = $('#PWD_CONFIRM').val();
		
		if(pwd_confirm == ''){
			alert('패스워드 확인란을 입력해주세요.');
			$('#PWD_CONFIRM').focus();
                return false;
			}


		if($("#MIL_YN")=='Y')
	  		{
			if(("#MIL_STARTDATE") == '' ||("#MIL_ENDDATE") == '' ){
	  			alert('입영일자 및 전역일자를 입력해주세요.');
	  			
	                    return false;
	  			}
	  		}

		if(join_day!='' && retire_day!=''){
		if(join_day > retire_day){
			alert('입사일자와 퇴사일자를 다시 확인하세요.');
                return false;
			}

		}
		if(mil_startdate != '' && mil_enddate!=''){
		if(mil_startdate > mil_enddate){
			alert('입영일자와 전역일자를 다시 확인하세요.');
                return false;
			}
		}

		
	 if($("#idChkBool").val() == 'false'){
		 alert('아이디 중복확인을 해주세요');
            return false;
		 }


	 if($("#ENG_NAME").val()!=''){
	 if(onOnlyAlpha($("#ENG_NAME").val()) == 'fail')
         return false;
	 }
     if(onOnlyHangul($("#NAME").val()) == 'fail')
         return false;

	 
	form.submit();
	
	}


	// 화면 미리보기 설정 시작 (프로필, 사업자등록증, 이력서)
    var upload = document.querySelector('#uploadFile');
    var upload2 = document.querySelector('#uploadFile2');
    var upload3 = document.querySelector('#uploadFile3');
    
    var preview = document.querySelector('#preview');
    var dialog = document.querySelector('#dialog');

    // 프로필 화면 미리보기 이벤트 설정
    upload.addEventListener('change',function (e) {
        
       var get_file = e.target.files;
       var image = document.getElementById('originalImage');

        /* FileReader 객체 생성 */
        var reader = new FileReader();

        /* reader 시작시 함수 구현 */
        reader.onload = (function (aImg) {
            console.log(1);
            return function (e) {
                console.log(3);
                /* base64 인코딩 된 스트링 데이터 */
                aImg.src = e.target.result
            }
        })(image)
        if(get_file){
            /* 
                get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 
                onload 에 설정했던 return 으로 넘어간다.
               	이와 함게 base64 인코딩 된 스트링 데이터가 result 속성에 담겨진다.
            */
            reader.readAsDataURL(get_file[0]);
            console.log(2);
        }
        //preview.removeChild(document.getElementById('originalImage'));
        preview.appendChild(image);
        
       
    });

 	// 사업자등록증 화면 미리보기 이벤트 설정
    upload2.addEventListener('change',function (e) {
        var get_file = e.target.files;
        var image2 = document.getElementById('originalImage2');
       
         /* FileReader 객체 생성 */

         var reader2 = new FileReader();
         /* reader 시작시 함수 구현 */

         reader2.onload = (function (aImg) {
             console.log(1);
             return function (e) {
                 console.log(3);
                 /* base64 인코딩 된 스트링 데이터 */
                 aImg.src = e.target.result
             }
         })(image2)
        
         if(get_file){
             /* 
                 get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 
                 onload 에 설정했던 return 으로 넘어간다.
                	이와 함게 base64 인코딩 된 스트링 데이터가 result 속성에 담겨진다.
             */
     
             reader2.readAsDataURL(get_file[0]);
             console.log(2);
         }
         //preview.removeChild(document.getElementById('originalImage'));
       
         dialog.appendChild(image2);
        
     });

 	// 이력서 화면 미리보기 이벤트 설정
    upload3.addEventListener('change',function (e) {
        var get_file = e.target.files;
        var image3 = document.getElementById('originalImage3');
       
         /* FileReader 객체 생성 */

         var reader3 = new FileReader();
         /* reader 시작시 함수 구현 */

         reader3.onload = (function (aImg) {
             console.log(1);
             return function (e) {
                 console.log(3);
                 /* base64 인코딩 된 스트링 데이터 */
                 aImg.src = e.target.result
             }
         })(image3)
        
         if(get_file){
             /* 
                 get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 
                 onload 에 설정했던 return 으로 넘어간다.
                	이와 함게 base64 인코딩 된 스트링 데이터가 result 속성에 담겨진다.
             */
             reader3.readAsDataURL(get_file[0]);
         }   
         dialog2.appendChild(image3);
     });


 	// id 중복체크 클릭시
    function idChk(){
    	if($("#ID").val() == ''){
              alert('ID를 입력해주세요');
              $("#ID").focus(); 
              return false;
    	}
        	;
		var id = $("#ID").val();

       $.ajax({
    	   type:"post",
    	    dataType:"json",
    	    url: 'idChkAjax.do',
    	    data: {ID:id},
    	    success: function(data) {
        	    if(data.result =='중복됨')
            	    {
                      alert('중복 되는 아이디입니다.');
                      
            	    }
        	    else{
                      alert('사용가능한 아이디입니다.');
                      $("#idChkBool").val("true");
            	    }
    	     
    	    }
           
           });
		}


 	// 연봉 입력시 자동 컴마 입력
    $(function() {
  	  var $salary = $("#SALARY");
  	  
  	  
  	  $salary.on('keyup', function() {
  	    // 입력 값 알아내기
  	    var _this = this;
  	
  	    numberFormat(_this)
  	  })

  	  
  	  // 핸드폰번호 입력시 하이픈 자동 입력
  	  $(document).on("keyup", "#PHONE", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--", "-") ); });

  	});

  	// 콤마 찍기 
  	function comma(str) {
  	  str = String(str);
  	  return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
  	}

  	// 콤마 풀기
  	function uncomma(str) {
  	  str = String(str);
  	  return str.replace(/[^\d]+/g, '');
  	}

  	// 숫자로 포맷
  	function numberFormat(obj) {
  	  obj.value = comma(uncomma(obj.value));
  	}

  	// 전화번호 자동 하이픈
  	function inputPhoneNumber(obj) {
  	  	
	    var number = obj.value.replace(/[^0-9]/g, "");
	    var phone = "";

	    if(number.length < 4) {
	        return number;
	    } else if(number.length < 7) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3);
	    } else if(number.length < 11) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 3);
	        phone += "-";
	        phone += number.substr(6);
	    } else {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 4);
	        phone += "-";
	        phone += number.substr(7);
	    }
	    obj.value = phone;
	}
	

  	// 주민번호 자동 하이픈 유효성 시작
	function onlyNumberInput()
	{
	 var code = window.event.keyCode;

	 if ((code > 34 && code < 41) || (code > 47 && code < 58) || (code > 95 && code < 106) || code == 8 || code == 9 || code == 13 || code == 46)
	 {
	  window.event.returnValue = true;
	  return;
	 }
	 window.event.returnValue = false;
	}

  	
	/* --- 숫자만 리턴 --- */
	function onlyNum(val)
	{
	 var num = val;
	 var tmp = "";

	 for (var i = 0; i < num.length; i ++)
	 {
	  if (num.charAt(i) >= 0 && num.charAt(i) <= 9)
	   tmp = tmp + num.charAt(i);
	  else
	   continue;
	 }
	 return tmp;
	}

	/* --- 주민등록번호 형식 (onKeyUp 이벤트) --- */
	function juminFormat(obj)
	{
	 var str = onlyNum(obj.value);
	 var leng = str.length;

	    switch(leng)
	    {
	  case  1 :
	  case  2 :
	  case  3 :
	  case  4 :
	  case  5 :
	  case  6 : obj.value = str; break;
	  case  7 :
	  case  8 :
	  case  9 :
	  case 10 :
	  case 11 :
	  case 12 :
	  case 13 : obj.value = str.substring(0, 6) + "-" + str.substring(6, 13);
	      isSSN(str.substring(0, 6) + str.substring(6, 13))
	      break;
	 }
	}

	/* --- 주민번호 --- */
	function isSSN(ssn){
	 if( ssn.length == 13 ) {
	  var A = ssn.charAt(0);
	  var B   = ssn.charAt(1);
	  var C   = ssn.charAt(2);
	  var D   = ssn.charAt(3);
	  var E   = ssn.charAt(4);
	  var F   = ssn.charAt(5);
	  var G   = ssn.charAt(6);
	  var H   = ssn.charAt(7);
	  var I   = ssn.charAt(8);
	  var J   = ssn.charAt(9);
	  var K   = ssn.charAt(10);
	  var L   = ssn.charAt(11);
	  var Osub   = ssn.charAt(12);

	  var SUMM = A*2 + B*3 + C*4 + D*5+ E*6+ F*7+G*8+H*9+I*2+J*3+K*4+L*5;
	  var N = SUMM % 11;
	  var Modvalue = 11 - N;
	  var LapointVal =  Modvalue % 10 ;

	  if ( Osub == LapointVal ) {
	   return true;
	  } else {
	   return false;
	  }
	 } 
	}
	//-->

   $('#REG_NO').focusout(function () {
      auto_reg();
   });


   //나이 자동계산
   function auto_reg(){

	     var reg = $("#REG_NO").val().substring(0,6);

	     reg = reg.substring(0,2)+"-"+reg.substring(2,4)+"-"+reg.substring(4,6);
	     	var birthday = new Date(reg);
	     	var today = new Date();
	     	var years = today.getFullYear() - birthday.getFullYear();
	     	 
	     	// Reset birthday to the current year.
	     	birthday.setFullYear(today.getFullYear());
	     	 
	     	// If the user's birthday has not occurred yet this year, subtract 1.
	     	if (today < birthday)
	     	{
	     	    years--;
	     	}
	     	
	     	$("#YEARS").val(years);
      }

   
  	$('#CMP_REG_NO').on('keyup', function(){
      var num = $('#CMP_REG_NO').val();
      num.trim();  // 스페이스바 제거
      this.value = AutoHypen(num) ;
  	});

  function AutoHypen(companyNum){
	  
      companyNum = companyNum.replace(/[^0-9]/g, '');
      var tempNum = '';   

      if(companyNum.length < 4){
        return companyNum;
      }
      else if(companyNum.length < 6){
        tempNum += companyNum.substr(0,3);
        tempNum += '-';
        tempNum += companyNum.substr(3,2);
        return tempNum;
      }
      else if(companyNum.length < 11){
        tempNum += companyNum.substr(0,3);
        tempNum += '-';
        tempNum += companyNum.substr(3,2);
        tempNum += '-';
        tempNum += companyNum.substr(5);
        return tempNum;
      }
      else{        
        tempNum += companyNum.substr(0,3);
        tempNum += '-';
        tempNum += companyNum.substr(3,2);
        tempNum += '-';
        tempNum += companyNum.substr(5);
        return tempNum;
      }
    }
 	//주민번호 유효성 끝

	 $('#PWD_CONFIRM').focusout(function () {
        var pwd1 = $("#PWD").val();
        var pwd2 = $("#PWD_CONFIRM").val();
 
        if ( pwd1 != '' && pwd2 == '' ) {
            null;
        } else if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
               return true
            } else {
                alert("패스워드가 불일치합니다.");
               return false; // 비밀번호 불일치 이벤트 실행
            }
        }
    });

 	function onOnlyAlpha(obj){
		
     var inText = obj;
     var deny_char = /^[A-Za-z0-0]+$/;
     if(!deny_char.test(inText)){
         alert('영문이름이 올바른지 확인해주세요.');
         $("#ENG_NAME").focus();
       return 'fail';
     }
     return 'success';
	}

	function onOnlyHangul(obj){
	
     var inText = obj;
     var deny_char = /^[가-힣]{2,4}$/;
     if(!deny_char.test(inText)){
         alert('한글이름이 올바른지 확인해주세요.');
         $("#NAME").focus();
       return 'fail';
     }
     return 'success';
	}

	
	</script>
</body>
	
</html>
