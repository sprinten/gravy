package grady

import grady.cascade.Parent

/**
 * State
 */
class State extends Parent<City> {

    static mapWith = "mongo"

    static hasMany = [children: City]

    static mapping = {
    }

    static constraints = {
    }
}
