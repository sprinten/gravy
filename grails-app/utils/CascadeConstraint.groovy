import grady.cascade.Child
import grady.cascade.Parent

class CascadeConstraint {

    static expectsParams = ['child']

    static defaultMessageCode = "cascade.parent.missing"

    def supports = { type ->
        return type && Parent.class.isAssignableFrom(type);
    }

    def validate = { value, target ->

        def property = params.child

        def childObj = target."${property}"

        return Child.class.isAssignableFrom(childObj?.class);
    }

}
