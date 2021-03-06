package webserver

class LoginService {

    static transactional = false
    def sessionService

    def doLogin(String username, String password){

        def resp = [:]

        def user = User.findByUsername(username)
        resp.message = "Usuario o contraseña inválido!"
        resp.status = 400

        log.info("User: " + user)

        if (!user){
            log.error("Invalid username!")
            return resp
        }

        if (PasswordHash.validatePassword(password,user.password)) {

            resp = sessionService.generateSessionId(user.id)

            log.info("Log in successful!")
            resp.message = "Log in exitoso!"
            resp.status = 201
            return resp
        }

        log.error("Invalid password!")

        return resp
    }
}
