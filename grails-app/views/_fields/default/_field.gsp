<%@ page defaultCodec="html" %>
<div class="form-group ${invalid ? 'error' : ''}">

    <label class="control-label col-md-3" for="${property}">${label}</label>


    <div class="col-md-8">

        <div class="controls">
            <f:input bean="${bean}" property="${property}" class="form-control"/>
            <g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span></g:if>
        </div>
    </div>

    <div class="col-md-1">

    </div>

</div>

