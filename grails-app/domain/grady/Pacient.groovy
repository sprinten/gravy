package grady

class Pacient {

    enum Sex {
        M, F
    }


    static constraints = {

        cnp size: 13..13, matches: "[0-9]+", blank: false, nullable: false, unique: true

        nume size: 2..15, matches: "[a-zA-Z]+", blank: false, nullable: false
        prenume size: 2..15, matches: "[a-zA-Z]+", blank: false, nullable: false

        dataNastere max: new Date(), format: "yyyy-MM-dd"

        varsta max: 150
        sex blank: false

        inaltime max: 3D
        greutate min:3, max: 250, widget: "textField"

        mail email: true, blank: true, nullable: true
        telefon blank: true, nullable: true, matches: "^(\\(?\\+?[0-9]*\\)?)?[0-9_\\- \\(\\)]*\$"
        adresa blank: true, nullable: true, widget: "textarea"
    }


    String id
    String nume
    String prenume
    String cnp
    Date dataNastere
    String telefon
    String adresa
    Integer varsta
    Sex sex
    String mail;
    Double inaltime
    Integer greutate
    Boolean fumator

}
