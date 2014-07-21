package grady

import grady.cascade.Parent
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsDomainClass

/**
 * Generic Controller for Cascade Selects
 */
@Transactional(readOnly = true)
class ToggleController {

    static scaffold = false

    static allowedMethods = []

    def load() {

        GrailsDomainClass clazz = grailsApplication.getArtefactByLogicalPropertyName("Domain", params.name)

        def bean = clazz?.referenceInstance()?.get(params.id)


        boolean enabled = params.value

        if (!enabled) {
            return
        }

        def name = enabled ? grailsApplication.getArtefact("Domain", children[0].class.name).logicalPropertyName : "undefined"

        def selected = enabled && params.selected ? params.selected : ""

        render(template: "/_fields/toggle/child", model: [bean: bean, property: property, value: value])
    }
}
