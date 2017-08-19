package webserver

class RegistrationService {

    static transactional = false
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

        /* Username REGEX
            - Only one special char (._-) allowed and it must not be at the extremas of the string
            - The first character cannot be a number
            - All the other characters allowed are letters and numbers
            - The total length should be between 6 and 20 chars
        */

        if (!username.matches('(?=^.{6,20}$)^[a-zA-Z][a-zA-Z0-9]*[._-]?[a-zA-Z0-9]+$')){
            log.error("Insecure username!")
            resp.message = "Insecure username!"
            resp.status = 400
            return resp
        }

        // Password REGEX
        // Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character
        if (!password.matches('^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!#%*?&])[A-Za-z\\d$@$!#%*?&]{8,}')){
            log.error("Insecure password!")
            resp.message = "Insecure password!"
            resp.status = 400
            return resp
        }

        def hash = PasswordHash.createHash(password)

        user = new User (username: username, password: hash, email: email, name: name, phoneNumber: phone_number, gender: gender, isAdmin:false, sessionToken: null)
        user.dateCreated = new Date()

        if (!utilsService.saveInstance(user)){
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
}
