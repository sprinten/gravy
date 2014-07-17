<%@ page import="java.lang.reflect.Type; java.lang.reflect.ParameterizedType; cascade.Parent" defaultCodec="html" %>
<div class="form-group ${invalid ? 'has-error' : 'has-success'}">

    <label class="control-label col-md-3" for="${property}">${label}</label>

    <%
        String childElement = bean?.class?.getDeclaredField(property)?.type?.getDeclaredField("child")?.get(String.class)
        String selected = bean?."${childElement}"?.id
        String id = bean?."${property}"?.id
    %>

    <div class="col-md-8">

    <f:input bean="${bean}" property="${property}" value="${value}" noSelection="['': 'Choose...']" class="form-control"
             onchange="updateChild(this.value, this.id)"/>

    <g:if test="${invalid}"><span class="help-block">${errors.join('<br>')}</span></g:if>
</div>


<script>

    <g:remoteFunction controller="select" action="children" update="${childElement}Select" params="'id=${id?.toString()}&name=${property?.toString()}&selected=${selected}'"/>

    function updateChild(id, name) {
        <g:remoteFunction controller="select" action="children" update="${childElement}Select" params="'id='+id+'&name='+name"/>
    }

</script>

<div class="col-md-1">
</div>

</div>

