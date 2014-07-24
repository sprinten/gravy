package rnp

import org.bson.types.ObjectId
import rnp.fisa.Afectiune
import rnp.fisa.Dosar
import rnp.fisa.Pacient

/**
 * Fisa
 * A domain class describes the data object and it's mapping to the database
 */
class Fisa {


    static mapWith = "mongo"

    static constraints = {

        numar nullable: false, unique: true

        afectiune nullable: true

        dosar nullable: true

        dosar pacient: true

    }

    ObjectId id
    Integer numar

    Afectiune afectiune

    Dosar dosar

    Pacient pacient


    @Override
    public String toString() {
        return "Fisa{" +
                "id=" + id +
                ", numar=" + numar +
                ", afectiune=" + afectiune +
                ", dosar=" + dosar +
                ", pacient=" + pacient +
                ", version=" + version +
                '}';
    }
}
