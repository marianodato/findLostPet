package webserver

class ImageController {

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

        def pet = petService.getPet(params.id)

        log.info("Pet: " + pet)

        response.contentLength = pet.image.length
        response.contentType = pet.imageContentType
        response.outputStream << pet.image

    }
}
