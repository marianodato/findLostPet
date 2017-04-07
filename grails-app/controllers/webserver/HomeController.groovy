package webserver

class HomeController {

    def sessionService

    def index(){
        def user_id = sessionService.getUserId(session.token)
        log.info("User_id: " + user_id)

        if (!user_id){
            redirect(controller: "login", action: "index")
            return
        }

        render (view:"/home/index")
        return
    }

    def logout(){
        session.invalidate()
        redirect(controller: "login", action: "index")
        return
    }

}
