package rnp

import grady.annotations.Embedded
import grady.annotations.Toggle
import org.bson.types.ObjectId

class Fisa {

    static mapWith = "mongo"

    static constraints = {

        numar nullable: false, unique: true
        dataCompletare attributes: ["precision": "day", "years": 2016..1970]

        status inList: ["Initiat", "Aprobat"]

        tip inList: ["Initiere", "Monitorizare"]

        hasBoala nullable: false

        boala nullable: true, validator: { val, obj ->
            if (obj.hasBoala) {

                if (val.isEmpty()) {
                    return ['not.empty']
                }
            } else {
                if (!val.isEmpty()) {
                    return ['empty']
                }
            }
        }
    }

    static embedded = ['boala']

    static belongsTo = [dosar: Dosar]

    ObjectId id
    Integer numar

    Dosar dosar

    @Toggle("boala")
    Boolean hasBoala

    @Embedded
    Boala boala

    Boolean retroactiv

    Date dataCompletare

    String status
    String tip

    String toString() {
        return numar
    }
}
