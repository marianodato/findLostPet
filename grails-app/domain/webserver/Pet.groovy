package webserver

class Pet {

    String nickname
    String gender
    String description
    Date dateCreated
    Date lastUpdated
    byte[] image
    String imageContentType
    static belongsTo = [user: User, petColor: PetColor, petType: PetType, petSize: PetSize, petRace: PetRace]
    static hasMany = [notifications: Notification]
    BigDecimal latitude
    BigDecimal longitude
    String status

    static mapping = {
        version false
        autoTimestamp false
        status index:'status_id'
        image sqlType: 'longblob'
    }

    static constraints = {
        nickname blank:false, nullable: false
        gender blank:false, nullable: false, matches: '^male$|^female$'
        description blank:false, nullable: false
        dateCreated blank:false, nullable: false
        lastUpdated blank:false, nullable: false
        image blank:false, nullable: true
        latitude scale: 16, nullable: false
        longitude scale: 16, nullable: false
        status blank:false, nullable: false, matches: '^lost$|^found$'
        imageContentType blank:false, nullable: true
    }
}
