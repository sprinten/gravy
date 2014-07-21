package rnp

import grady.fields.embedded.Embed
import org.bson.types.ObjectId

class Boala extends Embed {

    static mapWith = "mongo"

    static constraints = {
        nume blank: true, nullable: true
        severitate blank: true, nullable: true, inList: ["Usoara", "Cronica"]
    }

    String nume
    String severitate

    String toString() {
        return nume
    }

    Boolean isEmpty() {
        return !nume && !severitate
    }
}
