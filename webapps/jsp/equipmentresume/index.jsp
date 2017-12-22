<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<!DOCTYPE html>
<html>
<head>
<title>设备履历首页</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<ul class="nav nav-tabs">
				<li class="active">
					 <a href="#">设备履历清单</a>
				</li>
				<li>
					 <a href="add">增加设备履历</a>
				</li>
				<li id="nav3" >
					 <a href="addlist">快速添加履历</a>
				</li>
			</ul>
		</div>
	</div>
</div>
<h5></h5>	<!-- 空h5是为了空格效果 -->
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<form:form action="query" method="get" role="form"  cssClass="form-horizontal" >
					<div class="form-group"> 
						<label class="control-label col-md-1" for="productNo">出厂编号</label>
						<div class="col-md-2">
							<input	type="text" class="form-control" id="productNo"  name="productNo" placeholder='例如:0116, 4849,6352'/>
						</div>
						<label class="control-label col-md-1" for="equipmentName">设备名称</label>
						<div class="col-md-2">
							<input type="text" class="form-control" id="equipmentName"  name="equipmentName"/>
						</div>
						<label class="control-label col-md-1" for="inputName">登记人</label>
						<div class="col-md-2">
							<input type="text" class="form-control" id="inputName"  name="inputName"/>
						</div>
						<label class="control-label col-md-1" for="principal">包机人</label>
						<div class="col-md-2">
							<input type="text" class="form-control" id="principal"  name="principal"/>
						</div>
					</div>
					<div class="form-group"> 
						<label class="control-label col-md-1" for="department">使用部门</label>
						<div class="col-md-2">
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
						<div class="col-md-9">
							<button type="submit" class="btn btn-block btn-success">查询</button>
						</div>
					</div>
				</</form:form>
			</div>
		</div>
	</div>

<!--  ========================================快速添加结果================================================== -->
<c:if test="${not empty param.message }">
				<div class="alert alert-success  alert-dismissible fade in" >
					${param.message}
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
				</div>
</c:if>
<!--  ========================================查询结果================================================== -->

	<c:if test="${not empty equipmentResumeList }">
		<pg:pager url="/equipmentresume/query" items="${pageInfo.total}"  maxPageItems="${pageInfo.pageSize}"  export="currPageNo=pageNumber">
				<table  class="table table-condensed table-hover  table-striped">
				<thead>
					<tr>
						<td colspan="11" align="center">
							<pg:param name="optDate"/>
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
						<td align="center">设备名称</td>
						<td align="center">设备状态</td>
						<td align="center">使用部门</td>
						<td align="center">使用地点</td>
						<td align="center">备注</td>
					</tr>
					</thead>
						<c:forEach items="${equipmentResumeList}" var="it" varStatus="status">
							<tr class="${it.remark=='temp'?'danger':''}" >
								<td align="center">${(currPageNo-1) * pageInfo.pageSize + status.index  + 1}</td>
								<td align="center"><a href="${it.uuid}/update">${it.productNo}</a></td>
								<td align="center"><fmt:formatDate value="${it.optDate}" pattern="yyyy-MM-dd"/></td>
								<td align="center">${it.inputName} </td>
								<td align="center">${it.equipmentName} </td>
								<td align="center">${it.status}</td>
								<td align="center">${it.department}</td>
								<td align="center">${it.address}</td>
								<td align="center">${it.remark}</td>
						</c:forEach>
				</table>
		</pg:pager>
	</c:if>
	
</body>
</html>