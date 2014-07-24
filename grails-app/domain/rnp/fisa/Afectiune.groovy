package rnp.fisa

import grady.annotations.Toggle
import org.bson.types.ObjectId
import rnp.fisa.afectiune.Boala

class Afectiune {

    static mapWith = "mongo"

    static constraints = {

        numar nullable: false, unique: true
        dataCompletare attributes: ["precision": "day", "years": 2016..1970]

        status inList: ["Initiat", "Aprobat"]

        tip inList: ["Initiere", "Monitorizare"]

        retroactiv nullable: true

        hasBoala nullable: false

        boala nullable: true, validator: { val, obj ->
            if (obj.hasBoala) {

                if (val?.isEmpty()) {
                    return ['not.empty']
                }
            } else {
                if (!val?.isEmpty()) {
                    return ['empty']
                }
            }
        }
    }

    static embedded = ['boala']

    ObjectId id
    Integer numar

    @Toggle("boala")
    Boolean hasBoala

    Boala boala

    Boolean retroactiv

    Date dataCompletare

    String status
    String tip

    String toString() {
        return numar
    }
}
