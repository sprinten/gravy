package rnp.fisa

import org.bson.types.ObjectId

class Dosar {

    static mapWith = "mongo"

    static constraints = {
        numar blank: false, nullable: false, unique: true
    }

    ObjectId id

    Integer numar

    Integer zileSpitalizare

    String toString() {
        return numar
    }
}
