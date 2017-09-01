package webserver

import grails.transaction.Transactional

@Transactional
class PostService {

    def utilsService

    def createPost(def user, def params){

        def resp = [:]
        PetColor petColor
        PetSize petSize
        PetType petType
        PetRace petRace
        Pet pet

        if (!params.latitude || !params.longitude)
        {
            log.error("Please select a location in the map!")
            resp.message = "Por favor, seleccione una ubicación en el mapa!"
            resp.status = 400
            return resp
        }

        if (params.otherColor){
            petColor = new PetColor(description: params.otherColor)
            petColor.dateCreated = new Date()

            if (!utilsService.saveInstance(petColor)){
                petColor.discard()
                petColor.errors.each {
                    log.error("Error saving to PetColor table: " + it + " .PetColor: " + petColor)
                }
                throw new RuntimeException("Error saving to PetColor table.PetColor: " + petColor)
            }
            log.info("PetColor saved successfully!")
        }else
        {
            petColor = PetColor.findById(params.selectPetColors as Long)
        }

        if (params.otherSize){
            petSize = new PetSize(description: params.otherSize)
            petSize.dateCreated = new Date()

            if (!utilsService.saveInstance(petSize)){
                petSize.discard()
                petSize.errors.each {
                    log.error("Error saving to PetSize table: " + it + " .PetSize: " + petSize)
                }
                throw new RuntimeException("Error saving to PetSize table.PetSize: " + petSize)
            }
            log.info("PetSize saved successfully!")
        }else
        {
            petSize = PetSize.findById(params.selectPetSizes as Long)
        }

        if (params.otherType){
            petType = new PetType(description: params.otherType)
            petType.dateCreated = new Date()

            if (!utilsService.saveInstance(petType)){
                petType.discard()
                petType.errors.each {
                    log.error("Error saving to PetType table: " + it + " .PetType: " + petType)
                }
                throw new RuntimeException("Error saving to PetType table.PetType: " + petType)
            }
            log.info("PetType saved successfully!")
        }else
        {
            petType = PetType.findById(params.selectPetTypes as Long)
        }

        if (params.otherRace){
            petRace = new PetRace(description: params.otherRace, petType: petType)
            petRace.dateCreated = new Date()

            if (!utilsService.saveInstance(petRace)){
                petRace.discard()
                petRace.errors.each {
                    log.error("Error saving to PetRace table: " + it + " .PetRace: " + petRace)
                }
                throw new RuntimeException("Error saving to PetRace table.PetRace: " + petRace)
            }
            log.info("PetRace saved successfully!")
        }else
        {
            petRace = PetRace.findById(params.selectPetRaces as Long)
        }

        pet = new Pet(nickname: params.nickname, gender: params.gender, description: params.description, image: params.image , user: user, petColor: petColor, petType: petType, petSize:petSize, petRace:petRace, latitude: params.latitude as BigDecimal, longitude: params.longitude as BigDecimal, status: params.status, imageContentType: params.imageContentType)
        Date date = new Date()
        pet.dateCreated = date
        pet.lastUpdated = date

        if (!utilsService.saveInstance(pet)){
            pet.discard()
            pet.errors.each {
                log.error("Error saving to Pet table: " + it + " .Pet: " + pet)
            }
            throw new RuntimeException("Error saving to Pet table.Pet: " + pet)
        }

        log.info("Pet saved successfully!")
        resp.message = "Carga exitosa!"
        resp.status = 201
        return resp
    }

}
