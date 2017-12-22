<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<jsp:useBean id="now" class="java.util.Date" scope="page"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>出入库单</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 引入 Bootstrap 日历控件 -->
<link href="/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

</head>

<body>

<div class="container">
	<div class="row clearfix">
		<div class="col-md-6 column">
			<ul class="nav nav-tabs">
				<li id="nav1">
					 <a href="/account/index">出入库查询</a>
				</li>
				<li id="nav2" >
					 <a href="/account/add?type=1">增加入库信息</a>
				</li>
				<li id="nav3" >
					 <a href="/account/add?type=0">增加出库信息</a>
				</li>
				<li id="nav4"  style="visibility: hidden;">
					 <a href="#">修改出入库信息</a>
				</li>
			</ul>
		</div>
		<div class="col-md-6 column">
				<div class="alert alert-info alert-dismissible fade in"  style="padding-top: 10px;padding-bottom: 10px;margin-bottom: 0px;">
					如果对新版界面有任何疑问，请联系8231或15383551533，毋雷。
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">关闭</button>
				</div>
		</div>
	</div>
</div>



<div class="container">
	<div class="row">
		<div class="col-md-2 column">
		</div>
		<div class="col-md-8 column">
			<form:form method="post"  modelAttribute="account"  role="form"  cssClass="form-horizontal" >
			<form:hidden path="updateTime"  readonly="true" />
				<fieldset>
					<legend style="text-align:center" >
						<c:if test="${not empty account.id}">修改</c:if><c:if test="${empty account.id }">新增</c:if>
						<c:if test="${account.type==0}">出库单</c:if><c:if test="${account.type==1}">入库单</c:if>
						<c:if test="${not empty account.id}">${account.id}</c:if>
					</legend>
				</fieldset>
				<div class="form-group"> 
					<label class="control-label col-lg-2" for="type">单据类型：</label>
					<div class="col-lg-4" >
						<c:if test="${account.type==0}"><input class="form-control"  value="出库" readonly/><form:hidden path="type"  value="0" /></c:if>
						<c:if test="${account.type==1}"><input class="form-control"  value="入库" readonly/><form:hidden path="type"  value="1" /></c:if>
					</div>
					<label class="control-label col-lg-2" for="item.code">物料编码：<sup style="color:red">*</sup></label>
					<div class="col-lg-4" >
						<div class=" input-group" >
							<form:input path="item.code" cssClass="form-control"  />
							<span class="input-group-addon" style="cursor: pointer;" data-backdrop="static"  data-toggle="modal" data-target="#itemSearch" onclick="showSearchPage()"><span class="glyphicon glyphicon-search"></span></span>
						</div>
					</div>
				</div>
				<div class="form-group"> 
					<label class="control-label col-lg-2" for="item.name">物料名称：<sup style="color:red">*</sup></label>
					<div class="col-lg-4" >
						<div class=" input-group" >
							<form:input path="item.name" cssClass="form-control"  />
							<span class="input-group-addon" style="cursor: pointer;" data-backdrop="static"  data-toggle="modal" data-target="#itemSearch" onclick="showSearchPage()"><span class="glyphicon glyphicon-search"></span></span>
						</div>
					</div>
					<label class="control-label col-lg-2" for="item.model">型号：</label>
					<div class="col-lg-4" >
						<form:input path="item.model" cssClass="form-control"  />
					</div>
				</div>
				<div class="form-group"> 
					<label class="control-label col-lg-2" for="item.unit">计量单位：</label>
					<div class="col-lg-4" >
						<form:input path="item.unit" cssClass="form-control"  />
					</div>
					<!-- 录入时间24小时后不允许修改数量      (每天是86400000毫秒)      -->
					<label class="control-label col-lg-2" for="number">数量：<sup style="color:red">*</sup></label>
					<div class="col-lg-4" >
						<form:input path="number" cssClass="form-control"  readonly="${account.createTime.time + 86400000 < now.time}"/>
					</div>
				</div>
				<div class="form-group"> 
					<label class="control-label col-lg-2" for="price">单价：<sup style="color:red">*</sup></label>
					<div class="col-lg-4" >
						<form:input path="price"  cssClass="form-control" />
					</div>
					<label class="control-label col-lg-2" for="amount">金额：</label>
					<div class="col-lg-4" >
						<form:input path="amount"  cssClass="form-control"  />
					</div>
				</div>
				<div class="form-group"> 
					<label class="control-label col-lg-2" for="department">归属部门：<sup style="color:red">*</sup></label>
					<div class="col-lg-4" >
						<form:input path="department" readonly="true" cssClass="form-control"  />
					</div>
					<label class="control-label col-lg-2" for="operator">操作员：</label>
					<div class="col-lg-4" >
						<form:input path="operator" readonly="true" cssClass="form-control"  />
					</div>
				</div>
				<div class="form-group"> 
					<label class="control-label col-lg-2" for="handler">经办人：</label>
					<div class="col-lg-4" >
						<form:input path="handler" cssClass="form-control"  />
					</div>
					<label class="control-label col-lg-2" for="optTime">办理时间：<sup style="color:red">*</sup></label>
					<div class="col-lg-4">
						<div class=" input-group  date datetime"  data-date-format="yyyy-mm-dd" >
							<form:input path="optTime" cssClass="form-control"  readonly="true" />
							<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
						</div>
					</div>
				</div>
				<div class="form-group"> 
					<label class="control-label col-lg-2" for="createTime">录入时间：<sup style="color:red">*</sup></label>
					<div class="col-lg-4" >
						<form:input path="createTime"  readonly="true" cssClass="form-control"  />
					</div>
					<label class="control-label col-lg-2" for="costType">费用类别：<sup style="color:red">*</sup></label>
					<div class="col-lg-4" >
						<form:select path="costType" cssClass="form-control" >
							<form:option value="">请选择</form:option>
							<form:option value="承包费">承包费</form:option>
							<form:option value="掘进费">掘进费</form:option>
							<form:option value="生产费">生产费</form:option>
							<form:option value="安全费">安全费</form:option>
						</form:select>
					</div>
				</div>
				<div class="form-group"> 
					<label class="control-label col-lg-2" for="reason">出入库原因：</label>
					<div class="col-lg-10" >
						<form:textarea path="reason" cssClass="form-control"  />
					</div>
				</div>
				<button type="submit" class="btn btn-primary btn-block">保存</button>
			</form:form>
		</div>
	</div>
</div>
					
<!-- 模态框（Modal） -->
<div class="modal fade" id="itemSearch" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"  aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel" style="text-align:center;">
					选择物料信息(按ESC键可关闭)
				</h4>
			</div>
			<div class="modal-body">
				<iframe id="searchFrame"   style="width:100%"></iframe>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- 引入datetimepicker插件 -->
<script src="/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<!-- 引入 jquery.validation 验证插件 -->
<script src="/jquery-validation/jquery.validate.js"></script>
<!-- 引入 common.js -->
<script src="/js/common.js"></script>
<script type="text/javascript">
/****************************************************************
 * 												页面显示初始化
 ****************************************************************/
$(function() {
	<c:if test="${not empty account.id}">
		var optType = 'update';
	</c:if>
	<c:if test="${empty account.id }">
		var optType = 'add';
	</c:if>
	
	if (optType == 'update') {
		$('#nav4').css('visibility','visible');
		$('#nav4').attr("class","active");
	} else {
		<c:if test="${account.type==1}">
			$('#nav2').attr("class","active");
			$('#nav2 a').attr("href","#");
		</c:if>
		<c:if test="${account.type==0}">
			$('#nav3').attr("class","active");
			$('#nav3 a').attr("href","#");
		</c:if>
	}
	
	
	//初始化日历控件
	$('.datetime').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	
/****************************************************************************************
 * 						定义、初始化校验规则
*****************************************************************************************/
/* 	$.validator.setDefaults({
	    submitHandler: function() {
	      alert("提交事件!");
	    }
	}); */
	
	 // 判断浮点数value是否大于0
    jQuery.validator.addMethod("isFloatGtZero", function(value, element) {
         value=parseFloat(value);      
         return this.optional(element) || value>0;       
    }, "浮点数必须大于0"); 
	 
	 // 不能为空的验证
    jQuery.validator.addMethod("notBlank", function(value, element) {
        value=$.trim(value);  
        return value != "";       
   },  "不能为空"); 
	 
	 // 金额=单价 × 数量 的验证   (只能在amount上使用)
    jQuery.validator.addMethod("calcAmount", function(value, element) {
    	var amount,number,price;
		number = $("#number").val();
    	price = $("#price").val();
    	$("#amount").val(Number(number*price).toFixed(2));
		amount = $("#amount").val();
    	if (Number(amount) != Number(number*price).toFixed(2)) {
    		return false;
    	} else {
    		return true;
    	}
   },  "金额 不等于 单价 × 数量"); 
	
	$("#account").validate({
		rules: {
				"item.code": {
			        required: true,
			        notBlank : true
			    },
				"item.name":{
			        required: true,
			        notBlank : true
			    },
				price: {
			        required: true,
			    	calcAmount : true,
			        isFloatGtZero : true
			    }, 
			    number: {
			        required: true,
			    	calcAmount : true,
			        isFloatGtZero : true
			    }, 
			    amount :{
			    	required : true,
			    	isFloatGtZero : true,
			    	calcAmount : true
			    },
			    optTime : "required",
			    costType : "required"
		},
		messages: {
				"item.code": "物料编码不能为空",
				"item.name": "物料名称不能为空",
				price : {
					required: "请输入单价",
					isFloatGtZero: "单价必须大于0"
				},
				number : {
					required: "请输入数量",
					isFloatGtZero: "数量必须大于0"
				},
				amount : {
					required: "请输入金额",
					isFloatGtZero: "金额必须大于0",
					calcAmount : "金额不等于 单价 × 数量"
				},
				optTime : "请输入办理时间",
				costType : "请选择费用类别"
		},
		errorElement: "em",
		errorPlacement: function ( error, element ) {
			// Add the `help-block` class to the error element
			error.addClass( "help-block" );

			// Add `has-feedback` class to the parent div.form-group
			// in order to add icons to inputs
			element.parents( ".col-lg-4" ).addClass( "has-feedback" );

			if ( element.prop( "type" ) === "checkbox" ) {
				error.insertAfter( element.parent( "label" ) );
			} else {
				// 如果是input-group，则把提示放在input-group后
				if(element.parent().hasClass("input-group")){
					error.insertAfter(element.parent());
				} else 
					error.insertAfter( element );
			}

			// Add the span element, if doesn't exists, and apply the icon classes to it.
			if ( !element.next( "span" )[ 0 ] ) {
				$( "<span class='glyphicon glyphicon-remove form-control-feedback'></span>" ).insertAfter( element );
			}
		},
		success: function ( label, element ) {
			// Add the span element, if doesn't exists, and apply the icon classes to it.
			if ( !$( element ).next( "span" )[ 0 ] ) {
				$( "<span class='glyphicon glyphicon-ok form-control-feedback'></span>" ).insertAfter( $( element ) );
			}
		},
		highlight: function ( element, errorClass, validClass ) {
			$( element ).parents( ".col-lg-4" ).addClass( "has-error" ).removeClass( "has-success" );
			$( element ).nextAll( "span.form-control-feedback" ).addClass( "glyphicon-remove" ).removeClass( "glyphicon-ok" );
		},
		unhighlight: function ( element, errorClass, validClass ) {
			$( element ).parents( ".col-lg-4" ).addClass( "has-success" ).removeClass( "has-error" );
			$( element ).nextAll( "span.form-control-feedback" ).addClass( "glyphicon-ok" ).removeClass( "glyphicon-remove" );
		}
	});
	
	
	
})

/****************************************************
 *    						          函数定义区
 *		showSearchPage				显示物料选择页面(点击放大镜按钮时)
 *		closeModal							关闭物料选择页面(选择物料后调用)
 ****************************************************/
function showSearchPage() {
	var searchFrame = document.getElementById("searchFrame");
	var code = $("[id='item.code']").val();
	var name = $("[id='item.name']").val();
	var model = $("[id='item.model']").val();
	var param = "";
	
	if (code != null && code != "") {
		param = param + "&code=" + code;
	}
	if (name != null && name != "") {
		param = param + "&name=" + name;
	}
	if (model != null && model != "") {
		param = param + "&model=" + model;
	}
	searchFrame.src = "/item/queryforadd?source=account" + param;
	
}

function closeModal() {
	$('#itemSearch').modal('hide');
}

</script>
</body>
</html>