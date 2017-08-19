package webserver

class PhotosController {

    def sessionService

    def index(){

        def user_id = sessionService.getUserId(session.token)
        log.info("User_id: " + user_id)
        def model = [:]

        if (!user_id)
            model.logged = false
        else
            model.logged = true

        render (view:"/photos/index",model:model)
        return
    }
}
