
<%@ page import="rnp.Pacient" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'pacient.label', default: 'Pacient')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<div class="formy well">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="cnp" title="${message(code: 'pacient.cnp.label', default: 'Cnp')}" />
			
				<g:sortableColumn property="nume" title="${message(code: 'pacient.nume.label', default: 'Nume')}" />
			
				<g:sortableColumn property="prenume" title="${message(code: 'pacient.prenume.label', default: 'Prenume')}" />
			
				<g:sortableColumn property="varsta" title="${message(code: 'pacient.varsta.label', default: 'Varsta')}" />
			
				<g:sortableColumn property="sex" title="${message(code: 'pacient.sex.label', default: 'Sex')}" />
			
				<g:sortableColumn property="inaltime" title="${message(code: 'pacient.inaltime.label', default: 'Inaltime')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${pacientInstanceList}" status="i" var="pacientInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${pacientInstance.id}">${fieldValue(bean: pacientInstance, field: "cnp")}</g:link></td>
			
				<td>${fieldValue(bean: pacientInstance, field: "nume")}</td>
			
				<td>${fieldValue(bean: pacientInstance, field: "prenume")}</td>
			
				<td>${fieldValue(bean: pacientInstance, field: "varsta")}</td>
			
				<td>${fieldValue(bean: pacientInstance, field: "sex")}</td>
			
				<td>${fieldValue(bean: pacientInstance, field: "inaltime")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${pacientInstanceCount}" />
	</div>
</div>

</body>

</html>
