package webserver

class RegistrationController {

    def registrationService
    def sessionService

    def index() {

        def user = sessionService.getUser(session.token)

        if (user){
            log.info("User_id: " + user.id)
            redirect(controller: "home", action: "index")
            return
        }

        render (view:"/registration/index")
        return
    }

    def registration(){
        def user = sessionService.getUser(session.token)
        def resp = [:]

        if (user){
            log.info("User_id: " + user.id)
            redirect(controller: "home", action: "index")
            return
        }

        log.info("Params: " + params)

        resp = registrationService.doRegister(params.username, params.password, params.email, params.name, params.phone_number, params.gender)

        if (resp.status == 201) {
            redirect(controller: "login", action: "index")
            return
        }

        render (view:"/registration/index", model:[message:resp.message])
        return

    }
}
