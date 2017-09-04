package webserver

class PetController {

    def sessionService
    def petService

    def index() {

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

        def resp = petService.getUserPets(user, params.page)

        log.info("Resp: " + resp)

        def model = [:]
        model.username = user.username
        model.pets = resp.pets
        model.page = resp.page
        model.pages = resp.pages

        render (view:"/pet/index", model:model)
        return
    }

    def finishSearch() {

        def user = sessionService.getUser(session.token)

        if (!user) {
            redirect(controller: "login", action: "index")
            return
        }

        log.info("User_id: " + user.id)
        log.info("Params: " + params)

        petService.updatePetStatus(params.petId, user)

        redirect(controller: "pet", action: "index")
        return
    }


}
