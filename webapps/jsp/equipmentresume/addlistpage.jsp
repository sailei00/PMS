<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<title>批量添加设备履历</title>
<link href="/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<ul class="nav nav-tabs">
				<li>
					 <a href="/equipmentresume/index">设备履历清单</a>
				</li>
				<li  id="nav2" class="active">
					 <a href="/equipmentresume/add">增加设备履历</a>
				</li>
				<li id="nav3"  style="visibility: hidden;">
					 <a href="#">批量添加</a>
				</li>
			</ul>
		</div>
	</div>
</div>
<h5></h5>	<!-- 空h5是为了空行效果 -->

	<div class="container">
		<div class="row">
			<div class="col-md-12 column">
				<form:form method="post"  modelAttribute="equipmentResume"  role="form"  cssClass="form-horizontal" >
				<form:hidden path="inputDate"/>
					<div class="form-group"> 
						<label class="control-label col-lg-2" for="productNo">出厂编号：<sup style="color:red">*</sup></label>
						<div class="col-lg-8"  style="padding-right: 50px;">
							<form:textarea path="productNo" cssClass="form-control" placeholder='编号之间用逗号","分隔，例如：145786,117605,115060,33144'/>
						</div>
					</div>
					<div class="form-group" style="display: none;" id="invalidNoGroup">
						<label class="control-label col-lg-2" for="productNo">异常编号：</label>
						<div class="col-lg-8 "  >
							<textarea name="invalidNo"  id="invalidNo" class="form-control" placeholder="这些编号的设备没有登记"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-2" for="inputName">登记人：<sup style="color:red">*</sup></label>
						<div class="col-lg-3 ">
							<form:input  cssClass="form-control" path="inputName"/>
						</div>
						<label class="control-label col-lg-2" for="status">设备状态：<sup style="color:red">*</sup></label>
						<div class="col-lg-3 "  style="padding-right: 50px;">
							<form:select path="status" cssClass="form-control" >
								<form:option value="">请选择</form:option>
								<form:option value="使用">使用</form:option>
								<form:option value="备用">备用</form:option>
								<form:option value="待修">待修</form:option>
								<form:option value="送修">送修</form:option>
								<form:option value="送检">送检</form:option>
							</form:select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-8 col-lg-offset-2">
						<button type="submit" class="btn btn-primary btn-block">保存</button>
						</div>
					</div>
				</</form:form>
			</div>
		</div>
	</div>

<!-- 引入datetimepicker插件 -->
<script src="/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<!-- 引入 jquery.validation 验证插件 -->
<script src="/jquery-validation/jquery.validate.js"></script>
<!-- 引入 common.js -->
<script src="/js/common.js"></script>
<script type="text/javascript">
/*********************************************************
*				函数定义区域
*********************************************************/


$(function() {
/***********************************************************
 *				初始化部分
 ***********************************************************/
/**

 //初始化日历控件  
	$('.datetime').datetimepicker({
		language : 'zh-CN',
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		minView : 3,
		forceParse : 0
	});
*/
	var formAction = $("form").attr("action");
	if (formAction.endWith('add')) {
		formAction = "add";
	} else if (formAction.endWith('update')) {
		formAction = "update";
	} else if (formAction.endWith('addlist')) {
		formAction = "addlist";
	}

	if (formAction == 'addlist') {
		$('#nav3').css('visibility','visible');
		$('#nav3').attr("class","active");
		$('#nav2').attr("class","");
	}  else {
		$('#nav2 a').attr("href","#");
	}
/****************************************************************************************
 * 						定义、初始化校验规则
*****************************************************************************************/
/*		调试用
 	$.validator.setDefaults({
	    submitHandler: function() {
	      alert("提交事件!");
	    }
	}); 
*/
	 // 不能为空的验证
    jQuery.validator.addMethod("notBlank", function(value, element) {
        value=$.trim(value);  
        return value != "";       
   },  "不能为空"); 
	
	$("#equipmentResume").validate({
		onkeyup:false,
		rules: {
				productNo: {
			        required: true,
			        notBlank : true,
			        remote: {
			            url: "/equipmentresume/checkproductexsit",     //后台处理程序
			            type: "get",               //数据发送方式
			            dataType: "json",           //接受数据格式   
			            data: {                     //要传递的数据
			                productNo: function() {
			                    return $("#productNo").val();
			                }
			            },
			            dataFilter: function (data){           //判断控制器返回的内容
                           	var arr = data.split("|");
                           	var productNo = arr[0];
                           	var invalidNo = arr[1];
                            if (invalidNo == "") {
                                return true;
                            }
                            else {
                            	$("#productNo").val(productNo);
                            	$("#invalidNo").val(invalidNo);
                            	$("#invalidNoGroup").css("display","");
                                return false;
                            }
                        }
			        }
			    },
				inputName:{
			        required: true,
			        notBlank : true
			    },
			    status :{
			    	required : true
			    }
		},
		messages: {
				productNo: {
					required:"出厂编号不能为空",
					noBlank:"出厂编号不能为空",
					remote:"以下设备尚未登记"
				},
				inputName: "登记人不能为空",
				status : {
					required: "请选择设备状态"
				}
		},
		errorElement: "em",
		errorPlacement: function ( error, element ) {
			// Add the `help-block` class to the error element
			error.addClass( "help-block" );

			// Add `has-feedback` class to the parent div.form-group
			// in order to add icons to inputs
			element.parents("[class^='col']" ).addClass( "has-feedback" );

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
			$( element ).parents( "[class^='col']" ).addClass( "has-error" ).removeClass( "has-success" );
			$( element ).nextAll( "span.form-control-feedback" ).addClass( "glyphicon-remove" ).removeClass( "glyphicon-ok" );
		},
		unhighlight: function ( element, errorClass, validClass ) {
			$( element ).parents("[class^='col']" ).addClass( "has-success" ).removeClass( "has-error" );
			$( element ).nextAll( "span.form-control-feedback" ).addClass( "glyphicon-ok" ).removeClass( "glyphicon-remove" );
		}
	});
	
})
	
	</script>
</body>
</html>