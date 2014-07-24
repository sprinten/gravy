<div class="row">
    <div class="col-md-9 col-sm-9 col-md-offset-3 col-sm-offset-3">
        <!-- Main menu in one row (e.g., controller entry points -->
        <g:if test="${!layout_nomainmenu}">
            <g:render template="/_menu/menubar"/>
        </g:if>
    </div>
</div>

<div class="row">
    <!-- Sidebar -->
    <div class="col-md-3 col-sm-3">
        <div class="container-fluid">
            <g:render template="/_menu/sidebarFisa"/>
        </div>
    </div>
    <!-- End Sidebar-->

    <div class="col-md-7 col-sm-7">
        <div class="container-fluid">
            <!-- Secondary menu in one row (e.g., actions for current controller) -->
            <g:if test="${!layout_nosecondarymenu}">
                <g:render template="/_menu/submenubar"/>
            </g:if>

        <!-- print system messages (infos, warnings, etc) - not validation errors -->
            <g:if test="${flash.message && !layout_noflashmessage}">
                <div class="alert alert-info">${flash.message}</div>
            </g:if>

        <!-- Show page's content -->
            <g:layoutBody/>
            <g:pageProperty name="page.body"/>

        </div>
    </div>

</div>
