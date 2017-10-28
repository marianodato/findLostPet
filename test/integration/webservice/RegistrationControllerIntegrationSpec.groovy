package webservice

import grails.test.spock.IntegrationSpec
import org.apache.log4j.Level
import org.apache.log4j.LogManager
import spock.lang.Shared
import webserver.RegistrationController
import webserver.User

class RegistrationControllerIntegrationSpec extends IntegrationSpec {

    @Shared
    RegistrationController controller = new RegistrationController()

    void setup() {
        org.apache.log4j.BasicConfigurator.configure()
        LogManager.getRootLogger().setLevel(Level.INFO)
    }

    void "test index 302 user logged in"(){
        given:
        User user = new User(username: "Pepepe", name: "Pepe Pepe", gender: "male", email: "pepepe@gmail.com", phoneNumber: "+54(11)1234-5678", password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a", sessionToken: "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
        user.dateCreated = new Date()
        user.save(flush: true)
        controller.request.method = 'GET'
        controller.session.token = "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        when:
        controller.index()
        then:
        controller.response.status == 302
        controller.session.token == "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        User.count() == 1
        User.deleteAll(User.list())
    }

    void "test index 200 user not logged in"(){
        given:
        controller.request.method = 'GET'
        controller.session.token = null
        when:
        controller.index()
        then:
        controller.response.status == 200
        controller.session.token == null
        User.count() == 0
    }

    void "test registration 302 user logged in"(){
        given:
        User user = new User(username: "Pepepe", name: "Pepe Pepe", gender: "male", email: "pepepe@gmail.com", phoneNumber: "+54(11)1234-5678", password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a", sessionToken: "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
        user.dateCreated = new Date()
        user.save(flush: true)
        controller.request.method = 'POST'
        controller.session.token = "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        when:
        controller.registration()
        then:
        controller.response.status == 302
        controller.session.token == "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        User.count() == 1
        User.deleteAll(User.list())
    }

    void "test registration 200 username already registered"() {
        given:
        User user = new User(username: "Pepepe", name: "Pepe Pepe", gender: "male", email: "pepepe@gmail.com", phoneNumber: "+54(11)1234-5678", dateCreated: new Date(), password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a", session_token: null)
        user.dateCreated = new Date()
        user.save(flush: true)
        controller.request.method = 'POST'
        controller.params.username = "Pepepe"
        controller.params.password = "password"
        controller.session.token = null
        when:
        controller.registration()
        then:
        controller.response.status == 200
        controller.session.token == null
        User.count() == 1
        User.deleteAll(User.list())
    }

    void "test registration 200 username cannot be the same as password"() {
        given:
        controller.request.method = 'POST'
        controller.params.username = "lalala"
        controller.params.password = "lalala"
        when:
        controller.registration()
        then:
        controller.response.status == 200
        controller.session.token == null
    }

    void "test registration Exception save 1"() {
        given:
        controller.request.method = 'POST'
        controller.params.username = "Pepepe"
        controller.params.password = "Mar1eto*"
        controller.session.token = null
        controller.registrationService.utilsService.metaClass.saveInstance{ _ ->
            return false
        }
        when:
        controller.registration()
        then:
        thrown RuntimeException
        controller.session.token == null
        User.count() == 0
    }

    void "test registration Exception save 2"() {
        given:
        controller.request.method = 'POST'
        controller.params.username = "Pepepe"
        controller.params.password = "Mar1eto*"
        controller.session.token = null
        controller.registrationService.utilsService.metaClass.saveInstance{ def instance ->
            return instance.save(flush:true)
        }
        when:
        controller.registration()
        then:
        thrown RuntimeException
        controller.session.token == null
        User.count() == 0
        User.deleteAll(User.list())
    }

    void "test registration 302"() {
        given:
        controller.request.method = 'POST'
        controller.params.username = "Pepepe"
        controller.params.password = "Mar1eto*"
        controller.params.email = "pepepe@gmail.com"
        controller.params.name = "Pepe Pepe*"
        controller.params.phone_number = "+54(11)1234-5678"
        controller.params.gender = "male"
        controller.session.token = null
        controller.registrationService.utilsService.metaClass.saveInstance{ def instance ->
            return instance.save(flush:true)
        }
        when:
        controller.registration()
        then:
        controller.response.status == 302
        controller.session.token == null
        User.count() == 1
        User.deleteAll(User.list())
    }
}
