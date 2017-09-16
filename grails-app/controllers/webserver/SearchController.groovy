package webserver

class SearchController {

    def sessionService
    def petService

    def index(){

        def user = sessionService.getUser(session.token)

        if (!user) {
            redirect(controller: "login", action: "index")
            return
        }

        log.info("User_id: " + user.id)
        log.info("Params: " + params)

        def pets = petService.getNotFinishedPets()

        def model = [:]
        model.username = user.username
        model.user = user
        model.pets = pets

        render (view:"/search/index", model:model)
        return
    }
}
