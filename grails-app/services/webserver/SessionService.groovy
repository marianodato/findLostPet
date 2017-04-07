package webserver

class SessionService {

    static transactional = false

    def generateSessionId(Long user_id) {

        def resp = [:]
        def userSession = UserSession.findByUser_id(user_id)

        log.info("UserSession: " + userSession)

        if (!userSession)
            userSession = new UserSession (user_id:user_id)

        userSession.session_token = PasswordHash.createRandomSaltString()

        log.info("Session_token: " + userSession.session_token)

        if (!saveInstance(userSession)){
            userSession.discard()
            userSession.errors.each {
                log.error("Error: Error saving to UserSession table: " + it + " .UserSession: " + userSession)
            }
            resp.message = "Oops! Something went wrong..."
            resp.status = 500
            return resp
        }

        log.info("Session created!")
        resp.status = 201
        resp.session_token = userSession.session_token

        return resp
    }

    def getUserId(def session_token){

        log.info("Session_token: " + session_token)

        if (!session_token)
            return null

        def userSession = UserSession.findBySession_token(session_token)

        if (!userSession)
            return null

        return userSession.user_id
    }

    def saveInstance(def instance){
        return instance.save(flush: true)
    }

}
