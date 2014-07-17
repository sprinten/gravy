<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-2">
                <h4>Product</h4>
                <ul class="unstyled">
                    <li>
                        <i class="glyphicon glyphicon-home"></i>
                        <a href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
                    </li>
                    <li>
                        <i class="glyphicon glyphicon-eye-open"></i>
                        <a href="${createLink(uri: '/')}"><g:message code="default.tour.label"/></a>
                    </li>
                </ul>
            </div>

            <div class="col-lg-2">
                <h4>Company</h4>
                <ul class="unstyled">
                    <li>
                        <i class="glyphicon glyphicon-info-sign"></i>
                        <a href="${createLink(uri: '/about')}">
                            <g:message code="default.about.label"/>
                        </a>
                    </li>
                    <li>
                        <i class="glyphicon glyphicon-envelope"></i>
                        <a href="${createLink(uri: '/contact')}">
                            <g:message code="default.contact.label"/>
                        </a>
                    </li>
                </ul>
            </div>

            <div class="col-lg-2">
                <h4>Technical</h4>
                <ul class="unstyled">
                    <li>
                        <i class="glyphicon glyphicon-envelope"></i>
                        <a href="${createLink(uri: '/system')}">
                            <g:message code="default.system.label"/>
                        </a>
                    </li>
                </ul>
            </div>

        </div>

        <p class="pull-right"><a href="#">Back to top</a></p>
    </div>
</footer>
