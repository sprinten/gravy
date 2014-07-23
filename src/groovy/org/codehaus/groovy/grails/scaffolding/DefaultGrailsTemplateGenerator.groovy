/*
 * Copyright 2004-2013 SpringSource.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.codehaus.groovy.grails.scaffolding

import org.codehaus.groovy.grails.commons.GrailsDomainClass
import org.codehaus.groovy.grails.commons.GrailsDomainClassProperty
import org.codehaus.groovy.grails.validation.ConstrainedProperty

/**
 * Default implementation of the generator that generates grails artifacts (controllers, views etc.)
 * from the domain model.
 *
 * @author Graeme Rocher
 */
class DefaultGrailsTemplateGenerator extends AbstractGrailsTemplateGenerator {

    DefaultGrailsTemplateGenerator(ClassLoader classLoader) {
        super(classLoader)
    }

    def renderEditor = { GrailsDomainClass domainClass, GrailsDomainClassProperty property, ConstrainedProperty constrainedProperty, String propertyFormName, String propertyFormValue, String propertyConstraints ->

        if (!renderEditorTemplate) {
            // create template once for performance
            renderEditorTemplate = engine.createTemplate(getTemplateText('renderEditor.template'))
        }

        def binding = [
                pluginManager      : pluginManager,
                property           : property,
                domainClass        : domainClass,
                propertyFormName   : propertyFormName,
                propertyFormValue  : propertyFormValue,
                propertyConstraints: propertyConstraints,
                cp                 : constrainedProperty,
                domainInstance     : getPropertyName(domainClass)]
        return renderEditorTemplate.make(binding).toString()
    }
}
