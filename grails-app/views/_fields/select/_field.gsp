<%@ page defaultCodec="html" %>
<div class="form-group ${invalid ? 'has-error' : 'has-success'}">

    <label class="control-label col-md-3" for="${property}">${label}</label>

    <div class="col-md-8">

        <g:select class="form-control" id="${property.name}" name="${name}.id" from="${property.type.name.list()}"
                  optionKey="id" required="" value="${"${domainInstance}?.${property.name}"?.id}"
                  noSelection="['': 'Choose...']"/>

        <g:if test="${invalid}"><span class="help-block">${errors.join('<br>')}</span></g:if>
    </div>

    <div class="col-md-1">

    </div>
</div>



