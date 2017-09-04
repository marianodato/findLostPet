package webserver

import grails.transaction.Transactional

@Transactional
class PetService {

    static limit = 3
    def utilsService

    def getUserPets(User user, def page) {

        def quantity = Pet.countByUser(user)
        def pages = (quantity/limit) as Integer

        if (quantity%limit != 0)
            pages += 1

        if (page > pages)
            page = 1

        def pets = Pet.findAll("from Pet as p where p.user=? order by p.dateCreated desc",
                [user], [max: limit, offset: limit*(page-1)])

        return [pets:pets, page:page, pages:pages]

    }

    def getPet(def id) {
        def pet = Pet.findById(id)
        return pet
    }

    def updatePetStatus(def petId, user) {

        def pet = Pet.findById(petId)
        def resp = [:]

        log.info("Pet: " + pet)

        if (pet.user.id != user.id)
        {
            log.error("Pet does not exist or does not belong to user.User: " + user + ".Pet: " + pet)
            throw new RuntimeException("Pet does not exist or does not belong to user.User: " + user + ".Pet: " + pet)
        }

        pet.status = "finished"

        if (!utilsService.saveInstance(pet)){
            pet.discard()
            pet.errors.each {
                log.error("Error saving to Pet table: " + it + " .Pet: " + pet)
            }
            throw new RuntimeException("Error saving to Pet table.Pet: " + pet)
        }

        log.info("Pet updated successfully!")
        resp.message = "Modificación exitosa!"
        resp.status = 201
        return resp

    }
}
