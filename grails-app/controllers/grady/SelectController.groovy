package grady

import cascade.Parent
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsDomainClass

/**
 * Generic Controller for Cascade Selects
 */
@Transactional(readOnly = true)
class SelectController {

    static scaffold = false

    static allowedMethods = []

    def children() {

        println("params.name="+params.name)
        println("params.id="+params.id)

        GrailsDomainClass clazz = grailsApplication.getArtefactByLogicalPropertyName("Domain", params.name)


        println(clazz)

        Parent parentInstance = clazz?.newInstance()?.get(params.id)

        def children = parentInstance?.children

        boolean enabled = children && children.size() > 0

        println(enabled)

        def name = enabled ?  grailsApplication.getArtefact("Domain", children[0].class.name).logicalPropertyName : "undefined"

        def selected = enabled && params.selected ? enabled && params.selected : ""

        render(template: "/_fields/child/field", model: [name: name, children: children, disabled: !enabled], selected: selected)
    }
}
