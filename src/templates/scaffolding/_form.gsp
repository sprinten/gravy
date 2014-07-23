<%=packageName%>
<%
    import grails.persistence.Event
    import grady.annotations.Toggle
    import org.codehaus.groovy.grails.commons.GrailsDomainClassProperty
    import org.codehaus.groovy.grails.commons.GrailsDomainClass
%>


<%
    def domainSuffix = "Instance"
    excludedProps = Event.allEvents.toList() << 'id' << 'version' << 'dateCreated' << 'lastUpdated'

    // Param Render Template
    beanFormName = domainClass?.logicalPropertyName

    // Param Render Template
    domainInstanceFormName = beanFormName + domainSuffix

    // Param Render Template
    domainInstanceFormValue = "\${${domainInstanceFormName}}"

    hasHibernate = pluginManager?.hasGrailsPlugin('hibernate') || pluginManager?.hasGrailsPlugin('hibernate4')

    def persistentPropNames = domainClass.persistentProperties*.name

    def properties = domainClass.properties.findAll {
        persistentPropNames.contains(it.name) && !excludedProps.contains(it.name) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true)
    }
%>

<%
    Collections.sort(properties, comparator.constructors[0].newInstance([domainClass] as Object[]))
    for (fieldProperty in properties) {
        renderFieldProperty(domainClass, fieldProperty, "")
    }
%>


<%
    private def renderFieldProperty(parentPropertyClass, property, prefixForForm = "") {

        boolean propertyEmbedded = property.embedded
        def parentPropertyName = parentPropertyClass.logicalPropertyName
        // Param Render Template
        def propertyName = property.name

        // Param Render Template
        def propertyNaturalName = property.naturalName

        boolean required = false
        if (hasHibernate) {
            // Param Render Template
            constrainedProperty = parentPropertyClass.constrainedProperties[propertyName]
            required = (constrainedProperty ? !(constrainedProperty.propertyType in [boolean, Boolean]) && !constrainedProperty.nullable && (constrainedProperty.propertyType != String || !constrainedProperty.blank) : false)
        }

        if (!propertyEmbedded) {

            // Param Render Template
            def prefixForValue = prefixForForm.replace(".", "?.")

            // Param Render Template
            propertyFormName = prefixForForm + propertyName

            // Param Render Template
            propertyFormValue = "\${${domainInstanceFormName + "?." + prefixForValue + propertyName}}"

            propertyConstraints = "grailsApplication.getArtefactByLogicalPropertyName(\"Domain\",\""+ parentPropertyName + "\").constrainedProperties"

            // Param Render Template
            // constraintsFormValue = parentPropertyClass?.referenceInstance.constraints

            // Param Render Template
            annotations = parentPropertyClass?.clazz.getDeclaredField(propertyName)?.annotations
%>

<div class="form-group \${hasErrors(bean: ${beanFormName}, field: '${propertyFormName}', 'error')} ${
        required ? 'required' : ''}">
    <label for="${propertyFormName}" class="control-label col-md-3">
        <g:message code="${propertyFormName}.label" default="${propertyNaturalName}"/>
    </label>

    <div class="col-md-8">
        ${renderEditor(domainClass, property, constrainedProperty, propertyFormName, propertyFormValue, propertyConstraints)}
        <span class="help-inline">\${hasErrors(bean: ${beanFormName}, field: '${propertyFormName}', 'error')}</span>
    </div>

    <div class="col-md-1">
        <% if (required) { %><i class="glyphicon glyphicon-asterisk text-danger text-left"></i><% } %>
    </div>
</div>

<%
        toggleChild = parentPropertyClass?.clazz.getDeclaredField(propertyName)?.getAnnotation(Toggle.class)?.value()
        if (toggleChild) {
%>

<g:javascript library="jquery"/>
<g:javascript>

        if (<%=propertyFormValue%>) {
            \$("#${toggleChild}Toggle").removeClass('hide');
        } else {
            \$("#${toggleChild}Toggle").addClass('hide');
        }

        function toggle(flag) {
            if (flag) {
                \$("#${toggleChild}Toggle").removeClass('hide');
            } else {
               \$("#${toggleChild}Toggle").addClass('hide');
            }
        }

</g:javascript>

<%
        }
    } else {
%>

<div id="${propertyName}Toggle">
    <fieldset class="embedded">
        <legend>
            <g:message code="${property.name}.label" default="${propertyNaturalName}"/>
        </legend>

        <%
                parentPropertyClass = property.component

                def persistentPropNames = parentPropertyClass.persistentProperties*.name

                def properties = parentPropertyClass.properties.findAll {
                    persistentPropNames.contains(it.name) && !excludedProps.contains(it.name) && (parentPropertyClass.constrainedProperties[it.name] ? parentPropertyClass.constrainedProperties[it.name].display : true)
                }

                Collections.sort(properties, comparator.constructors[0].newInstance([parentPropertyClass] as Object[]))
                for (childProperty in properties) {

                    renderFieldProperty(parentPropertyClass, childProperty, prefixForForm + propertyName + ".")
                }
        %>

    </fieldset>
</div>
<%
        }
    }
%>