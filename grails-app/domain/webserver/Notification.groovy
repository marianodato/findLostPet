package webserver

class Notification {

    static belongsTo = [user: User, pet: Pet]
    Date dateCreated
    boolean isSeenByUser

    static mapping = {
        version false
        autoTimestamp false
    }

    static constraints = {
        dateCreated blank:false, nullable: false
        isSeenByUser blank:false, nullable: false
    }
}
