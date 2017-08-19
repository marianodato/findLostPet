package webserver

class BlogsController {

    def sessionService

    def index(){

        def user_id = sessionService.getUserId(session.token)
        log.info("User_id: " + user_id)
        def model = [:]

        if (!user_id)
            model.logged = false
        else
            model.logged = true

        render (view:"/blogs/index",model:model)
        return
    }
}
