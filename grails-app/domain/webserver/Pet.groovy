package webserver

class Pet {

    String nickname
    String gender
    String description
    Date dateCreated
    Date lastUpdated
    byte[] image
    static belongsTo = [user: User, petColor: PetColor, petType: PetType, petSize: PetSize, petRace: PetRace]
    static hasMany = [notifications: Notification]
    String latitude
    String longitude
    String status

    static mapping = {
        version false
        autoTimestamp false
        status index:'status_id'
    }

    static constraints = {
        nickname blank:false, nullable: true
        gender blank:false, nullable: false
        description blank:false, nullable: true
        dateCreated blank:false, nullable: false
        lastUpdated blank:false, nullable: false
        image blank:false, nullable: true
        latitude blank:false, nullable: false
        longitude blank:false, nullable: false
        status blank:false, nullable: false
    }
}
