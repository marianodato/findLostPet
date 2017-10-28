package webserver

import grails.transaction.Transactional

@Transactional
class NotificationService {

    static limit = 3
    def utilsService

    def createNotification(def pet, def user){

        Notification notification = new Notification(user: user, pet: pet, notSeenByUser: pet.user.id)
        Date date = new Date()
        notification.dateCreated = date
        notification.lastUpdated = date

        if (!utilsService.saveInstance(notification)){
            notification.discard()
            notification.errors.each {
                log.error("Error saving to Notification table: " + notification + " .Notification: " + notification)
            }
            throw new RuntimeException("Error saving to Notification table.Notification: " + notification)
        }

        log.info("Notification saved successfully!")
        def resp = [:]
        resp.message = "Carga exitosa!"
        resp.status = 201
        return resp
    }

    def getUserNotifications(def user, def page){

        def quantity = Notification.countByUser(user)
        def pets = Pet.findAllByUser(user)

        if (pets){
            quantity += Notification.countByPetInList(pets)
        }

        def pages = (quantity/limit) as Integer

        if (quantity%limit != 0)
            pages += 1

        if (page > pages)
            page = 1

        def notifications = Notification.findAll("from Notification as n where n.user=? or n.pet.user=? order by n.lastUpdated desc",
                [user, user], [max: limit, offset: limit*(page-1)])

        return [notifications:notifications, page:page, pages:pages]
    }

    def getUserConnections(def user){
        def notifications = Notification.findAllByUser(user)
        return notifications
    }

    def updateNotification(def pet){

        def notifications = Notification.findAllByPet(pet)

        notifications.each {
            it.lastUpdated = it.pet.lastUpdated
            it.notSeenByUser = it.user.id

            if (!utilsService.saveInstance(it)) {
                it.discard()
                it.errors.each {
                    log.error("Error saving to Notification table: " + it + " .Notification: " + it)
                }
                throw new RuntimeException("Error saving to Notification table.Notification: " + it)
            }
        }
        return
    }

    def needToNotify(def user){

        def quantity = Notification.countByNotSeenByUser(user.id)

        if (quantity > 0){
            return quantity
        }else{
            return null
        }
    }

    def seeNotifications(def user){
        def notifications = Notification.findAllByNotSeenByUser(user.id)

        notifications.each {
            it.notSeenByUser = null

            if (!utilsService.saveInstance(it)) {
                it.discard()
                it.errors.each {
                    log.error("Error saving to Notification table: " + it + " .Notification: " + it)
                }
                throw new RuntimeException("Error saving to Notification table.Notification: " + it)
            }
        }
        return
    }
}
