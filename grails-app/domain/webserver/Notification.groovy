package webserver

class Notification {

    static belongsTo = [user: User, pet: Pet]
    Date dateCreated
    String status

    static mapping = {
        version false
        autoTimestamp false
        status index:'status_id'
    }

    static constraints = {
        dateCreated blank:false, nullable: false
        status blank:false, nullable: false
    }
}
