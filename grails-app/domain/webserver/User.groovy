package webserver

class User {

    String username
    String password
    String name
    String gender
    String email
    String phoneNumber
    Date dateCreated
    boolean isAdmin
    String sessionToken
    static hasMany = [pets: Pet, notifications: Notification]

    static mapping = {
        version false
        autoTimestamp false
    }

    static constraints = {
        username blank:false, nullable: false, size: 6..20, unique: true, matches: '(?=^.{6,20}$)^[a-zA-Z][a-zA-Z0-9]*[._-]?[a-zA-Z0-9]+$'
        password blank:false, nullable: false, size: 264..264, matches: '(?=^.{264}$)^[0-9]*[:]?[a-fA-F0-9]*[:]?[a-fA-F0-9]+$'
        email blank:false, nullable: false, unique: true
        phoneNumber blank:false, nullable: false
        name blank:false, nullable: false
        gender blank:false, nullable: false
        dateCreated blank:false, nullable: false
        isAdmin blank:false, nullable: false
        sessionToken blank:false, nullable: true, size: 128..128, unique: true
    }
}