<%@ page import="org.codehaus.groovy.grails.validation.Constraint; org.codehaus.groovy.grails.validation.ConstrainedProperty; java.lang.reflect.Type; java.lang.reflect.ParameterizedType;" defaultCodec="html" %>

<%
    ConstrainedProperty constrainedProperty = (ConstrainedProperty) bean?.domainClass?.getConstrainedProperties().get(property);

    boolean hasCascade = constrainedProperty?.hasAppliedConstraint("cascade")
%>
<div class="form-group ${invalid ? 'has-error' : 'has-success'}">

    <label class="control-label col-md-3" for="${property}">${label}</label>

    <g:if test="${hasCascade}">
        <%
            Constraint constraint = constrainedProperty?.getAppliedConstraint("cascade")

            def childElement = constraint?.parameter["child"]

            String selected = bean?."${childElement}"?.id
            String id = bean?."${property}"?.id
        %>



        <div class="col-md-8">
            <f:input bean="${bean}" property="${property}" value="${value}" noSelection="['': 'Choose...']"
                     class="form-control"
                     onchange="updateChild(this.value, this.id)"/>

            <g:if test="${invalid}"><span class="help-block">${errors.join('<br>')}</span></g:if>
        </div>


        <script>
            <g:remoteFunction controller="cascade" action="load" update="${childElement}Select" params="'id=${id?.toString()}&name=${property?.toString()}&selected=${selected}'"/>

            function updateChild(id, name) {
                <g:remoteFunction controller="cascade" action="load" update="${childElement}Select" params="'id='+id+'&name='+name"/>
            }

        </script>

    </g:if>

    <g:if test="${!hasCascade}">

        <div class="col-md-8">

            <g:select class="form-control" id="${property.name}" name="${name}.id" from="${property.type.name.list()}"
                      optionKey="id" required="" value="${"${domainInstance}?.${property.name}"?.id}"
                      noSelection="['': 'Choose...']"/>

            <g:if test="${invalid}"><span class="help-block">${errors.join('<br>')}</span></g:if>
        </div>

    </g:if>

    <div class="col-md-1">
    </div>
</div>