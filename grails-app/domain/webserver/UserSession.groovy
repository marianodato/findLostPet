package webserver

class UserSession {

    Long user_id
    String session_token

    static mapping = {
        version false
        autoTimestamp false
        user_id index: 'user_id_idx'
        session_token index: 'session_token_idx'
    }

    static constraints = {
        user_id blank:false, nullable: false, unique: true
        session_token blank:false, nullable: false, size: 128..128, unique: true
    }

    def toMap(){
        return ["id": this.id, "user_id": this.user_id, "session_token": this.session_token]
    }
}
