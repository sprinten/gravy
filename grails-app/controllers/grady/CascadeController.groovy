package grady

import grady.cascade.Parent
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsDomainClass

/**
 * Generic Controller for Cascade Selects
 */
@Transactional(readOnly = true)
class CascadeController {

    static scaffold = false

    static allowedMethods = []

    def load() {

        // Retrieve the Domain Class of the Parent Select based on param[name]
        GrailsDomainClass clazz = grailsApplication.getArtefactByLogicalPropertyName("Domain", params.name)

        // Retrieve the Parent Select Value based on param[id]
        Parent parentInstance = clazz?.referenceInstance?.get(params.id)

        // Retrieve the Parent Select child list
        def children = parentInstance?.children

        // Child Select is enabled only if child list is not empty
        boolean enabled = children && children.size() > 0

        // Determine Child Property Name. We do not have the bean class so we have to rely on reflection
        def name = enabled ? grailsApplication.getArtefact("Domain", children[0].class.name).logicalPropertyName : "undefined"

        def selected = enabled && params.selected ? params.selected : ""

        render(template: "/_fields/child/template", model: [name: name, children: children, disabled: !enabled, selected: selected])
    }
}
