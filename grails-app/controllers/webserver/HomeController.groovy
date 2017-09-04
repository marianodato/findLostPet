package webserver

class HomeController {

    def sessionService

    def index(){

        def user = sessionService.getUser(session.token)
        def model = [:]

        if (user){
            log.info("User_id: " + user.id)
            redirect(controller: "pet", action: "index")
            return
        }

        render (view:"/home/index", model:model)
        return
    }
}
