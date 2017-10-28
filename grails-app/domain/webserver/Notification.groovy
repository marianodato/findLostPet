package webserver

class Notification {

    static belongsTo = [user: User, pet: Pet]
    Date dateCreated
    Date lastUpdated
    Long notSeenByUser

    static mapping = {
        version false
        autoTimestamp false
    }

    static constraints = {
        dateCreated blank:false, nullable: false
        lastUpdated blank:false, nullable: false
        notSeenByUser blank:false, nullable: true
    }
}
