import cascade.Child
import cascade.Parent

class CascadeConstraint {

    static expectsParams = ['parent']

    static defaultMessageCode = "cascade.parent.missing"

    def supports = { type ->
        return type!= null && Child.class.isAssignableFrom(type);
    }

    def validate = { value, target ->

        def parentProperty = params.parent

        Parent parentObj = target.getProperty(parentProperty);

        if (parentObj == null)
            return ['cascade.parent.missing']
        else if (!(value in parentObj.children))
            return ['cascade.parent.invalid']
        return true
    }

}
