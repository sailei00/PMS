<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<!DOCTYPE html>
<html>
<head>
<title>设备管理首页</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<ul class="nav nav-tabs">
				<li class="active">
					 <a href="#">设备清单</a>
				</li>
				<li>
					 <a href="add">增加设备信息</a>
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
						<label class="control-label col-sm-1" for="equipmentNo">设备编号</label>
						<div class="col-sm-2">
							<input	type="text" class="form-control" id="equipmentNo"  name="equipmentNo"/>
						</div>
						<label class="control-label col-sm-1" for="equipmentName">设备名称</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" id="equipmentName"  name="equipmentName"/>
						</div>
						<label class="control-label col-sm-1" for="model">设备型号</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" id="model"  name="model"/>
						</div>
						<label class="control-label col-sm-1" for="category">设备分类</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" id="category" name="category" />
						</div>
					</div>
					<div class="form-group"> 
						<label class="control-label col-sm-1" for="productNo">出厂编号</label>
						<div class="col-sm-2">
							<input type="text" class="form-control"  id="productNo" name="productNo"/>
						</div>
						<label class="control-label col-sm-1" for="factory">生产厂家</label>
						<div class="col-sm-2">
							<input type="text" class="form-control"  id="factory" name="factory"/>
						</div>
						<label class="control-label col-sm-1" for="department">使用部门</label>
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
						<label class="control-label col-sm-1" for="status">设备状态</label>
						<div class="col-sm-2">
							<select name="status" id="status" class="form-control">
								<option value="">不限</option>
								<option value="使用">使用</option>
								<option value="备用">备用</option>
								<option value="待修">待修</option>
								<option value="报废">报废</option>
							</select>
						</div>
					</div>
					<button type="submit" class="btn btn-block btn-success">查询</button>
				</</form:form>
			</div>
		</div>
	</div>
<!--  ========================================查询结果================================================== -->

	<c:if test="${not empty equipmentList }">
		<pg:pager url="/equipment/query" items="${pageInfo.total}"  maxPageItems="${pageInfo.pageSize}"  export="currPageNo=pageNumber">
				<table  class="table table-condensed table-hover  table-striped">
				<thead>
					<tr>
						<td colspan="11" align="center">
							<pg:param name="equipmentNo"/>
							<pg:param name="equipmentName"/>
							<pg:param name="model"/>
							<pg:param name="category"/>
							<pg:param name="productNo"/>
							<pg:param name="factory"/>
							<pg:param name="department"/>
							<pg:param name="status"/>
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
						<td align="center">设备编号</td>
						<td align="center">设备名称</td>
						<td align="center">设备型号</td>
						<td align="center">设备分类</td>
						<td align="center">出厂编号</td>
						<td align="center">生产厂家</td>
						<td align="center">使用部门</td>
						<td align="center">设备状态</td>
						<td align="center">使用地点</td>
					</tr>
					</thead>
						<c:forEach items="${equipmentList}" var="it" varStatus="status">
							<tr>
								<td align="center">${(currPageNo-1) * pageInfo.pageSize + status.index  + 1}</td>
								<td align="center"><a href="${it.id}/update">${it.equipmentNo}</a></td>
								<td align="center">${it.equipmentName} </td>
								<td align="center">${it.model} </td>
								<td align="center">${it.category} </td>
								<td align="center">${it.productNo}</td>
								<td align="center">${it.factory}</td>
								<td align="center">${it.department}</td>
								<td align="center">${it.status}</td>
								<td align="center">${it.address}</td>
						</c:forEach>
				</table>
		</pg:pager>
	</c:if>
	
</body>
</html>