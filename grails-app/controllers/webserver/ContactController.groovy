package webserver

class ContactController {

    def sessionService

    def index(){

        def user = sessionService.getUser(session.token)

        if (!user) {
            redirect(controller: "login", action: "index")
            return
        }

        log.info("User_id: " + user.id)

        def model = [:]
        model.username = user.username

        render (view:"/contact/index", model:model)
        return
    }
}
