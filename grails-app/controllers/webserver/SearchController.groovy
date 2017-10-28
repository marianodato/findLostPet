package webserver

class SearchController {

    def sessionService
    def petService
    def notificationService

    def index(){

        def user = sessionService.getUser(session.token)

        if (!user) {
            redirect(controller: "login", action: "index")
            return
        }

        log.info("User_id: " + user.id)
        log.info("Params: " + params)

        def pets = petService.getNotFinishedPets()
        def notifications = notificationService.getUserConnections(user)

        def model = [:]
        model.username = user.username
        model.notifications = notifications
        model.user = user
        model.pets = pets
        model.pending = notificationService.needToNotify(user)

        render (view:"/search/index", model:model)
        return
    }

    def contact() {

        def user = sessionService.getUser(session.token)

        if (!user) {
            redirect(controller: "login", action: "index")
            return
        }

        log.info("User_id: " + user.id)
        log.info("Params: " + params)

        def pet = petService.getPet(params.petId)

        log.info("Pet: " + pet)

        notificationService.createNotification(pet, user)

        redirect(controller: "activity", action: "index")
        return
    }
}
