package webserver

import grails.transaction.Transactional

@Transactional
class SessionService {

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
                log.error("Error saving to UserSession table: " + it + " .UserSession: " + user)
            }
            throw new RuntimeException("Error saving to UserSession table.UserSession: " + user )
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
