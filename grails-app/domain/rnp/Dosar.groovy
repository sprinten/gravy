package rnp

import org.bson.types.ObjectId

class Dosar {

    static mapWith = "mongo"

    static constraints = {
        numar blank: false, nullable: false, unique: true
    }

    static belongsTo = [pacient: Pacient]

    static hasMany = [fise: Fisa]

    ObjectId id
    Integer numar

    Pacient pacient
    List<Fisa> fise = [].withLazyDefault { new Fisa() }

    Integer zileSpitalizare

    String toString() {
        return numar
    }
}
