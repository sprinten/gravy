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

    def children() {

        GrailsDomainClass clazz = grailsApplication.getArtefactByLogicalPropertyName("Domain", params.name)

        Parent parentInstance = clazz?.newInstance()?.get(params.id)

        def children = parentInstance?.children

        boolean enabled = children && children.size() > 0

        def name = enabled ? grailsApplication.getArtefact("Domain", children[0].class.name).logicalPropertyName : "undefined"

        def selected = enabled && params.selected ? params.selected : ""

        render(template: "/_fields/child/template", model: [name: name, children: children, disabled: !enabled, selected: selected])
    }
}
