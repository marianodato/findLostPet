package webserver

class ActivityController {

    def sessionService
    def notificationService

    def index(){

        def user = sessionService.getUser(session.token)

        if (!user) {
            redirect(controller: "login", action: "index")
            return
        }

        log.info("User_id: " + user.id)
        log.info("Params: " + params)

        if (!params.page || (params.page as Integer) <= 0){
            params.page = 1
        }else{
            params.page = params.page as Integer
        }

        notificationService.seeNotifications(user)

        def resp = notificationService.getUserNotifications(user, params.page)

        log.info("Resp: " + resp)

        def model = [:]
        model.username = user.username
        model.user = user
        model.notifications = resp.notifications
        model.page = resp.page
        model.pages = resp.pages

        render (view:"/activity/index", model:model)
        return
    }
}
