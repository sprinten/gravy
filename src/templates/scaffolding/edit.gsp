<%=packageName%>
<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>

<div class="formy well">

    <g:hasErrors bean="\${${propertyName}}">
        <div class="alert alert-danger">
            <g:renderErrors bean="\${${propertyName}}" as="list"/>
        </div>
    </g:hasErrors>

    <% //<g:render template="/layouts/errors"/>  %>

    <legend><g:message code="default.edit.label" args="[entityName]"/></legend>

    <g:form method="post" class="form-horizontal form-group-sm"
            role="form" <%=multiPart ? ' enctype="multipart/form-data"' : '' %>>
    <g:hiddenField name="id" value="\${${propertyName}?.id}"/>
    <g:hiddenField name="version" value="\${${propertyName}?.version}"/>
    <g:hiddenField name="_method" value="PUT"/>

    <g:render template="form"/>

    <div class="form-actions margin-top-medium">
        <g:actionSubmit class="btn btn-primary" action="update"
                        value="\${message(code: 'default.button.update.label', default: 'Update')}"/>
        <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset"/></button>
    </div>
    </g:form>

</div>

<% //<jqvalui:renderValidationScript for="${domainClass.fullName}"/>  %>

</body>

</html>
