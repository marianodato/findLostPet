package webserver

class PetSize {

    String description
    Date dateCreated
    static hasMany = [pets: Pet]

    static mapping = {
        version false
        autoTimestamp false
    }

    static constraints = {
        description blank:false, nullable: false
        dateCreated blank:false, nullable: false
    }
}
