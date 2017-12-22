<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>设备统计页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

		<div class="row">
			<div class="col-md-1 column">
			</div>
			<div class="col-md-10 column">
				<h2 class="text-center">设备统计</h2>
				<c:if test="${not empty statisticsList }">
					<table  class="table table-bordered table-condensed table-hover  table-striped">
					<thead>
						<tr>
							<td align="center">序号</td>
							<td align="center">设备名称</td>
							<td align="center">在用</td>
							<td align="center">备用</td>
							<td align="center">送检</td>
							<td align="center">待修</td>
							<td align="center">送修</td>
							<td align="center">合计(不含报废)</td>
							<td align="center">报废</td>
							<td align="center">合计</td>
						</tr>
						</thead>
							<c:forEach items="${statisticsList}" var="it" varStatus="status">
							<c:choose>  
								<c:when test="${it.equipmentName eq '合计'}">	<tr class="success"></c:when>  
								<c:otherwise><tr></c:otherwise>  
							</c:choose>  
									<td align="center">${status.index  + 1}</td>
									<td align="center">${it.equipmentName}</td>
									<td align="center">${it.used}</td>
									<td align="center">${it.notUsed} </td>
									<td align="center" class="${it.test > 0?'warning':''}">${it.test}</td>
									<td align="center">${it.borken} </td>
									<td align="center" class="${it.repairing > 0?'danger':''}">${it.repairing}</td>
									<td align="center">${it.total - it.scrap}</td>
									<td align="center">${it.scrap}</td>
									<td align="center">${it.total}</td>
							</c:forEach>
						<tfoot>
						<tr>
							<td align="center">序号</td>
							<td align="center">设备名称</td>
							<td align="center">在用</td>
							<td align="center">备用</td>
							<td align="center">送检</td>
							<td align="center">待修</td>
							<td align="center">送修</td>
							<td align="center">合计(不含报废)</td>
							<td align="center">报废</td>
							<td align="center">合计</td>
						</tr>
						</tfoot>
					</table>
				</c:if>
			</div>
		</div>
</body>
</html>