import webserver.PetRace
import webserver.PetSize
import webserver.PetColor
import webserver.PetType
import webserver.User
import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        if (Environment.current == Environment.DEVELOPMENT) {
            log.info("Initializing data...")
            //password: Password1*
            User user = new User(username: "adminuser", name: "Admin User", gender: "Male", email: "admin@gmail.com", phoneNumber: "+54(11)1234-5678", isAdmin: true, password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a", sessionToken: "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
            user.dateCreated = new Date()
            if (!user.save(flush: true))
            {
                user.discard()
                user.errors.each {
                    log.error("Error: Error saving to User table: " + it + " . User: " + user)
                }
            }
            PetColor petColor1 = new PetColor(description: "White")
            petColor1.dateCreated = new Date()
            if (!petColor1.save(flush: true))
            {
                petColor1.discard()
                petColor1.errors.each {
                    log.error("Error: Error saving to PetColor table: " + it + " . PetColor: " + petColor1)
                }
            }
            PetColor petColor2 = new PetColor(description: "Black")
            petColor2.dateCreated = new Date()
            if (!petColor2.save(flush: true)) {
                petColor2.discard()
                petColor2.errors.each {
                    log.error("Error: Error saving to PetColor table: " + it + " . PetColor: " + petColor2)
                }
            }
            PetSize petSize1 = new PetSize(description: "Thin")
            petSize1.dateCreated = new Date()
            if (!petSize1.save(flush: true))
            {
                petSize1.discard()
                petSize1.errors.each {
                    log.error("Error: Error saving to PetSize table: " + it + " . PetSize: " + petSize1)
                }
            }
            PetSize petSize2 = new PetSize(description: "Obese")
            petSize2.dateCreated = new Date()
            if (!petSize2.save(flush: true))
            {
                petSize2.discard()
                petSize2.errors.each {
                    log.error("Error: Error saving to PetSize table: " + it + " . PetSize: " + petSize2)
                }
            }
            PetType petType1 = new PetType(description: "Dog")
            petType1.dateCreated = new Date()
            if (!petType1.save(flush: true))
            {
                petType1.discard()
                petType1.errors.each {
                    log.error("Error: Error saving to PetType table: " + it + " . PetType: " + petType1)
                }
            }
            PetType petType2 = new PetType(description: "Cat")
            petType2.dateCreated = new Date()
            if (!petType2.save(flush: true))
            {
                petType2.discard()
                petType2.errors.each {
                    log.error("Error: Error saving to PetType table: " + it + " . PetType: " + petType2)
                }
            }
            PetType petType3 = new PetType(description: "Fish")
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
        }
    }

    def destroy = {
    }
}