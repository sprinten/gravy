<%@ page import="org.codehaus.groovy.grails.commons.GrailsDomainClass; org.codehaus.groovy.grails.commons.GrailsDomainClassProperty" defaultCodec="html" %>


<!-- TODO: Make recursive -->
<!-- TODO: Control property order and rendering -->

<%
    GrailsDomainClass nestedClass = grailsApplication.getArtefactByLogicalPropertyName("Domain", property)
    def properties = nestedClass?.getPersistentProperties()
    boolean isEmbedded = bean?.domainClass.getPropertyByName(property).isEmbedded()
%>



<g:if test="${isEmbedded}">
    <div id="${property}Toggle">
    <legend>${label}</legend>
    <g:each in="${properties}" var="prop">

        <%
            def propertyName = prop.name
            GrailsDomainClass subNestedClass = grailsApplication.getArtefactByLogicalPropertyName("Domain", propertyName)
            def subProperties = subNestedClass?.getPersistentProperties()

            isEmbedded = bean?.domainClass.getPropertyByName("${property}.${propertyName}").isEmbedded()
        %>

        <g:if test="${!isEmbedded}">
            <f:field bean="${bean}" property="${property}.${propertyName}" class="form-control"/>
        </g:if>
        <g:if test="${isEmbedded}">
            <g:each in="${subProperties}" var="subProp">
                <f:field bean="${bean}" property="${property}.${propertyName}.${subProp.name}"
                         class="form-control"/>
            </g:each>
        </g:if>
    </g:each>
    </div>
</g:if>

