package webserver

class User {

    String username
    String password

    static mapping = {
        version false
        autoTimestamp false
        username index:'username_idx'
    }

    /* Username REGEX
    - Only one special char (._-) allowed and it must not be at the extremas of the string
    - The first character cannot be a number
    - All the other characters allowed are letters and numbers
    - The total length should be between 6 and 20 chars
    */

    static constraints = {
        username blank:false, nullable: false, size: 6..20, unique: true, matches: '(?=^.{6,20}$)^[a-zA-Z][a-zA-Z0-9]*[._-]?[a-zA-Z0-9]+$'
        password blank:false, nullable: false, size: 264..264, matches: '(?=^.{264}$)^[0-9]*[:]?[a-fA-F0-9]*[:]?[a-fA-F0-9]+$'
    }

    def toMap(){
        return ["id": this.id, "username": this.username, "password": this.password]
    }
}