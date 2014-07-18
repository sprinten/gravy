package rnp

import org.bson.types.ObjectId

class Fisa {

    static mapWith = "mongo"

    static constraints = {

        numar blank: false, nullable: false, unique: true
        dataCompletare attributes: ["precision": "day", "years": 2016..1970]

        status inList: ["Initiat", "Aprobat"]

        tip inList: ["Initiere", "Monitorizare"]
    }

    static belongsTo = [dosar: Dosar]

    ObjectId id
    Integer numar

    Dosar dosar

//    Toggle hasBoala
//    Boala boala

    Boolean retroactiv

    Date dataCompletare

    String status
    String tip

    String toString() {
        return numar
    }
}
