<nav class="navbar navbar-fixed-top navbar-default" role="navigation">
	<div class="container">
	
	    <div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
        		<span class="sr-only">Toggle navigation</span>
        		<span class="icon-bar"></span>
	           	<span class="icon-bar"></span>
	           	<span class="icon-bar"></span>
			</button>
	
			<a class="navbar-brand" href="${createLink(uri: '/')}">
				<img class="logo" src="${resource(plugin: 'kickstart', dir:'images', file:'brand_logo.png')}" alt="${meta(name:'app.name')}" width="16px" height="16px"/> 
				<!-- ${meta(name:'app.name')} -->
				RNP AP
			</a>
		</div>

		<div class="collapse navbar-collapse navbar-ex1-collapse" role="navigation">

		<ul class="nav navbar-nav">
            <g:render template="/_menu/info"/>
		</ul>

    	<ul class="nav navbar-nav navbar-right">


            <!-- NOTE: the renderDialog for the "Register" modal dialog MUST be placed outside the NavBar (at least for Bootstrap 2.1.1): see bottom of main.gsp -->

            <g:render template="/_menu/search"/>
            <g:render template="/_menu/language"/>
            <g:render template="/_menu/user"/>
	    </ul>			

		</div>
	</div>
</nav>
