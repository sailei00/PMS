<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<!DOCTYPE html>
<html>
<head>
<title>设备管理页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="/bootstrapValidator/css/bootstrapValidator.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<ul class="nav nav-tabs">
				<li>
					 <a href="/equipment/index">设备清单</a>
				</li>
				<li class="active">
					 <a href="#">增加设备信息</a>
				</li>
			</ul>
		</div>
	</div>
</div>
<h5></h5>	<!-- 空h5是为了空行效果 -->

	<div class="container">
		<form:form method="post"  modelAttribute="equipment"  role="form"  cssClass="form-horizontal" >
		<form:hidden path="id"/>
		<form:hidden path="inputDate"/>
		<div class="row">
			<div class="col-md-12 column">
				<fieldset>
					<legend>设备信息</legend>
					<div class="form-group"> 
						<label class="control-label col-lg-3" for="equipmentNo">设备编号：<sup style="color:red">*</sup></label>
						<div class="col-lg-4" >
							<form:input  cssClass="form-control" path="equipmentNo"  />
						</div>
					</div>
					<div class="form-group"> 
						<label class="control-label col-lg-3" for="equipmentName">设备名称：<sup style="color:red">*</sup></label>
						<div class="col-lg-4 "  >
							<form:input  cssClass="form-control" path="equipmentName"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-3" for="model">设备型号：</label>
						<div class="col-lg-4 ">
							<form:input  cssClass="form-control" path="model"/><form:errors  path="model" cssStyle="color:red"/>
						</div>
					</div>
					<div class="form-group"> 	
						<label class="control-label col-lg-3" for="category">设备分类：<sup style="color:red">*</sup></label>
						<div class="col-lg-4 ">
							<form:input  cssClass="form-control" path="category"/><form:errors  path="category" cssStyle="color:red"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-3" for="techFeature">技术特征：</label>
						<div class="col-lg-4 ">
							<form:textarea path="techFeature"  cssClass="form-control" rows="5" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-3" for="productNo">出厂编号：<sup style="color:red">*</sup></label>
						<div class="col-lg-4 ">
							<form:input  cssClass="form-control" path="productNo"/><form:errors  path="productNo" cssStyle="color:red"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-3" for="factory">生产厂家：</label>
						<div class="col-lg-4  ">
							<form:input  cssClass="form-control" path="factory"/><form:errors  path="factory" cssStyle="color:red"/>
						</div>
					</div>
					<div class="form-group"> 
						<label class="control-label col-lg-3" for="department">使用部门：<sup style="color:red">*</sup></label>
						<div class="col-lg-4 "  style="padding-right: 50px;">
							<form:select path="department" cssClass="form-control" >
									<form:option value="">请选择</form:option>
									<form:option value="安全指挥中心">安全指挥中心</form:option>
									<form:option value="机修厂">机修厂</form:option>
									<form:option value="机电机运队">机电机运队</form:option>
									<form:option value="综掘一队">综掘一队</form:option>
									<form:option value="综掘二队">综掘二队</form:option>
									<form:option value="综采队">综采队</form:option>
									<form:option value="通风科">通风科</form:option>
									<form:option value="生产技术科">生产技术科</form:option>
									<form:option value="机电科">机电科</form:option>
							</form:select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-3" for="status">设备状态：<sup style="color:red">*</sup></label>
						<div class="col-lg-4 "  style="padding-right: 50px;">
							<form:select path="status" cssClass="form-control" >
								<form:option value="">请选择</form:option>
								<form:option value="使用">使用</form:option>
								<form:option value="备用">备用</form:option>
								<form:option value="待修">待修</form:option>
								<form:option value="报废">报废</form:option>
								<form:option value="送修">送修</form:option>
								<form:option value="送检">送检</form:option>
							</form:select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-3" for="address">使用地点：</label>
						<div class="col-lg-4">
							<form:input path="address" cssClass="form-control"/>
						</div>
					</div>
					<div class="form-group"> 	
						<label class="control-label col-lg-3" for="productDate">出厂日期：</label>
						<div class="col-lg-4">
							<div class="input-group  date datetime"   data-date-format="yyyy-mm-dd"   style="padding-right: 35px;">
								<form:input  cssClass="form-control" path="productDate" />
								<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-3" for="buyDate">购置日期：</label>
						<div class="col-lg-4">
							<div class="input-group  date datetime" data-date-format="yyyy-mm-dd"  style="padding-right: 35px;">
								<form:input  cssClass="form-control" path="buyDate" />
								<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-3" for="useDate">使用日期：</label>
						<div class="col-lg-4">
							<div class="input-group  date datetime" data-date-format="yyyy-mm-dd"  style="padding-right: 35px;">
								<form:input  cssClass="form-control" path="useDate"  placeholder="最后一次使用的时间"/>
								<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-3" for="validDate">过期日期：<sup style="color:red"></sup></label>
						<div class="col-lg-4">
							<div class="input-group  date datetime" data-date-format="yyyy-mm-dd"  style="padding-right: 35px;">
								<form:input  cssClass="form-control" path="validDate"  placeholder="检测、鉴定过期时间"/>
								<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-3" for="principal">包机人：</label>
						<div class="col-lg-4 " >
							<form:input path="principal" cssClass="form-control"/><form:errors  path="principal" cssStyle="color:red"/>
						</div>
					</div>
					</fieldset>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 column">
				<fieldset>
					<legend>设备履历</legend>
					
				</fieldset>
				
	<c:if test="${not empty equipmentResumeList }">
	<pg:pager url="/equipmentresume/query" items="${pageInfo.total}"  maxPageItems="${pageInfo.pageSize}"  export="currPageNo=pageNumber">
	<table  class="table table-condensed table-hover  table-striped">
	<thead>
		<tr>
			<td colspan="11" align="center">
				<pg:param name="inputDate"/>
				<pg:param name="productNo"/>
				<pg:param name="inputName"/>
				<pg:param name="principal"/>
				<pg:param name="equipmentName"/>
				<pg:param name="department"/>
				共查询到${pageInfo.total} 条数据，
				<pg:first>
					<a href="${pageUrl }"  >首页</a>         
				</pg:first>
				<pg:prev>
					<a href="${pageUrl }"  >上一页</a>
				</pg:prev>
				<pg:pages>
					<c:choose>
			         <c:when test="${pageNumber eq currPageNo}">
			                  [${pageNumber}]
			         </c:when>
			         <c:otherwise>
			                  <a href="${pageUrl }"  >${pageNumber}</a>
			         </c:otherwise>
					</c:choose>
				</pg:pages>
				<pg:next>
					<a href="${pageUrl }"  >下一页</a>
				</pg:next>
				<pg:last>
					<a href="${pageUrl }"  >尾页</a>
				</pg:last>
			</td>
		</tr>
		<tr>
			<td align="center">序号</td>
			<td align="center">出厂编号</td>
			<td align="center">登记日期</td>
			<td align="center">登记人</td>
			<td align="center">包机人</td>
			<td align="center">设备名称</td>
			<td align="center">设备状态</td>
			<td align="center">使用部门</td>
			<td align="center">使用地点</td>
		</tr>
		</thead>
			<c:forEach items="${equipmentResumeList}" var="it" varStatus="status">
				<tr>
					<td align="center">${(currPageNo-1) * pageInfo.pageSize + status.index  + 1}</td>
					<td align="center"><a href="${it.uuid}/update">${it.productNo}</a></td>
					<td align="center"><fmt:formatDate value="${it.inputDate}" pattern="yyyy-MM-dd"/></td>
					<td align="center">${it.inputName} </td>
					<td align="center">${it.principal}</td>
					<td align="center">${it.equipmentName} </td>
					<td align="center">${it.status}</td>
					<td align="center">${it.department}</td>
					<td align="center">${it.address}</td>
			</c:forEach>
	</table>
	</pg:pager>
	</c:if>
			</div>
		</div>
	<button type="submit" class="btn btn-primary col-lg-offset-3">保存</button>
	</form:form>
	</div>





	<!-- 引入datetimepicker插件 -->
	<script src="/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
	<script src="/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	<!-- 引入 bootstrapValidator 表单验证插件 -->
	<script src="/bootstrapValidator/js/bootstrapValidator.min.js" charset="UTF-8"></script>
	<!-- 引入 common.js -->
	<script src="/js/common.js"></script>
	<script type="text/javascript">
	$(function(){
		//初始化日历控件
		$('.datetime').datetimepicker({
	        language:  'zh-CN',
	        weekStart: 1,
	        todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 3,
			forceParse: 0
	    });
		
		var id = $("#id").val();
		var formAction = $("form").attr("action");
		if (formAction.endWith('add')) {
			formAction = "add";
		} else if (formAction.endWith('update')) {
			formAction = "update";
		}
		
			 
		 $('#equipment').bootstrapValidator({
		        message: '请重新填写',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        threshold: 3,
		        fields: {
		            equipmentNo: {
		                message: '请填写设备编号',
		                validators: {
		                    notEmpty: {
		                        message: '请填写设备编号'
		                    },
		                    remote: {
		                        message: '该设备编码已存在',
		                        url: '/equipment/validation',
		                        data:{
		                        	id:id,
		                        	action:formAction
		                        }
		                    }
		                }
		            },
		            equipmentName: {
		                validators: {
		                    notEmpty: {
		                        message: '请填写设备名称'
		                    }
		                }
		            },
		            category: {
		                validators: {
		                    notEmpty: {
		                        message: '请选择设备分类'
		                    }
		                }
		            },
		            productNo: {
		                validators: {
		                    notEmpty: {
		                        message: '请填写出厂编号'
		                    },
		                    remote: {
		                        message: '此出厂编号已存在',
		                        url: '/equipment/validation',
		                        data:{
		                        	id : id,
		                        	action:formAction
		                        }
		                    }
		                }
		            },
		            department: {
		                validators: {
		                    notEmpty: {
		                        message: '请选择使用部门'
		                    }
		                }
		            },
		            status: {
		                validators: {
		                    notEmpty: {
		                        message: '请选择设备状态'
		                    }
		                }
		            },
		            productDate: {
		                validators: {
		                	date: {
		                        format: 'YYYY-MM-DD',
		                        message: '日期格式有误'
		                    },
		                	callback: {
		                        message: '出厂日期不能晚于今天',
		                        callback: function(value, validator) {
		                        	var valid = compareFullDate(value,convertFullDateToString());
		                        	return valid <= 0;
		                        }
		                    }
		                }
		            },
		            buyDate: {
		                validators: {
		                	date: {
		                        format: 'YYYY-MM-DD',
		                        message: '日期格式有误'
		                    },
		                	callback: {
		                        message: '购置日期不能晚于今天',
		                        callback: function(value, validator) {
		                        	var valid = compareFullDate(value,convertFullDateToString());
		                        	return valid <= 0;
		                        }
		                    }
		                }
		            },
		            useDate: {
		                validators: {
		                	date: {
		                        format: 'YYYY-MM-DD',
		                        message: '日期格式有误'
		                    },
		                	callback: {
		                        message: '使用日期不能晚于今天',
		                        callback: function(value, validator) {
		                        	var valid = compareFullDate(value,convertFullDateToString());
		                        	return valid <= 0;
		                        }
		                    }
		                }
		            }
		        }
		    });
		 
//		 $('#productDate,#buyDate,#useDate')
		$('.form-control')
	        .on('change', function(e) {
	            // Validate the date when user change it
	            $('#equipment')
	                // Get the bootstrapValidator instance
	                .data('bootstrapValidator')
	                // Mark the field as not validated, so it'll be re-validated when the user change date
	                .updateStatus(e.target.id, 'NOT_VALIDATED', null)
	                // Validate the field
	                .validateField(e.target.id);
	        });
		
		
		
	})
	

	//将form转为AJAX提交 (暂时没有用到)
	function ajaxSubmit(frm, fn) {
	    var dataPara = getFormJson(frm);
	    $.ajax({
	        url: '/equipment/validate',
	        type: 'get',
	        data: dataPara,
	        success: fn,
	        error : function(xhr,status,error){
	        	alert("Error: "+xhr.status+": "+xhr.statusText);
	        	alert(xhr+"|"+status+"|"+error);
	        }
	    });
	}
	</script>
</body>
</html>