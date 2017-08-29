package webservice

import grails.test.spock.IntegrationSpec
import org.apache.log4j.Level
import org.apache.log4j.LogManager
import spock.lang.Shared
import webserver.Pet
import webserver.PetColor
import webserver.PetRace
import webserver.PetSize
import webserver.PetType
import webserver.PostController
import webserver.User

class PostControllerIntegrationSpec extends IntegrationSpec{

    @Shared
    PostController controller = new PostController()

    void setup(){
        org.apache.log4j.BasicConfigurator.configure();
        LogManager.getRootLogger().setLevel(Level.INFO);
    }

    void "test index user already logged in"(){
        given:
        User user = new User(username: "Pepepe", name: "Pepe Pepe", gender: "Male", email: "pepepe@gmail.com", phoneNumber: "+54(11)1234-5678", isAdmin: false, password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a", sessionToken: "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
        user.dateCreated = new Date()
        user.save(flush: true)
        controller.request.method = 'GET'
        controller.session.token = "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        when:
        controller.index()
        then:
        controller.response.status == 200
        controller.session.token == "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        User.count() == 1
        User.deleteAll(User.list())
    }

    void "test index user not logged in"(){
        given:
        controller.request.method = 'GET'
        controller.session.token = null
        when:
        controller.index()
        then:
        controller.response.status == 302
    }

    void "test post user not logged in"(){
        given:
        controller.request.method = 'POST'
        controller.session.token = null
        when:
        controller.index()
        then:
        controller.response.status == 302
    }

    void "test post no latitude"() {
        given:
        User user = new User(username: "Pepepe", name: "Pepe Pepe", gender: "Male", email: "pepepe@gmail.com", phoneNumber: "+54(11)1234-5678", isAdmin: false, password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a", sessionToken: "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
        user.dateCreated = new Date()
        user.save(flush: true)
        controller.request.method = 'POST'
        controller.session.token = "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        when:
        controller.post()
        then:
        controller.response.status == 200
        controller.session.token == "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        User.count() == 1
        User.deleteAll(User.list())
    }

    void "test post no longitude"() {
        given:
        User user = new User(username: "Pepepe", name: "Pepe Pepe", gender: "Male", email: "pepepe@gmail.com", phoneNumber: "+54(11)1234-5678", isAdmin: false, password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a", sessionToken: "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
        user.dateCreated = new Date()
        user.save(flush: true)
        controller.request.method = 'POST'
        controller.session.token = "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        controller.params.latitude = "-34.99"
        when:
        controller.post()
        then:
        controller.response.status == 200
        controller.session.token == "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        User.count() == 1
        User.deleteAll(User.list())
    }

    void "test post PetColor save fails"() {
        given:
        User user = new User(username: "Pepepe", name: "Pepe Pepe", gender: "Male", email: "pepepe@gmail.com", phoneNumber: "+54(11)1234-5678", isAdmin: false, password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a", sessionToken: "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
        user.dateCreated = new Date()
        user.save(flush: true)
        controller.request.method = 'POST'
        controller.session.token = "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        controller.params.latitude = "-34.99"
        controller.params.longitude = "-34.99"
        controller.params.otherColor = "Blue"
        controller.postService.utilsService.metaClass.saveInstance{ def instance ->
            return false
        }
        when:
        controller.post()
        then:
        thrown RuntimeException
        controller.session.token == "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        User.count() == 1
        PetColor.count() == 0
        User.deleteAll(User.list())
        PetColor.deleteAll(PetColor.list())
    }

    void "test post PetSize save fails 1"() {
        given:
        User user = new User(username: "Pepepe", name: "Pepe Pepe", gender: "Male", email: "pepepe@gmail.com", phoneNumber: "+54(11)1234-5678", isAdmin: false, password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a", sessionToken: "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
        user.dateCreated = new Date()
        user.save(flush: true)
        controller.request.method = 'POST'
        controller.session.token = "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        controller.params.latitude = "-34.99"
        controller.params.longitude = "-34.99"
        controller.params.otherColor = "Blue"
        controller.params.otherSize = "Obese"
        def num = 0
        controller.postService.utilsService.metaClass.saveInstance{ def instance ->
            if (num == 1) {
                return false
            }else {
                num ++
                return true
            }
        }
        when:
        controller.post()
        then:
        thrown RuntimeException
        controller.session.token == "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        User.count() == 1
        PetColor.count() == 0
        PetSize.count() == 0
        User.deleteAll(User.list())
        PetColor.deleteAll(PetColor.list())
        PetSize.deleteAll(PetSize.list())
    }

    void "test post PetSize save fails 2"() {
        given:
        User user = new User(username: "Pepepe", name: "Pepe Pepe", gender: "Male", email: "pepepe@gmail.com", phoneNumber: "+54(11)1234-5678", isAdmin: false, password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a", sessionToken: "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
        user.dateCreated = new Date()
        user.save(flush: true)
        PetColor petColor1 = new PetColor(description: "White")
        petColor1.dateCreated = new Date()
        petColor1.save(flush: true)
        controller.request.method = 'POST'
        controller.session.token = "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        controller.params.latitude = "-34.99"
        controller.params.longitude = "-34.99"
        controller.params.otherColor = "Blue"
        controller.params.selectPetColors = "1"
        controller.postService.utilsService.metaClass.saveInstance{ def instance ->
                return false
        }
        when:
        controller.post()
        then:
        thrown RuntimeException
        controller.session.token == "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        User.count() == 1
        PetColor.count() == 1
        PetSize.count() == 0
        User.deleteAll(User.list())
        PetColor.deleteAll(PetColor.list())
        PetSize.deleteAll(PetSize.list())
    }

    void "test post PetType save fails 1"() {
        given:
        User user = new User(username: "Pepepe", name: "Pepe Pepe", gender: "Male", email: "pepepe@gmail.com", phoneNumber: "+54(11)1234-5678", isAdmin: false, password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a", sessionToken: "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
        user.dateCreated = new Date()
        user.save(flush: true)
        controller.request.method = 'POST'
        controller.session.token = "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        controller.params.latitude = "-34.99"
        controller.params.longitude = "-34.99"
        controller.params.otherColor = "Blue"
        controller.params.otherSize = "Obese"
        controller.params.otherType = "Dog"
        def num = 0
        controller.postService.utilsService.metaClass.saveInstance{ def instance ->
            if (num == 2) {
                return false
            }else {
                num ++
                return true
            }
        }
        when:
        controller.post()
        then:
        thrown RuntimeException
        controller.session.token == "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        User.count() == 1
        PetColor.count() == 0
        PetSize.count() == 0
        PetType.count() == 0
        User.deleteAll(User.list())
        PetColor.deleteAll(PetColor.list())
        PetSize.deleteAll(PetSize.list())
        PetType.deleteAll(PetType.list())
    }

    void "test post PetType save fails 2"() {
        given:
        User user = new User(username: "Pepepe", name: "Pepe Pepe", gender: "Male", email: "pepepe@gmail.com", phoneNumber: "+54(11)1234-5678", isAdmin: false, password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a", sessionToken: "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
        user.dateCreated = new Date()
        user.save(flush: true)
        PetColor petColor1 = new PetColor(description: "White")
        petColor1.dateCreated = new Date()
        petColor1.save(flush: true)
        PetSize petSize1 = new PetSize(description: "Thin")
        petSize1.dateCreated = new Date()
        petSize1.save(flush: true)
        controller.request.method = 'POST'
        controller.session.token = "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        controller.params.latitude = "-34.99"
        controller.params.longitude = "-34.99"
        controller.params.otherColor = "Blue"
        controller.params.selectPetColors = "1"
        controller.params.selectPetSizes = "1"
        controller.postService.utilsService.metaClass.saveInstance{ def instance ->
                return false
        }
        when:
        controller.post()
        then:
        thrown RuntimeException
        controller.session.token == "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        User.count() == 1
        PetColor.count() == 1
        PetSize.count() == 1
        PetType.count() == 0
        User.deleteAll(User.list())
        PetColor.deleteAll(PetColor.list())
        PetSize.deleteAll(PetSize.list())
        PetType.deleteAll(PetType.list())
    }

    void "test post PetRace save fails 1"() {
        given:
        User user = new User(username: "Pepepe", name: "Pepe Pepe", gender: "Male", email: "pepepe@gmail.com", phoneNumber: "+54(11)1234-5678", isAdmin: false, password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a", sessionToken: "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
        user.dateCreated = new Date()
        user.save(flush: true)
        controller.request.method = 'POST'
        controller.session.token = "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        controller.params.latitude = "-34.99"
        controller.params.longitude = "-34.99"
        controller.params.otherColor = "Blue"
        controller.params.otherSize = "Obese"
        controller.params.otherType = "Dog"
        controller.params.otherRace = "Pitbull"
        def num = 0
        controller.postService.utilsService.metaClass.saveInstance{ def instance ->
            if (num == 3) {
                return false
            }else {
                num ++
                return true
            }
        }
        when:
        controller.post()
        then:
        thrown RuntimeException
        controller.session.token == "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        User.count() == 1
        PetColor.count() == 0
        PetSize.count() == 0
        PetType.count() == 0
        PetRace.count() == 0
        User.deleteAll(User.list())
        PetColor.deleteAll(PetColor.list())
        PetSize.deleteAll(PetSize.list())
        PetType.deleteAll(PetType.list())
        PetRace.deleteAll(PetRace.list())
    }

    void "test post PetRace save fails 2"() {
        given:
        User user = new User(username: "Pepepe", name: "Pepe Pepe", gender: "Male", email: "pepepe@gmail.com", phoneNumber: "+54(11)1234-5678", isAdmin: false, password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a", sessionToken: "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
        user.dateCreated = new Date()
        user.save(flush: true)
        PetColor petColor1 = new PetColor(description: "White")
        petColor1.dateCreated = new Date()
        petColor1.save(flush: true)
        PetSize petSize1 = new PetSize(description: "Thin")
        petSize1.dateCreated = new Date()
        petSize1.save(flush: true)
        PetType petType1 = new PetType(description: "Dog")
        petType1.dateCreated = new Date()
        petType1.save(flush: true)
        controller.request.method = 'POST'
        controller.session.token = "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        controller.params.latitude = "-34.99"
        controller.params.longitude = "-34.99"
        controller.params.otherColor = "Blue"
        controller.params.selectPetColors = "1"
        controller.params.selectPetSizes = "1"
        controller.params.selectPetTypes = "1"
        controller.postService.utilsService.metaClass.saveInstance{ def instance ->
                return false
        }
        when:
        controller.post()
        then:
        thrown RuntimeException
        controller.session.token == "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        User.count() == 1
        PetColor.count() == 1
        PetSize.count() == 1
        PetType.count() == 1
        PetRace.count() == 0
        User.deleteAll(User.list())
        PetColor.deleteAll(PetColor.list())
        PetSize.deleteAll(PetSize.list())
        PetType.deleteAll(PetType.list())
        PetRace.deleteAll(PetRace.list())
    }

    void "test post Pet save fails"() {
        given:
        User user = new User(username: "Pepepe", name: "Pepe Pepe", gender: "Male", email: "pepepe@gmail.com", phoneNumber: "+54(11)1234-5678", isAdmin: false, password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a", sessionToken: "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
        user.dateCreated = new Date()
        user.save(flush: true)
        controller.request.method = 'POST'
        controller.session.token = "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        controller.params.latitude = "-34.99"
        controller.params.longitude = "-34.99"
        controller.params.otherColor = "Blue"
        controller.params.otherSize = "Obese"
        controller.params.otherType = "Dog"
        controller.params.otherRace = "Pitbull"
        def num = 0
        controller.postService.utilsService.metaClass.saveInstance{ def instance ->
            if (num == 4) {
                return false
            }else {
                num ++
                return true
            }
        }
        when:
        controller.post()
        then:
        thrown RuntimeException
        controller.session.token == "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        User.count() == 1
        PetColor.count() == 0
        PetSize.count() == 0
        PetType.count() == 0
        PetRace.count() == 0
        Pet.count() == 0
        User.deleteAll(User.list())
        PetColor.deleteAll(PetColor.list())
        PetSize.deleteAll(PetSize.list())
        PetType.deleteAll(PetType.list())
        PetRace.deleteAll(PetRace.list())
        Pet.deleteAll(Pet.list())
    }

    void "test post ok"() {
        given:
        User user = new User(username: "Pepepe", name: "Pepe Pepe", gender: "Male", email: "pepepe@gmail.com", phoneNumber: "+54(11)1234-5678", isAdmin: false, password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a", sessionToken: "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
        user.dateCreated = new Date()
        user.save(flush: true)
        controller.request.method = 'POST'
        controller.session.token = "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        controller.params.latitude = "-34.99"
        controller.params.longitude = "-34.99"
        controller.params.otherColor = "Blue"
        controller.params.otherSize = "Obese"
        controller.params.otherType = "Dog"
        controller.params.otherRace = "Pitbull"
        controller.params.nickname = "Marlon"
        controller.params.gender = "Male"
        controller.params.description = "A pitbull"
        controller.params.status = "Lost"
        controller.postService.utilsService.metaClass.saveInstance{ def instance ->
                return instance.save(flush:true)
        }
        when:
        controller.post()
        then:
        controller.response.status == 302
        controller.session.token == "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        User.count() == 1
        PetColor.count() == 1
        PetSize.count() == 1
        PetType.count() == 1
        PetRace.count() == 1
        Pet.count() == 1
        User.deleteAll(User.list())
        PetColor.deleteAll(PetColor.list())
        PetSize.deleteAll(PetSize.list())
        PetType.deleteAll(PetType.list())
        PetRace.deleteAll(PetRace.list())
        Pet.deleteAll(Pet.list())
    }
}
