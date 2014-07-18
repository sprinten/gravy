package grady

import grady.cascade.Child

/**
 * City
 */
class City extends Child<State> {

    static mapWith = "mongo"

    static belongsTo = [parent: State]

    static mapping = {
    }

    static constraints = {
        parent blank: false, nullable: false//, children: true
    }
}
