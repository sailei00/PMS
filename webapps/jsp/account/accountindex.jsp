<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>入出库</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-4 column">
			<ul class="nav nav-tabs">
				<li class="active">
					 <a href="#">出入库查询</a>
				</li>
				<li>
					 <a href="add?type=1">增加入库信息</a>
				</li>
				<li>
					 <a href="add?type=0">增加出库信息</a>
				</li>
			</ul>
		</div>
		<div class="col-md-8 column">
				<div class="alert alert-info alert-dismissible fade in"  style="padding-top: 10px;padding-bottom: 10px;margin-bottom: 0px;">
					如果对新版界面有任何疑问，请联系8231或15383551533，毋雷。欢迎提出建议和意见。
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">关闭</button>
				</div>
		</div>
	</div>
</div>
<h5></h5>	<!-- 空h5是为了空格效果 -->
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<form:form action="query" method="get" role="form"  cssClass="form-horizontal" >
					<div class="form-group"> 
						<label class="control-label col-sm-1" for="item.code">物料编码</label>
						<div class="col-sm-2">
							<input	type="text" class="form-control" id="item.code"  name="item.code"/>
						</div>
						<label class="control-label col-sm-1" for="item.name">物料名称</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" id="item.name"  name="item.name"/>
						</div>
						<label class="control-label col-sm-1" for="startTime">开始日期</label>
						<div class="col-sm-2">
							<input type="text" class="form-control datetime" id="startTime" name="startTime" data-date-format="yyyy-mm"/>
						</div>
						<label class="control-label col-sm-1" for="endTime">结束日期</label>
						<div class="col-sm-2">
							<input type="text" class="form-control datetime"  id="endTime" name="endTime" data-date-format="yyyy-mm"/>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-1" for="department">部门</label>
						<div class="col-sm-2">
							<select name="department" id="department" class="form-control">
									<option value="">所有部门</option>
									<option value="机修厂">机修厂</option>
									<option value="机电机运队">机电机运队</option>
									<option value="综掘一队">综掘一队</option>
									<option value="综掘二队">综掘二队</option>
									<option value="综采队">综采队</option>
									<option value="通风科">通风科</option>
									<option value="生产技术科">生产技术科</option>
									<option value="机电科">机电科</option>
							</select>   
						</div>
						<label class="control-label col-sm-1" for="costType">费用类型</label>
						<div class="col-sm-2">
							<select name="costType" id="costType" class="form-control">
								<option value="">请选择</option>
								<option value="承包费">承包费</option>
								<option value="掘进费">掘进费</option>
								<option value="生产费">生产费</option>
								<option value="安全费">安全费</option>
							</select>
						</div>
						<div class="col-sm-6">
							<button type="submit" class="btn btn-success btn-block">查询</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<c:if test="${not empty accList }">
		<center>
				<table  class="table table-condensed  table-bordered table-hover  table-striped">
				<pg:pager url="/account/query" items="${pageInfo.total}"  maxPageItems="${pageInfo.pageSize}"  export="currPageNo=pageNumber">
				<thead>
					<tr>
						<td colspan="11" align="center">
							<pg:param name="item.code"/>
							<pg:param name="item.name"/>
							<pg:param name="startTime"/>
							<pg:param name="endTime"/>
							<pg:param name="department"/>
							<pg:param name="costType"/>
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
						<td align="center">入出库</td>
						<td align="center">物料编码</td>
						<td align="center">物料名称</td>
						<td align="center">型号</td>
						<td align="center">计量单位</td>
						<td align="center">数量</td>
						<td align="center">费用类型</td>
						<td align="center">日期</td>
						<td align="center">部门</td>
						<td align="center">操作</td>
					</tr>
					</thead>
						<c:forEach items="${accList}" var="it" varStatus="status">
							<tr>
								<td align="center">${(currPageNo-1) * pageInfo.pageSize + status.index  + 1}</td>
								<td align="center">
									<c:if test="${it.type==1}">入库</c:if>
									<c:if test="${it.type==0}">出库</c:if>
								</td>
								<td align="center">${it.item.code} </td>
								<td align="center">${it.item.name} </td>
								<td align="center">${it.item.model} </td>
								<td align="center">${it.item.unit}</td>
								<td align="center">${it.number}</td>
								<td align="center">${it.costType}</td>
								<td align="center"><fmt:formatDate value="${it.optTime}" pattern="yyyy-MM-dd"/> </td>
								<td align="center">${it.department}</td>
								<td align="center">
									<c:if test="${loginuser.usertype ne 2}">		<!-- 领导只能看，不能增改入出库 -->
										<c:if test="${it.type eq 1}">	<a href="add?forid=${it.id}">出库</a> </c:if>
										<a href="${it.id}/update">修改</a> <a href="${it.id}/delete" onClick="return confirm('确定要删除序号为(${(currPageNo-1) * pageInfo.pageSize + status.index  + 1})的记录吗？');">删除</a>
									</c:if>
								</td>
						</c:forEach>
						</pg:pager>
				</table>
		</center>
	</c:if>
	
	<script src="/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
	<script src="/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	<script type="text/javascript">
		function setSelectReadonly(fieldid,selectedvalue,selectedtext) {
			$("#"+fieldid).empty();		
			var opt = "<option value='"+selectedvalue+"'>" + selectedtext + "</option>";
			$("#" + fieldid).append(opt);
		}

		$(function() {
			var usertype = "${loginuser.usertype}";
			var userdepartment = "${loginuser.department}";
			if (usertype == "1") { //队组
				$("#department").val(userdepartment);
				setSelectReadonly("department",userdepartment,userdepartment);
			} else {

			}

			$('.datetime').datetimepicker({
				language : 'zh-CN',
				weekStart : 1,
				todayBtn : 1,
				autoclose : 1,
				todayHighlight : 1,
				startView : 3,
				minView : 3,
				forceParse : 0
			});

		})
	</script>
</body>
</html>