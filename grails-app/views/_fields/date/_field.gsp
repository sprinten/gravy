<%@ page import="java.lang.reflect.Type; java.lang.reflect.ParameterizedType; cascade.Parent" defaultCodec="html" %>
<div class="form-group ${invalid ? 'error' : ''}">

    <label class="control-label col-md-3" for="${property}">${label}</label>

    <div class="col-md-8">

        <bs:customDatePicker name="${property}" id="${property}" value="${value}" precision="${constraints.attributes.precision}" years="${constraints.attributes.years}" class="form-control"/>

        <g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span></g:if>
    </div>

    <div class="col-md-1">

    </div>

</div>

