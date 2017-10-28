package webservice

import grails.test.spock.IntegrationSpec
import org.apache.log4j.Level
import org.apache.log4j.LogManager
import spock.lang.Shared
import webserver.ActivityController
import webserver.Notification
import webserver.Pet
import webserver.PetColor
import webserver.PetRace
import webserver.PetSize
import webserver.PetType
import webserver.User

class ActivityControllerIntegrationSpec extends IntegrationSpec{

    @Shared
    ActivityController controller = new ActivityController()

    void setup() {
        org.apache.log4j.BasicConfigurator.configure()
        LogManager.getRootLogger().setLevel(Level.INFO)
    }

    void "test index 302 user not logged in"() {
        given:
        controller.request.method = 'GET'
        when:
        controller.index()
        then:
        controller.response.status == 302
        controller.session.token == null
        User.count() == 0
    }

    void "test index Exception invalid page"(){
        given:
        User user = new User(username: "Pepepe", name: "Pepe Pepe", gender: "male", email: "pepepe@gmail.com", phoneNumber: "+54(11)1234-5678", password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a", sessionToken: "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
        user.dateCreated = new Date()
        user.save(flush: true)
        controller.request.method = 'GET'
        controller.session.token = "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        controller.params.page = "LALA"
        when:
        controller.index()
        then:
        thrown RuntimeException
        controller.session.token == "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        User.count() == 1
        User.deleteAll(User.list())
    }

    void "test index 200 no notifications"(){
        given:
        User user = new User(username: "Pepepe", name: "Pepe Pepe", gender: "male", email: "pepepe@gmail.com", phoneNumber: "+54(11)1234-5678", password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a", sessionToken: "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
        user.dateCreated = new Date()
        user.save(flush: true)
        controller.request.method = 'GET'
        controller.session.token = "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        controller.params.page = "1"
        when:
        controller.index()
        then:
        controller.response.status == 200
        controller.session.token == "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        User.count() == 1
        User.deleteAll(User.list())
    }

    void "test index Exception notification save fail"(){
        given:
        User user = new User(username: "Pepepe", name: "Pepe Pepe", gender: "male", email: "pepepe@gmail.com", phoneNumber: "+54(11)1234-5678", password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a", sessionToken: "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
        user.dateCreated = new Date()
        user.save(flush: true)
        User user2 = new User(username: "testtest", name: "Test User", gender: "male", email: "test@gmail.com", phoneNumber: "+54(11)1234-5678", password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a", sessionToken: "8c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
        user2.dateCreated = new Date()
        user2.save(flush: true)
        PetColor petColor1 = new PetColor(description: "White")
        petColor1.dateCreated = new Date()
        petColor1.save(flush: true)
        PetSize petSize1 = new PetSize(description: "Thin")
        petSize1.dateCreated = new Date()
        petSize1.save(flush: true)
        PetType petType1 = new PetType(description: "Dog")
        petType1.dateCreated = new Date()
        petType1.save(flush: true)
        PetRace petRace1 = new PetRace(description: "Bulldog", petType:petType1)
        petRace1.dateCreated = new Date()
        petRace1.save(flush: true)
        Pet pet1 = new Pet(nickname: "Pepe", gender: "male", description: "A good dog", image: null , user: user, petColor: petColor1, petType: petType1, petSize:petSize1, petRace:petRace1, latitude: -58.35 as BigDecimal, longitude: -67.88 as BigDecimal, status: "lost", imageContentType: null)
        Date date = new Date()
        pet1.dateCreated = date
        pet1.lastUpdated = date
        pet1.save(flush: true)
        Pet pet2 = new Pet(nickname: "Nico", gender: "male", description: "Un buen perro.", image: null, imageContentType: null, latitude: -34.5, longitude: -58.2, status: "lost", user: user2, petColor: petColor1, petSize: petSize1, petType: petType1, petRace: petRace1)
        date = new Date()
        pet2.dateCreated = date
        pet2.lastUpdated = date
        pet2.save(flush: true)
        Notification notification1 = new Notification(user: user, pet:pet2, notSeenByUser: user.id)
        date = new Date()
        notification1.dateCreated = date
        notification1.lastUpdated = date
        notification1.save(flush: true)
        controller.request.method = 'GET'
        controller.session.token = "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        controller.params.page = "1"
        controller.notificationService.utilsService.metaClass.saveInstance{ def instance ->
            return false
        }
        when:
        controller.index()
        then:
        thrown RuntimeException
        controller.session.token == "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        User.count() == 2
        PetColor.count() == 1
        PetSize.count() == 1
        PetType.count() == 1
        PetRace.count() == 1
        Pet.count() == 2
        Notification.count() == 1
        Notification.findAll()[0].notSeenByUser == user.id
        Notification.deleteAll(Notification.list())
        Pet.deleteAll(Pet.list())
        PetColor.deleteAll(PetColor.list())
        PetSize.deleteAll(PetSize.list())
        PetType.deleteAll(PetType.list())
        PetRace.deleteAll(PetRace.list())
        User.deleteAll(User.list())
    }

    void "test index 200 with notifications"(){
        given:
        User user = new User(username: "Pepepe", name: "Pepe Pepe", gender: "male", email: "pepepe@gmail.com", phoneNumber: "+54(11)1234-5678", password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a", sessionToken: "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
        user.dateCreated = new Date()
        user.save(flush: true)
        User user2 = new User(username: "testtest", name: "Test User", gender: "male", email: "test@gmail.com", phoneNumber: "+54(11)1234-5678", password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a", sessionToken: "8c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
        user2.dateCreated = new Date()
        user2.save(flush: true)
        PetColor petColor1 = new PetColor(description: "White")
        petColor1.dateCreated = new Date()
        petColor1.save(flush: true)
        PetSize petSize1 = new PetSize(description: "Thin")
        petSize1.dateCreated = new Date()
        petSize1.save(flush: true)
        PetType petType1 = new PetType(description: "Dog")
        petType1.dateCreated = new Date()
        petType1.save(flush: true)
        PetRace petRace1 = new PetRace(description: "Bulldog", petType:petType1)
        petRace1.dateCreated = new Date()
        petRace1.save(flush: true)
        Pet pet1 = new Pet(nickname: "Pepe", gender: "male", description: "A good dog", image: null , user: user, petColor: petColor1, petType: petType1, petSize:petSize1, petRace:petRace1, latitude: -58.35 as BigDecimal, longitude: -67.88 as BigDecimal, status: "lost", imageContentType: null)
        Date date = new Date()
        pet1.dateCreated = date
        pet1.lastUpdated = date
        pet1.save(flush: true)
        Pet pet2 = new Pet(nickname: "Nico", gender: "male", description: "Un buen perro.", image: null, imageContentType: null, latitude: -34.5, longitude: -58.2, status: "lost", user: user2, petColor: petColor1, petSize: petSize1, petType: petType1, petRace: petRace1)
        date = new Date()
        pet2.dateCreated = date
        pet2.lastUpdated = date
        pet2.save(flush: true)
        Notification notification1 = new Notification(user: user, pet:pet2, notSeenByUser: user.id)
        date = new Date()
        notification1.dateCreated = date
        notification1.lastUpdated = date
        notification1.save(flush: true)
        controller.request.method = 'GET'
        controller.session.token = "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        controller.params.page = "1"
        controller.notificationService.utilsService.metaClass.saveInstance{ def instance ->
            return instance.save(flush:true)
        }
        when:
        controller.index()
        then:
        controller.response.status == 200
        controller.session.token == "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        User.count() == 2
        PetColor.count() == 1
        PetSize.count() == 1
        PetType.count() == 1
        PetRace.count() == 1
        Pet.count() == 2
        Notification.count() == 1
        Notification.findAll()[0].notSeenByUser == null
        Notification.deleteAll(Notification.list())
        Pet.deleteAll(Pet.list())
        PetColor.deleteAll(PetColor.list())
        PetSize.deleteAll(PetSize.list())
        PetType.deleteAll(PetType.list())
        PetRace.deleteAll(PetRace.list())
        User.deleteAll(User.list())
    }
}
