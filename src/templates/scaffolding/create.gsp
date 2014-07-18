<%=packageName%>
<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div class="formy well">

    <g:hasErrors bean="\${${propertyName}}">
        <div class="alert alert-danger">
            <g:renderErrors bean="\${${propertyName}}" as="list"/>
        </div>
    </g:hasErrors>

    <% //<g:render template="/layouts/errors"/> %>

    <h4 class="title"><g:message code="default.edit.label" args="[entityName]"/></h4>

    <g:form action="save" class="form-horizontal form-group-sm" role="form" <%=multiPart ? ' enctype="multipart/form-data"' : '' %>>

    <f:all bean="${propertyName}"/>

    <div class="form-actions margin-top-medium">
        <g:submitButton name="create" class="btn btn-primary"
                        value="\${message(code: 'default.button.create.label', default: 'Create')}"/>
        <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset"/></button>
    </div>
    </g:form>
</div>


<% //<jqvalui:renderValidationScript for="${domainClass.fullName}"/> %>

</body>

</html>
