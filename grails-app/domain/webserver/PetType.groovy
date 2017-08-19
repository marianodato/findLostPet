package webserver

class PetType {

    String description
    Date dateCreated
    static hasMany = [petRaces: PetRace, pets: Pet]

    static mapping = {
        version false
        autoTimestamp false
    }

    static constraints = {
        description blank:false, nullable: false
        dateCreated blank:false, nullable: false
    }
}
