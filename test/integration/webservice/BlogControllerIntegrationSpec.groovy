package webservice

import grails.test.spock.IntegrationSpec
import org.apache.log4j.Level
import org.apache.log4j.LogManager
import spock.lang.Shared
import webserver.BlogController
import webserver.User

class BlogControllerIntegrationSpec extends IntegrationSpec {

    @Shared
    BlogController controller = new BlogController()

    void setup() {
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
}