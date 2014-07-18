import grady.cascade.Parent

class ChildrenConstraint {

    static defaultMessageCode = "cascade.children.undefined"

    def supports = { type ->
        return type!= null && Parent.class.isAssignableFrom(type);
    }

    def validate = { val ->
        return val.children != null
    }

}
