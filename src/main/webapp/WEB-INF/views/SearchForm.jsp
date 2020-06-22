<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  
  <!-- jqGrid start -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/themes/redmond/jquery-ui.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.5/css/ui.jqgrid.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.5/jquery.jqgrid.min.js"></script>
  <!-- jqGrid end -->
  
  
  <!-- jQuery UI for Datepicker start-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="/resources/js//datepicker-ko.js"></script>
  <!-- jQuery UI for Datepicker End-->
  
  <!-- vue.js start -->
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
  <!-- vue.js end -->
  
  <title>피노 인사시스템</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div style="padding:10 150 150 150px;" id="app">
 		<form action="/Search" method="post" id="registerForm">
 			<h1 style="margin-top:50px; margin-bottom:50px;">Employee List</h1>
 			<div class="row">
 				<div class="col-xs-3" style="padding:0px">
      				<div class="short-div"><label for="SABUN"><font color="red">*</font>사번 </label><input style="margin-left:31px;" type="text" id="SABUN" name="SABUN"></div>
      				<div class="short-div"><label for="POS_GBN_CODE_NAME"><font color="red">*</font>직위 </label>
        				<span v-if="commonList!=null">
   							<select name="POS_GBN_CODE_NAME" id="POS_GBN_CODE_NAME" style="margin-left:26px; width:178px; height:32px;" class="select_02">
      							<option value="">선택안함</option>
      							<option v-for="item in commonList" v-if="item.GUBUN == '직위'">
      							{{item.NAME}}
      							</option>    						
      						</select>
      				  	</span>
      					<span v-else>
      						<select name="POS_GBN_CODE_NAME" id="POS_GBN_CODE_NAME" style="margin-left:40px; width:178px; height:28px;" class="select_02">
       				  			<option value="">DB데이터없음</option>
        					</select>
      					</span>
      				</div>
    			</div>
				<div class="col-xs-3" style="padding-left:60px">
      				<div class="short-div"><label for="NAME">성명 </label><input style="margin-left:45px; ime-mode:active;" type="text" id="NAME" name="NAME"></div>
      				<div class="short-div"><label for="JOIN_DAY">입사일자 </label><input autocomplete="off" data-date-format="mm/dd/yyyy" style="margin-left:14px;" type="text" id="JOIN_DAY" name="JOIN_DAY" value=""></div>
      			</div>
      			<div class="col-xs-3" style="padding-left:60px">
      				<div class="short-div"><label for="JOIN_GBN_CODE_NAME">입사구분 </label>
      				<span v-if="commonList!=null">
   							<select name="JOIN_GBN_CODE_NAME" id="JOIN_GBN_CODE_NAME" style="margin-left:15px; width:178px; height:32px;" class="select_02">
      							<option value="">선택안함</option>
      							<option v-for="item in commonList" v-if="item.GUBUN == '입사구분'">
      							{{item.NAME}}
      							</option>    						
      						</select>
      				  	</span>
      					<span v-else>
      						<select name="JOIN_GBN_CODE_NAME" id="JOIN_GBN_CODE_NAME" style="margin-left:40px; width:178px; height:28px;" class="select_02">
       				  			<option value="">DB데이터없음</option>
        					</select>
      					</span>
      				</div>
      				<div class="short-div"><label for="RETIRE_DAY">퇴사일자 </label><input autocomplete="off" style="margin-left:20px;" type="text" id="RETIRE_DAY" name="RETIRE_DAY" value=""></div>
      			</div>
         		<div class="col-xs-3" style="padding-left:60px">
      				<div class="short-div"><label for="PUT_YN">투입여부 </label>	
      				<span v-if="commonList!=null">
   							<select name="PUT_YN" id="PUT_YN" style="margin-left:15px; width:178px; height:32px;" class="select_02">
      							<option value="">선택안함</option>
      							<option v-for="item in commonList" v-if="item.GUBUN == '투입여부'">
      							{{item.NAME}}
      							</option>    						
      						</select>
      				  	</span>
      					<span v-else>
      						<select name="PUT_YN" id="PUT_YN" style="margin-left:40px; width:178px; height:28px;" class="select_02">
       				  			<option value="">DB데이터없음</option>
        					</select>
      					</span>
      				</div>
      				<div class="short-div"><label for="JOB_TYPE">직종분류 </label>
      				<span v-if="commonList!=null">
   							<select name="JOB_TYPE" id="JOB_TYPE" style="margin-left:15px; width:178px; height:32px;" class="select_02">
      							<option value="">선택안함</option>
      							<option :value="item.CODE" v-for="item in commonList" v-if="item.GUBUN == '직종체크'">
      							{{item.NAME}}
      							</option>    						
      						</select>
      				  	</span>
      					<span v-else>
      						<select name="JOB_TYPE" id="JOB_TYPE" style="margin-left:40px; width:178px; height:28px;" class="select_02">
       				  			<option value="">DB데이터없음</option>
        					</select>
      					</span>
      				</div>
      			</div>
      		</div>
  			<div class="row" style="margin-left:1000px; margin-top:20px; margin-bottom:20px;">
        		<button type="button" onClick="searchSubmit()" class="btn btn-info">Search</button> &nbsp;&nbsp;<button type="button" v-on:click="resetButton" class="btn btn-secondary">Reset</button> &nbsp;&nbsp;<button type="button" class="btn btn-danger" onClick="history.back();">Back</button>
        	</div>
    		<div class="row" style="text-align:center" id="resultData">
   					<table id="photos" class="display">	
					</table>
				<div id="pager2"></div>
  			</div>
  		</form>
	</div>
	
	<!-- vue converting start -->
	<script>
     new Vue({
       el:"#app",
       data:{
           SABUN:'',
           commonList : ${commonList2}.finals
           },
           methods:{
        	   resetButton:function(){
        		   resetButton();
               }
           }
         })
	</script>
	<!-- vue converting end -->
	
	<script>
      $(document).ready(function(){
    	$("#JOIN_DAY").datepicker({ dateFormat: 'yymmdd' }); 
  	    $("#RETIRE_DAY").datepicker({ dateFormat: 'yymmdd' }); 
    		    
    		
    	  $("#photos").jqGrid('navGrid','#pager2',{edit:false,add:false,del:false});
    		$("#photos").jqGrid({
    			url:'/SearchAjax.do',
    			datatype: "json",
    			colNames:['사번', '성명','주민번호', '핸드폰번호', '직위','입사일자','퇴사일자','투입여부','연봉'],
    			colModel:[
    				{name:'SABUN',index:'SABUN', jsonmap:'SABUN', width:110, align: 'center'},
    				{name:'NAME',index:'NAME', jsonmap:'NAME', width:110, align: 'center'},
    				{name:'REG_NO',index:'REG_NO', width:200, align: 'center'},
    				{name:'HP',index:'HP', width:200, align: 'center'},
    				{name:'POS_GBN_CODE_NAME',index:'POS_GBN_CODE_NAME', width:100, align: 'center'},
    				{name:'JOIN_DAY',index:'JOIN_DAY', align: 'center', width:150, formatter: 'date', 
    	    			formatoptions: { srcformat: 'Y/m/d', newformat: 'Y/m/d'}},
    				{name:'RETIRE_DAY',index:'RETIRE_DAY', width:150, align: 'center', formatter: 'date', 
    	        			formatoptions: { srcformat: 'Y/m/d', newformat: 'Y/m/d'}},
    				{name:'PUT_YN',index:'PUT_YN', width:80, align: 'center'},
    				{name:'SALARY',index:'SALARY', width:110, align: 'center', formatter:'integer'}	
    			],
    			formatter:{
                    integer:{thousandsSeparator:",",defaultValue:'0'}
        			},
        			
    			rowNum:10,
    			loadonce: true,
    			rowList:[10,20,30],
    			pager: '#pager2',
    			sortname: 'GUBUN',
    			loadComplete: function (data) {
    	            if ($(this).getGridParam("records")==0) {
    	           alert('데이터 없음');
    	            }
    	           
    			},
    			 onSelectRow: function(ids) { 
    				 var gridRow = $(this).getRowData(ids);
    				 var sabun = gridRow["SABUN"];
    				 location.href= "UpdateForm.do?sabun="+sabun;
    		        }
    			});
          });
	function resetButton(){
		document.getElementById("registerForm").reset();
		jQuery("#photos").jqGrid('setGridParam',{datatype:'json', postData: {NAME:'', SABUN:'', POS_GBN_CODE_NAME:'', JOIN_DAY: '', RETIRE_DAY: '', JOIN_GBN_CODE_NAME:'',PUT_YN:'', JOB_TYPE:''}}).trigger('reloadGrid');
		};
	
	function searchSubmit(){
		var name = $("#NAME").val();
		var sabun = $("#SABUN").val();
		var pos_gbn = $("#POS_GBN_CODE_NAME").val();
		var join_day = $("#JOIN_DAY").val();
		var retire_day = $("#RETIRE_DAY").val();
		var join_gbn = $("#JOIN_GBN_CODE_NAME").val();
		var put_yn = $("#PUT_YN").val();
		var job_type = $("#JOB_TYPE").val();
		jQuery("#photos").jqGrid('setGridParam',{datatype:'json', postData: {NAME:name, SABUN:sabun, POS_GBN_CODE_NAME:pos_gbn, JOIN_DAY: join_day, RETIRE_DAY: retire_day, JOIN_GBN_CODE_NAME:join_gbn,PUT_YN:put_yn, JOB_TYPE:job_type}}).trigger('reloadGrid');
	}


	</script>
</body>
</html>
