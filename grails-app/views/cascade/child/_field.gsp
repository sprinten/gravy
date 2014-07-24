<%@ page defaultCodec="html" %>

<div class="form-group ${invalid ? 'has-error' : 'has-success'}">

    <label class="control-label col-md-3" for="${name}">${label}</label>

    <div class="col-md-8">
        <div id="${property}Select">
            <g:select class="form-control" id="${name}" name="${name}.id" value="${selected}" from="${children}"
                      optionValue="name" optionKey="id" disabled="${disabled}" noSelection="['': 'Choose...']"/>

        </div>
        <g:if test="${invalid}"><span class="help-block">${errors.join('<br>')}</span></g:if>
    </div>

    <div class="col-md-1">

    </div>
</div>


