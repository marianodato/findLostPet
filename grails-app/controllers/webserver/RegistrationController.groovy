package webserver

class RegistrationController {

    def registrationService
    def sessionService

    def index() {

        def user_id = sessionService.getUserId(session.token)
        log.info("User_id: " + user_id)

        if (user_id){
            redirect(controller: "home", action: "index")
            return
        }

        render (view:"/registration/index")
        return
    }

    def registration(){
        def user_id = sessionService.getUserId(session.token)
        log.info("User_id: " + user_id)
        def resp = [:]

        if (user_id){
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
