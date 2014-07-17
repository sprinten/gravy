<li class="dropdown">
	<a class="dropdown-toggle" data-toggle="dropdown" href="#">
		<g:message code="default.info.label"/> <b class="caret"></b>
	</a>
	
	<ul class="dropdown-menu">
		<%-- Note: Links to pages without controller are redirected in conf/UrlMappings.groovy --%>
		<li class="">
			<a href="${createLink(uri: '/about')}">
				<g:message code="default.about.label"/>
			</a>
		</li>
		<li class="">
			<a href="${createLink(uri: '/terms')}">
				<g:message code="default.terms.label"/>
			</a>
		</li>
		<li class="">
			<a href="${createLink(uri: '/contact')}">
				<g:message code="default.contact.label"/>
			</a>
		</li>
        <li class="">
            <a href="${createLink(uri: '/system')}">
                <g:message code="default.info.label"/>
            </a>
        </li>
    </ul>
</li>
