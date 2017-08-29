package webserver

import grails.transaction.Transactional

@Transactional
class RegistrationService {

    def utilsService

    def doRegister(String username, String password, String email, String name, String phone_number, String gender){

        def user = User.findByUsername(username)
        def resp = [:]

        log.info("User: " + user)

        if (user){
            log.error("Username already registered!")
            resp.message = "Username already registered!"
            resp.status = 400
            return resp
        }

        if (username == password){
            log.error("Username cannot be the same as password!")
            resp.message = "Username cannot be the same as password!"
            resp.status = 400
            return resp
        }

        def hash = PasswordHash.createHash(password)

        user = new User (username: username, password: hash, email: email, name: name, phoneNumber: phone_number, gender: gender, isAdmin:false, sessionToken: null)
        user.dateCreated = new Date()

        if (!utilsService.saveInstance(user)){
            user.discard()
            user.errors.each {
                log.error("Error saving to User table: " + it + " .User: " + user)
            }
            throw new RuntimeException("Error saving to User table.User: " + user)
        }

        log.info("Sign up successful!")
        resp.message = "Sign up successful!"
        resp.status = 201

        return resp
    }
}
