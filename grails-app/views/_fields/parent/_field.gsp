<%@ page import="java.lang.reflect.Type; java.lang.reflect.ParameterizedType; cascade.Parent" defaultCodec="html" %>
<div class="form-group ${invalid ? 'error' : ''}">

    <label class="control-label col-md-3" for="${property}">${label}</label>


    <div class="col-md-8">
        <%
            String childElement = pacientInstance?.class?.getDeclaredField("state")?.type?.getDeclaredField("child")?.get(String.class)
        %>

            <f:input bean="${bean}" property="${property}" value="${value}"  noSelection="['':'Choose...']" class="form-control" onchange="${remoteFunction(
                    controller: 'select',
                    action: 'children',
                    params: '\'id=\' + escape(this.value)+\'&name=\' + this.id',
                    update: "${childElement}Select"
            )}"/>

            <g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span></g:if>
    </div>

    <div class="col-md-1">

    </div>

</div>

