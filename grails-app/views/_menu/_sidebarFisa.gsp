<%@ page import="org.codehaus.groovy.grails.commons.GrailsDomainClass; rnp.Fisa" %>
<%
    def domainClass = grailsApplication.getArtefactByLogicalPropertyName("Domain", "fisa")

    def domainClassProperties = domainClass.properties.findAll { property ->
        return grailsApplication.getArtefactType(property.type)?.type == "Domain"
    }

%>
<ul class="nav nav-pills nav-stacked">
    <g:each var="property" in="${domainClassProperties}">
        <li class="controller${params.model == property.name ? " active" : ""}">
            <g:link controller="fisa" action="navigate"
                    params="['current': currentModel, 'next': property.name, 'mode': 'create']">
                <g:message code="${property.name}.label" default="${property.naturalName}"/>
            </g:link>
        </li>
    </g:each>
</ul>