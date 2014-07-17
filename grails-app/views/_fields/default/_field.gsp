<%@ page defaultCodec="html" %>
<div class="form-group ${invalid ? 'has-error' : 'has-success'}">

    <label class="control-label col-md-3" for="${property}">${label}</label>


    <div class="col-md-8">

        <div class="controls">
            <f:input bean="${bean}" property="${property}" class="form-control"/>
            <g:if test="${invalid}"><span class="help-block">${errors.join('<br>')}</span></g:if>
        </div>
    </div>

    <div class="col-md-1">

    </div>

</div>

