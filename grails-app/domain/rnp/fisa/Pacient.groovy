package rnp.fisa

import grady.City
import grady.State
import org.bson.types.ObjectId
import rnp.fisa.pacient.Address


class Pacient {

    enum Sex {
        M, F
    }

    static mapWith = "mongo"

    static constraints = {

        cnp size: 13..13, matches: "[0-9]+", blank: false, nullable: false, unique: true

        nume size: 2..15, matches: "[a-zA-Z]+", blank: false, nullable: false
        prenume size: 2..15, matches: "[a-zA-Z]+", blank: false, nullable: false

        dataNastere max: new Date(), format: "yyyy-MM-dd", attributes: ["precision": "day", "years": 2016..1970]

        varsta min: 0, max: 120
        sex blank: false

        inaltime min: 0.1F, max: 2.8F, scale: 2
        greutate min: 3, max: 250

        fumator nullable: true

        state blank: true, nullable: true, cascade: [child: "city"]
        city blank: true, nullable: true
        address nullable: true
        acasa nullable: true
    }

    static embedded = ['address', 'acasa']

    ObjectId id
    String nume
    String prenume
    String cnp

    Date dataNastere

    State state
    City city

    Address address

    Address acasa

    Integer varsta
    Sex sex

    Float inaltime
    Integer greutate
    Boolean fumator

    String toString() {
        return cnp
    }
}
