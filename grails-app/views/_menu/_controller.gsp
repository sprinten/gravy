<ul class="nav nav-pills nav-stacked" style="max-width: 300px;">
    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
        <li class="controller${params.controller == c.logicalPropertyName ? " active" : ""}">
            <g:link controller="${c.logicalPropertyName}">
                <g:if test="${c.fullName.contains('HomeController')}">
                </g:if>
                <g:elseif test="${c.fullName.contains('DemoPageController')}">
                </g:elseif>
                <g:elseif test="${c.fullName.contains('DbdocController')}">
                </g:elseif>
                <g:message code="${c.logicalPropertyName}.label" default="${c.logicalPropertyName.capitalize()}"/>
            </g:link>
        </li>
    </g:each>
</ul>

