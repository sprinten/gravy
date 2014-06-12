package grady

import org.bson.types.ObjectId

class Dosar {

    static mapWith = "mongo"

    static constraints = {
    }

    ObjectId id
    Integer numarZileConcediuMedicalUltimile6Luni
    Integer zileSpitalizare
    Integer viziteReumatologie
    Integer viziteMedicFamilie

}
