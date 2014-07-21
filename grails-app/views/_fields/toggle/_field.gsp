<%@ page import="grady.annotations.Toggle; org.codehaus.groovy.grails.validation.Constraint; org.codehaus.groovy.grails.validation.ConstrainedProperty; java.lang.reflect.Type; java.lang.reflect.ParameterizedType;" defaultCodec="html" %>

<%
    ConstrainedProperty constrainedProperty = (ConstrainedProperty) bean?.domainClass?.getConstrainedProperties().get(property);

    boolean hasCascade = constrainedProperty?.hasAppliedConstraint("cascade")
%>

<div class="form-group ${invalid ? 'has-error' : 'has-success'}">

    <label class="control-label col-md-3" for="${property}">${label}</label>

    <%
        def annotations = bean?.domainClass?.clazz.getDeclaredField(property)?.annotations
        def annotation = bean?.domainClass?.clazz.getDeclaredField(property)?.getAnnotation(Toggle.class)
        def childElement = annotation?.value() ? annotation?.value() : ""
    %>

    <div class="col-md-8">

        <bs:checkBox bean="${bean}" name="${property}" value="${value}" toggle="true"/>

        <g:if test="${invalid}"><span class="help-block">${errors.join('<br>')}</span></g:if>
    </div>


    <g:javascript library="jquery"/>
    <g:javascript>

        if (${value != null ? value.toString() : false}) {
            $("#${childElement}Toggle").removeClass('hide');
        } else {
            $("#${childElement}Toggle").addClass('hide');
        }

        function toggle(flag) {
            if (flag) {
                $("#${childElement}Toggle").removeClass('hide');
            } else {
                $("#${childElement}Toggle").addClass('hide');
            }
        }



    %{--$(document).ready(function() {--}%

    %{--$("#${property.toString()}").change(function() {--}%
    %{--if (this.value) {--}%
    %{--$("#${childElement}Toggle").removeClass('hide');--}%
    %{--} else {--}%
    %{--$("#${childElement}Toggle").addClass('hide');--}%
    %{--}--}%
    %{--});--}%
    %{--});--}%

    </g:javascript>


    <div class="col-md-1">
    </div>
</div>
