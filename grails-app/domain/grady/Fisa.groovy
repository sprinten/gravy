package grady

import org.bson.types.ObjectId

class Fisa {

    static mapWith = "mongo"

    static constraints = {
    }

    ObjectId id
    Pacient pacient
    //Dosar dosar

    String tip
    Boolean retroactiv

    Date dataCompletare
    Date dataAprobare
    Date dataFinalizare
    Date dataConsimtamant
    Date dataConsultatiei

    String status

    String medicRetroactiv
    String medicSpecialistInitiere
    String specialitateMedic
    String completatDe

    Boolean consimtamantPacient
}
