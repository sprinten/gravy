<%@ page import="java.lang.reflect.ParameterizedType; rnp.Pacient" %>



			<div class="form-group ${hasErrors(bean: pacientInstance, field: 'cnp', 'error')} required">
				<label for="cnp" class="control-label col-md-3">

                    <g:message code="pacient.cnp.label" default="Cnp" />

                </label>

				<div class="col-md-8">

					<g:textField class="form-control" name="cnp" maxlength="13" pattern="${pacientInstance.constraints.cnp.matches}" required="" value="${pacientInstance?.cnp}"/>
					<span class="help-inline">${hasErrors(bean: pacientInstance, field: 'cnp', 'error')}</span>
				</div>

                <div class="col-md-1">
                    <i class="glyphicon glyphicon-asterisk text-danger text-left"></i>
                </div>
			</div>

			<div class="form-group ${hasErrors(bean: pacientInstance, field: 'nume', 'error')} required">
				<label for="nume" class="control-label col-md-3">

                    <g:message code="pacient.nume.label" default="Nume" />

                </label>

				<div class="col-md-8">

					<g:textField class="form-control" name="nume" maxlength="15" pattern="${pacientInstance.constraints.nume.matches}" required="" value="${pacientInstance?.nume}"/>
					<span class="help-inline">${hasErrors(bean: pacientInstance, field: 'nume', 'error')}</span>
				</div>

                <div class="col-md-1">
                    <i class="glyphicon glyphicon-asterisk text-danger text-left"></i>
                </div>
			</div>

			<div class="form-group ${hasErrors(bean: pacientInstance, field: 'prenume', 'error')} required">
				<label for="prenume" class="control-label col-md-3">

                    <g:message code="pacient.prenume.label" default="Prenume" />

                </label>

				<div class="col-md-8">

					<g:textField class="form-control" name="prenume" maxlength="15" pattern="${pacientInstance.constraints.prenume.matches}" required="" value="${pacientInstance?.prenume}"/>
					<span class="help-inline">${hasErrors(bean: pacientInstance, field: 'prenume', 'error')}</span>
				</div>

                <div class="col-md-1">
                    <i class="glyphicon glyphicon-asterisk text-danger text-left"></i>
                </div>
			</div>

			<div class="form-group ${hasErrors(bean: pacientInstance, field: 'varsta', 'error')} required">
				<label for="varsta" class="control-label col-md-3">

                    <g:message code="pacient.varsta.label" default="Varsta" />

                </label>

				<div class="col-md-8">

					<g:field class="form-control" name="varsta" type="number" max="150" value="${pacientInstance.varsta}" required=""/>
					<span class="help-inline">${hasErrors(bean: pacientInstance, field: 'varsta', 'error')}</span>
				</div>

                <div class="col-md-1">
                    <i class="glyphicon glyphicon-asterisk text-danger text-left"></i>
                </div>
			</div>

			<div class="form-group ${hasErrors(bean: pacientInstance, field: 'sex', 'error')} required">
				<label for="sex" class="control-label col-md-3">

                    <g:message code="pacient.sex.label" default="Sex" />

                </label>

				<div class="col-md-8">

					<g:select class="form-control" name="sex" from="${rnp.Pacient$Sex?.values()}" keys="${rnp.Pacient$Sex.values()*.name()}" required="" value="${pacientInstance?.sex?.name()}"/>
					<span class="help-inline">${hasErrors(bean: pacientInstance, field: 'sex', 'error')}</span>
				</div>

                <div class="col-md-1">
                    <i class="glyphicon glyphicon-asterisk text-danger text-left"></i>
                </div>
			</div>

			<div class="form-group ${hasErrors(bean: pacientInstance, field: 'inaltime', 'error')} required">
				<label for="inaltime" class="control-label col-md-3">

                    <g:message code="pacient.inaltime.label" default="Inaltime" />

                </label>

				<div class="col-md-8">

					<g:field class="form-control" name="inaltime" value="${fieldValue(bean: pacientInstance, field: 'inaltime')}" required=""/>
					<span class="help-inline">${hasErrors(bean: pacientInstance, field: 'inaltime', 'error')}</span>
				</div>

                <div class="col-md-1">
                    <i class="glyphicon glyphicon-asterisk text-danger text-left"></i>
                </div>
			</div>

			<div class="form-group ${hasErrors(bean: pacientInstance, field: 'greutate', 'error')} required">
				<label for="greutate" class="control-label col-md-3">

                    <g:message code="pacient.greutate.label" default="Greutate" />

                </label>

				<div class="col-md-8">

					<g:field class="form-control" name="greutate" type="number" min="3" max="250" value="${pacientInstance.greutate}" required=""/>
					<span class="help-inline">${hasErrors(bean: pacientInstance, field: 'greutate', 'error')}</span>
				</div>

                <div class="col-md-1">
                    <i class="glyphicon glyphicon-asterisk text-danger text-left"></i>
                </div>
			</div>

			<div class="form-group ${hasErrors(bean: pacientInstance, field: 'mail', 'error')} ">
				<label for="mail" class="control-label col-md-3">

                    <g:message code="pacient.mail.label" default="Mail" />

                </label>

				<div class="col-md-8">

					<g:field class="form-control" type="email" name="mail" value="${pacientInstance?.mail}"/>
					<span class="help-inline">${hasErrors(bean: pacientInstance, field: 'mail', 'error')}</span>
				</div>

                <div class="col-md-1">
                    
                </div>
			</div>

			<div class="form-group ${hasErrors(bean: pacientInstance, field: 'telefon', 'error')} ">
				<label for="telefon" class="control-label col-md-3">

                    <g:message code="pacient.telefon.label" default="Telefon" />

                </label>

				<div class="col-md-8">

					<g:textField class="form-control" name="telefon" pattern="${pacientInstance.constraints.telefon.matches}" value="${pacientInstance?.telefon}"/>
					<span class="help-inline">${hasErrors(bean: pacientInstance, field: 'telefon', 'error')}</span>
				</div>

                <div class="col-md-1">
                    
                </div>
			</div>

			<div class="form-group ${hasErrors(bean: pacientInstance, field: 'adresa', 'error')} ">
				<label for="adresa" class="control-label col-md-3">

                    <g:message code="pacient.adresa.label" default="Adresa" />

                </label>

				<div class="col-md-8">

					<g:textArea class="form-control" name="adresa" cols="40" rows="5" value="${pacientInstance?.adresa}"/>
					<span class="help-inline">${hasErrors(bean: pacientInstance, field: 'adresa', 'error')}</span>
				</div>

                <div class="col-md-1">
                    
                </div>
			</div>

			<div class="form-group ${hasErrors(bean: pacientInstance, field: 'state', 'error')} ">
				<label for="state" class="control-label col-md-3">

                    <g:message code="pacient.state.label" default="State" />

                </label>

				<div class="col-md-8">
                    <%
                        String childElement = pacientInstance?.class.getDeclaredField("state").type.getDeclaredField("child").get(String.class)
                    %>

					<g:select class="form-control" id="state.id" name="state" from="${grady.State.list()}" optionKey="id" optionValue="name" value="${pacientInstance?.state?.id}" noSelection="['':'Choose...']"
                              onchange="${remoteFunction (
                                      controller: 'select',
                                      action: 'children',
                                      params:'\'id=\' + escape(this.value)+\'&name=\' + this.name',
                                      update: "${childElement}Select"
                              )}"
                    />
					<span class="help-inline">${hasErrors(bean: pacientInstance, field: 'state', 'error')}</span>
				</div>

                <div class="col-md-1">
                    
                </div>
			</div>


			<div class="form-group ${hasErrors(bean: pacientInstance, field: 'city', 'error')} ">
				<label for="city" class="control-label col-md-3">

                    <g:message code="pacient.city.label" default="City" />

                </label>

				<div class="col-md-8">

                    <div id="citySelect">

                        <g:select class="form-control" id="city.id" name="city" from="${pacientInstance?.state?.children}" optionKey="id" optionValue="name" value="${pacientInstance?.city?.id}" noSelection="['':'Choose...']"/>

                    </div>

                    <span class="help-inline">${hasErrors(bean: pacientInstance, field: 'city', 'error')}</span>
				</div>



                <div class="col-md-1">
                    
                </div>
			</div>

			<div class="form-group ${hasErrors(bean: pacientInstance, field: 'fumator', 'error')} ">
				<label for="fumator" class="control-label col-md-3">

                    <g:message code="pacient.fumator.label" default="Fumator" />

                </label>

				<div class="col-md-8">

					<bs:checkBox name="fumator" value="${pacientInstance?.fumator}" />
					<span class="help-inline">${hasErrors(bean: pacientInstance, field: 'fumator', 'error')}</span>
				</div>

                <div class="col-md-1">
                    
                </div>
			</div>

