package webserver

import org.codehaus.groovy.grails.web.context.ServletContextHolder

class PostController {

    def sessionService
    def postService
    def notificationService

    def index(){

        def user = sessionService.getUser(session.token)

        if (!user) {
            redirect(controller: "login", action: "index")
            return
        }

        log.info("User_id: " + user.id)

        def petColors = PetColor.list()
        log.info("petColors: " + petColors)
        def petSizes = PetSize.list()
        log.info("petSizes: " + petSizes)
        def petTypes = PetType.list()
        log.info("petTypes: " + petTypes)
        def petRaces = PetRace.list()
        log.info("petRaces: " + petRaces)

        def model = [:]
        model.username = user.username
        model.petColors = petColors
        model.petSizes = petSizes
        model.petTypes = petTypes
        model.petRaces = petRaces
        model.pending = notificationService.needToNotify(user)

        render (view:"/post/index", model:model)
        return
    }

    def post(){

        def user = sessionService.getUser(session.token)
        def resp = [:]

        if (!user) {
            redirect(controller: "login", action: "index")
            return
        }

        log.info("User_id: " + user.id)
        log.info("Params: " + params)

        if (params.image){
            def random = PasswordHash.createRandomSaltString()
            new FileOutputStream(ServletContextHolder.servletContext.getRealPath('/') + random) << params.image.getInputStream()
            File file = new File(ServletContextHolder.servletContext.getRealPath('/') + random)
            if (file.bytes) {
                params.imageContentType = params.image.contentType
                params.image = file.bytes
            }else {
                params.imageContentType = null
                params.image = null
            }
            file.delete()
        }

        resp = postService.createPost(user, params)

        if (resp.status == 201) {
            redirect(controller: "pet", action: "index")
            return
        }

        render (view:"/post/index", model:[message:resp.message, username: user.username])
        return
    }
}
