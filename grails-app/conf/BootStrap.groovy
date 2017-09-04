import webserver.PetRace
import webserver.PetSize
import webserver.PetColor
import webserver.PetType
import webserver.User
import webserver.Pet
import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        if (Environment.current == Environment.DEVELOPMENT) {
            log.info("Initializing data...")
            //password: Password1*
            User user1 = new User(username: "adminuser", name: "Admin User", gender: "male", email: "admin@gmail.com", phoneNumber: "+54(11)1234-5678", isAdmin: true, password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a", sessionToken: "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
            user1.dateCreated = new Date()
            if (!user1.save(flush: true))
            {
                user1.discard()
                user1.errors.each {
                    log.error("Error: Error saving to User table: " + it + " . User: " + user1)
                }
            }
            PetColor petColor1 = new PetColor(description: "Blanco")
            petColor1.dateCreated = new Date()
            if (!petColor1.save(flush: true))
            {
                petColor1.discard()
                petColor1.errors.each {
                    log.error("Error: Error saving to PetColor table: " + it + " . PetColor: " + petColor1)
                }
            }
            PetColor petColor2 = new PetColor(description: "Negro")
            petColor2.dateCreated = new Date()
            if (!petColor2.save(flush: true)) {
                petColor2.discard()
                petColor2.errors.each {
                    log.error("Error: Error saving to PetColor table: " + it + " . PetColor: " + petColor2)
                }
            }
            PetSize petSize1 = new PetSize(description: "Delgado")
            petSize1.dateCreated = new Date()
            if (!petSize1.save(flush: true))
            {
                petSize1.discard()
                petSize1.errors.each {
                    log.error("Error: Error saving to PetSize table: " + it + " . PetSize: " + petSize1)
                }
            }
            PetSize petSize2 = new PetSize(description: "Obeso")
            petSize2.dateCreated = new Date()
            if (!petSize2.save(flush: true))
            {
                petSize2.discard()
                petSize2.errors.each {
                    log.error("Error: Error saving to PetSize table: " + it + " . PetSize: " + petSize2)
                }
            }
            PetType petType1 = new PetType(description: "Perro")
            petType1.dateCreated = new Date()
            if (!petType1.save(flush: true))
            {
                petType1.discard()
                petType1.errors.each {
                    log.error("Error: Error saving to PetType table: " + it + " . PetType: " + petType1)
                }
            }
            PetType petType2 = new PetType(description: "Gato")
            petType2.dateCreated = new Date()
            if (!petType2.save(flush: true))
            {
                petType2.discard()
                petType2.errors.each {
                    log.error("Error: Error saving to PetType table: " + it + " . PetType: " + petType2)
                }
            }
            PetType petType3 = new PetType(description: "Pez")
            petType3.dateCreated = new Date()
            if (!petType3.save(flush: true))
            {
                petType3.discard()
                petType3.errors.each {
                    log.error("Error: Error saving to PetType table: " + it + " . PetType: " + petType3)
                }
            }
            PetRace petRace1 = new PetRace(description: "Bulldog", petType:petType1)
            petRace1.dateCreated = new Date()
            if (!petRace1.save(flush: true))
            {
                petRace1.discard()
                petRace1.errors.each {
                    log.error("Error: Error saving to PetRace table: " + it + " . PetRace: " + petRace1)
                }
            }
            PetRace petRace2 = new PetRace(description: "Pitbull", petType:petType1)
            petRace2.dateCreated = new Date()
            if (!petRace2.save(flush: true))
            {
                petRace2.discard()
                petRace2.errors.each {
                    log.error("Error: Error saving to PetRace table: " + it + " . PetRace: " + petRace2)
                }
            }
            PetRace petRace3 = new PetRace(description: "Ragdoll", petType:petType2)
            petRace3.dateCreated = new Date()
            if (!petRace3.save(flush: true))
            {
                petRace3.discard()
                petRace3.errors.each {
                    log.error("Error: Error saving to PetRace table: " + it + " . PetRace: " + petRace3)
                }
            }
            PetRace petRace4 = new PetRace(description: "Bombay", petType:petType2)
            petRace4.dateCreated = new Date()
            if (!petRace4.save(flush: true))
            {
                petRace4.discard()
                petRace4.errors.each {
                    log.error("Error: Error saving to PetRace table: " + it + " . PetRace: " + petRace4)
                }
            }
            Pet pet1 = new Pet(nickname: "Nico", gender: "male", description: "Un buen perro.", image: null, imageContentType: null, latitude: -34.5, longitude: -58.2, status: "lost", user: user1, petColor: petColor1, petSize: petSize1, petType: petType1, petRace: petRace1)
            def date = new Date()
            pet1.dateCreated = date
            pet1.lastUpdated = date
            if (!pet1.save(flush: true))
            {
                pet1.discard()
                pet1.errors.each {
                    log.error("Error: Error saving to Pet table: " + it + " . Pet: " + pet1)
                }
            }
            Pet pet2 = new Pet(nickname: "Nina", gender: "female", description: "Una perra hermosa.", image: null, imageContentType: null, latitude: -35.2, longitude: -57.8, status: "found", user: user1, petColor: petColor2, petSize: petSize2, petType: petType1, petRace: petRace2)
            date = new Date()
            pet2.dateCreated = date
            pet2.lastUpdated = date
            if (!pet2.save(flush: true))
            {
                pet2.discard()
                pet2.errors.each {
                    log.error("Error: Error saving to Pet table: " + it + " . Pet: " + pet2)
                }
            }
        }
    }

    def destroy = {
    }
}