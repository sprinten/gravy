package rnp.fisa.afectiune

import org.bson.types.ObjectId

class Boala {

    static mapWith = "mongo"

    static constraints = {
        nume blank: true, nullable: true
        severitate blank: true, nullable: true, inList: ["Usoara", "Cronica"]
    }

    ObjectId id
    String nume
    String severitate

    String toString() {
        return nume + " " + severitate
    }

    Boolean isEmpty() {
        return !nume && !severitate
    }
}
