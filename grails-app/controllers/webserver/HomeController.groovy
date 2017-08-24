package webserver

class HomeController {

    def sessionService

    def index(){

        def user = sessionService.getUser(session.token)
        def model = [:]

        if (!user) {
            model.logged = false
        } else {
            log.info("User_id: " + user.id)
            model.logged = true
            model.username = user.username
        }

        render (view:"/home/index", model:model)
        return
    }
}
