<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>practice.jsp</title>
</head>
<body>

<h1>hr 계정 employees 테이블 가져오기</h1>
<hr>

<%-- 지시자 directive --%>
<%@
	page import="java.util.List, ex03.EmployeeDTO, ex03.PracticeDAO"
%>

<%-- 선언부 declaration --%>
<%!
	private PracticeDAO dao = new PracticeDAO();
%>

<%-- 스크립틀릿 scriptlet --%>
<%
	List<EmployeeDTO> list = dao.getEmployeeList();
%>

<table>
	<thead>
		<tr>
			<th>	EMPLOYEE_ID	</th>
			<th>	FIRST_NAME	</th>
			<th>	LAST_NAME	</th>
			<th>	EMAIL	</th>
			<th>	PHONE_NUMBER	</th>
			<th>	HIRE_DATE	</th>
			<th>	JOB_ID	</th>
			<th>	SALARY	</th>
			<th>	COMMISSION_PCT	</th>
			<th>	MANAGER_ID	</th>
			<th>	DEPARTMENT_ID	</th>
		</tr>
	</thead>
	<tbody>
		<% for(EmployeeDTO dto : list) { %>
		<tr>
			<td><%=dto.getEmployee_id() %></td>
			<td><%=dto.getFirst_name() %></td>
			<td><%=dto.getLast_name() %></td>
			<td><%=dto.getEmail() %></td>
			<td><%=dto.getPhone_number() %></td>
			<td><%=dto.getHire_date() %></td>
			<td><%=dto.getJob_id() %></td>
			<td><%=dto.getSalary() %></td>
			<td><%=dto.getCommission_pct() %></td>
			<td><%=dto.getManager_id() %></td>
			<td><%=dto.getDepartment_id() %></td>
		</tr>
		<% }%>
	</tbody>
</table>





</body>
</html>