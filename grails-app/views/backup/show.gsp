
<%@ page import="rnp.Pacient" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'pacient.label', default: 'Pacient')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<div class="formy well">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pacient.cnp.label" default="Cnp" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: pacientInstance, field: "cnp")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pacient.nume.label" default="Nume" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: pacientInstance, field: "nume")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pacient.prenume.label" default="Prenume" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: pacientInstance, field: "prenume")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pacient.varsta.label" default="Varsta" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: pacientInstance, field: "varsta")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pacient.sex.label" default="Sex" /></td>
				
				<td valign="top" class="value">${pacientInstance?.sex?.encodeAsHTML()}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pacient.inaltime.label" default="Inaltime" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: pacientInstance, field: "inaltime")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pacient.greutate.label" default="Greutate" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: pacientInstance, field: "greutate")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pacient.mail.label" default="Mail" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: pacientInstance, field: "mail")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pacient.telefon.label" default="Telefon" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: pacientInstance, field: "telefon")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pacient.adresa.label" default="Adresa" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: pacientInstance, field: "adresa")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pacient.state.label" default="State" /></td>
				
				<td valign="top" class="value"><g:link controller="state" action="show" id="${pacientInstance?.state?.id}">${pacientInstance?.state?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pacient.city.label" default="City" /></td>
				
				<td valign="top" class="value"><g:link controller="city" action="show" id="${pacientInstance?.city?.id}">${pacientInstance?.city?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pacient.fumator.label" default="Fumator" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${pacientInstance?.fumator}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</div>

</body>

</html>
