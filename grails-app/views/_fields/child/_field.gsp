<%@ page import="java.lang.reflect.Type; java.lang.reflect.ParameterizedType; cascade.Parent" defaultCodec="html" %>
<div class="form-group ${invalid ? 'error' : ''}">

    <label class="control-label col-md-3" for="${property}">${label}</label>


    <!-- TODO: Add from to select tag and filter list by parent id so that we can handle return to edit page after errors-->
    <div id="${property}Select">
    <div class="col-md-8">


            <g:select class="form-control" id="${name}" name="${name}.id" value="${selected}" from="${children}" optionValue="name" optionKey="id"  disabled="${disabled}" noSelection="['':'Choose...']"/>


        <g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span></g:if>
    </div>

    <div class="col-md-1">

    </div>
    </div>
</div>

