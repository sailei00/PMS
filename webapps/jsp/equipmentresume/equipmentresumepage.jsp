<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<title>设备履历信息</title>
<link href="/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
</head>
<body>
<%--
当有多条编号匹配结果时，弹出供选择的窗口
 --%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" style="top:20%;">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title center">选择设备</h3>
      </div>
      <div class="modal-body">
        <table  class="table table-hover table-bordered" id="equipmentListTable"></table>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<ul class="nav nav-tabs">
				<li>
					 <a href="/equipmentresume/index">设备履历清单</a>
				</li>
				<li  id="nav2" >
					 <a href="/equipmentresume/add">增加设备履历</a>
				</li>
				<li id="nav3" >
					 <a href="/equipmentresume/addlist">快速添加履历</a>
				</li>
				<li id="nav4"  style="visibility: hidden;">
					 <a href="#">修改设备履历信息</a>
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
				<form:hidden path="uuid"/>
					<div class="form-group"> 
						<label class="control-label col-lg-2" for="productNo">出厂编号：<sup style="color:red">*</sup></label>
						<div class="col-lg-3" >
							<form:input  cssClass="form-control" path="productNo"  onchange="getEquipmentInfo()"/>
						</div>
					</div>
					<div class="form-group"> 
						<label class="control-label col-lg-2" for="category">设备类型：</label>
						<div class="col-lg-3 "  >
							<form:input  cssClass="form-control" path="category" readonly="true"/>
						</div>
						<label class="control-label col-lg-2" for="equipmentName">设备名称：</label>
						<div class="col-lg-3 "  >
							<form:input  cssClass="form-control" path="equipmentName" readonly="true"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-2" for="inputName">登记人：<sup style="color:red">*</sup></label>
						<div class="col-lg-3 ">
							<form:input  cssClass="form-control" path="inputName"/>
						</div>
						<label class="control-label col-lg-2" for="principal">包机人：<sup style="color:red">*</sup></label>
						<div class="col-lg-3 " >
							<form:input path="principal" cssClass="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-2" for="status">设备状态：<sup style="color:red">*</sup></label>
						<div class="col-lg-3 "  style="padding-right: 50px;">
							<form:select path="status" cssClass="form-control" >
								<form:option value="">请选择</form:option>
								<form:option value="在用">在用</form:option>
								<form:option value="备用">备用</form:option>
								<form:option value="待修">待修</form:option>
								<form:option value="报废">报废</form:option>
								<form:option value="送修">送修</form:option>
								<form:option value="送检">送检</form:option>
							</form:select>
						</div>
						<label class="control-label col-lg-2" for="optDate">登记日期：</label>
						<div class="col-lg-3">
							<div class=" input-group  date datetime"  data-date-format="yyyy-mm-dd" >
								<form:input path="optDate" cssClass="form-control"/>
								<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-2" for="address">使用地点：</label>
						<div class="col-lg-8">
							<form:input path="address" cssClass="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-2" for="remark">备注：</label>
						<div class="col-lg-8">
							<form:textarea path="remark"  cssClass="form-control" rows="5" />
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
<br><br><br><br><!-- 手机浏览时保存按钮显示不全，所以增加点空行 -->

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

function getEquipmentInfo() {
	//alert("获取一次设备信息");
	var productNo = $("#productNo").val();
	if (productNo != '' && productNo.length >=3) {
			$.get("/equipmentresume/getequipmentinfo?productNo=" + productNo, function(data, status) {
				if (status == 'success') {
					if(data == 'null' || data.length == 0) {			// 没有查到相关信息
						$("#equipmentName").val("");
						$("#category").val("");
					} else if(data.length > 0) {			//查到数据
						if (data.length == 1) { 		// 只有一条数据
							$("#equipmentName").val(data[0].equipmentName);
							$("#category").val(data[0].category);
						} else {				// 有1条以上数据
							// 打开选择框，选择一条正确的数据
							$("#equipmentListTable").empty();
							var tb = $("#equipmentListTable")[0];			//jquery对象转变为dom对象
							var th = tb.insertRow();
							th.insertCell(0).innerHTML = "编号";
							th.insertCell(1).innerHTML = "设备名称";
							th.insertCell(2).innerHTML = "设备类型";
							for(i = 0;i<data.length;i++){
								var tr = tb.insertRow();
								var td1 = tr.insertCell(0);
								var td2 = tr.insertCell(1);
								var td3 = tr.insertCell(2);
								td1.innerHTML = productNo;
								td2.innerHTML = data[i].equipmentName;
								td3.innerHTML = data[i].category;
							}
							$("#equipmentListTable").delegate("tr","click",function(e){
							    var tar = e.currentTarget;
							    var eName = tar.cells[1].innerHTML;
							    var cate = tar.cells[2].innerHTML;
							    $("#category").val(cate);
							    $("#equipmentName").val(eName);
								$('#myModal').modal('hide');			//关闭选择框
							  });
							$('#myModal').modal('show');			//显示选择框
						}
					}
					//var obj = JSON.parse(data);
				} else {
					alert('查询设备信息失败');
				}
			});
	}
}

$(function() {
/***********************************************************
 *				初始化部分
 ***********************************************************/


 //初始化日历控件  
	$('.datetime').datetimepicker({
		language : 'zh-CN',
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		minView : 2,
		forceParse : 0
	});

	var formAction = $("form").attr("action");
	if (formAction.endWith('add')) {
		formAction = "add";
	} else if (formAction.endWith('update')) {
		formAction = "update";
	}

	if (formAction == 'update') {
		$('#nav4').css('visibility','visible');
		$('#nav4').attr("class","active");
		$('#nav2').attr("class","");
	}  else {
		$('#nav2 a').attr("href","#");
		$('#nav2').attr("class","active");
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
		rules: {
				productNo: {
			        required: true,
			        notBlank : true,
			        remote: {
			            url: "/equipmentresume/validation",     //后台处理程序
			            type: "get",               //数据发送方式
			            dataType: "json",           //接受数据格式   
			            data: {                     //要传递的数据
			                productNo: function() {
			                	//TODO： 这里的校验会发送两次，原因不明
			                	//alert("发送一次校验productno="+$("#productNo").val());
			                    return $("#productNo").val();
			                }
			            },
			            dataFilter: function (data){           //判断控制器返回的内容
                            if (data == "true") {
                                return true;
                            }
                            else {
                                return false;
                            }
                        }
			        }
			    },
				inputName:{
			        required: true,
			        notBlank : true
			    },
			    optDate:{
			        required: true
			    },
				principal: {
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
					remote:"该设备尚未登记"
				},
				inputName: "登记人不能为空",
				optDate: "登记日期不能为空",
				principal : {
					required: "包机人不能为空"
				},
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
			element.parents( ".col-lg-3" ).addClass( "has-feedback" );

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
			$( element ).parents( ".col-lg-3" ).addClass( "has-error" ).removeClass( "has-success" );
			$( element ).nextAll( "span.form-control-feedback" ).addClass( "glyphicon-remove" ).removeClass( "glyphicon-ok" );
		},
		unhighlight: function ( element, errorClass, validClass ) {
			$( element ).parents( ".col-lg-3" ).addClass( "has-success" ).removeClass( "has-error" );
			$( element ).nextAll( "span.form-control-feedback" ).addClass( "glyphicon-ok" ).removeClass( "glyphicon-remove" );
		}
	});
	
})
	
	</script>
</body>
</html>