package webserver

class SessionService {

    static transactional = false
    def utilsService

    def generateSessionId(Long user_id) {

        def resp = [:]
        def user = User.findById(user_id)

        log.info("User: " + user)

        user.sessionToken = PasswordHash.createRandomSaltString()

        log.info("Session_token: " + user.sessionToken)

        if (!utilsService.saveInstance(user)){
            user.discard()
            user.errors.each {
                log.error("Error: Error saving to UserSession table: " + it + " .UserSession: " + user)
            }
            resp.message = "Oops! Something went wrong..."
            resp.status = 500
            return resp
        }

        log.info("Session created!")
        resp.status = 201
        resp.session_token = user.sessionToken

        return resp
    }

    def getUser(def sessionToken){

        log.info("Session_token: " + sessionToken)

        if (!sessionToken)
            return null

        def user = User.findBySessionToken(sessionToken)

        if (!user)
            return null

        return user
    }
}
