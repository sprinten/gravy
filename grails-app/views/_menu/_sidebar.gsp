<%@ page import="org.codehaus.groovy.grails.commons.GrailsDomainClass; rnp.Fisa" %>
<ul class="nav nav-pills nav-stacked">

    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName }}">
        <g:if test="${"cascade" != c.logicalPropertyName && "JQueryRemoteValidator" != c.logicalPropertyName }">
            <li class="controller${params.controller == c.logicalPropertyName ? " active" : ""}">
                <g:link controller="${c.logicalPropertyName}" >
                    <g:message code="${c.logicalPropertyName}.label" default="${c.logicalPropertyName.capitalize()}"/>
                </g:link>
            </li>
        </g:if>
    </g:each>
</ul>

