package rnp

import grady.City
import grady.State
import org.bson.types.ObjectId


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

        varsta min:0, max: 120
        sex blank: false

        inaltime min: 0.1F, max: 2.8F, scale: 2
        greutate min: 3, max: 250

        mail email: true, blank: true, nullable: true
        telefon blank: true, nullable: true, matches: "^(\\(?\\+?[0-9]*\\)?)?[0-9_\\- \\(\\)]*\$"
        adresa blank: true, nullable: true, widget: "textarea"

        state blank: true, nullable: true //, children: true

        city blank: true, nullable: true //, cascade: [parent: "state"]
    }

    static hasMany = [dosare: Dosar]

    ObjectId id
    String nume
    String prenume
    String cnp

    Date dataNastere

    List<Dosar> dosare = [].withLazyDefault { new Dosar() }

    String telefon
    String adresa
    Integer varsta
    Sex sex
    String mail;
    Float inaltime
    Integer greutate
    Boolean fumator

    State state
    City city

    String toString() {
        return cnp
    }
}
