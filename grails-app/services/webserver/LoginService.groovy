package webserver

class LoginService {

    static transactional = false
    def sessionService

    def doLogin(String username, String password){

        def resp = [:]

        def user = User.findByUsername(username)
        resp.message = "Invalid username or password!"
        resp.status = 400

        log.info("User: " + user)

        if (!user){
            log.error("Invalid username!")
            return resp
        }

        if (PasswordHash.validatePassword(password,user.password)) {

            resp = sessionService.generateSessionId(user.id)

            if (resp.status == 500)
                return resp

            log.info("Login successful!")
            resp.message = "Login successful!"
            resp.status = 201
            return resp
        }

        log.error("Invalid password!")

        return resp
    }

    def doRegister(String username, String password){

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

        if (!username.matches('(?=^.{6,20}$)^[a-zA-Z][a-zA-Z0-9]*[._-]?[a-zA-Z0-9]+$')){
            log.error("Insecure username!")
            resp.message = "Insecure username!"
            resp.status = 400
            return resp
        }

        // Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character
        if (!password.matches('^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!#%*?&])[A-Za-z\\d$@$!#%*?&]{8,}')){
            log.error("Insecure password!")
            resp.message = "Insecure password!"
            resp.status = 400
            return resp
        }

        def hash = PasswordHash.createHash(password)
        user = new User (username: username, password:hash)

        if (!saveInstance(user)){
            user.discard()
            user.errors.each {
                log.error("Error: Error saving to User table: " + it + " .User: " + user)
            }
            resp.message = "Oops! Something went wrong..."
            resp.status = 500
            return resp
        }

        log.info("Sign up successful!")
        resp.message = "Sign up successful!"
        resp.status = 201

        return resp
    }

    def saveInstance(def instance){
        return instance.save(flush: true)
    }

}
