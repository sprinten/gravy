<%@ page defaultCodec="html" %>

<g:select class="form-control" id="${name}" name="${name}.id" value="${selected}" from="${children}"
          optionValue="name" optionKey="id" disabled="${disabled}" noSelection="['': 'Choose...']"/>



