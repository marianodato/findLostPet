package webservice

import grails.test.spock.IntegrationSpec
import org.apache.log4j.Level
import org.apache.log4j.LogManager
import spock.lang.Shared
import webserver.LoginController
import webserver.User
import webserver.UserSession

class LoginControllerIntegrationSpec extends IntegrationSpec{

    @Shared
    LoginController controller = new LoginController()

    void setup(){
        org.apache.log4j.BasicConfigurator.configure();
        LogManager.getRootLogger().setLevel(Level.INFO);
    }

    void "test index user already logged in"(){
        given:
        User user = new User(username: "pepepe", password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a")
        user.save(flush: true)
        UserSession userSession = new UserSession(user_id: user.id, session_token: "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
        userSession.save(flush: true)
        controller.request.method = 'GET'
        controller.session.token = "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        when:
        controller.index()
        then:
        controller.response.status == 302
        //controller.response.json.message == "User already logged in!"
        controller.session.token == "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        userSession.count() == 1
        User.count() == 1
        User.deleteAll(User.list())
        UserSession.deleteAll(User.list())
    }

    void "test index ok"(){
        given:
        controller.request.method = 'GET'
        controller.session.token = null
        when:
        controller.index()
        then:
        controller.response.status == 200
    }

    void "test login user already logged in"(){
        given:
        User user = new User(username: "pepepe", password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a")
        user.save(flush: true)
        UserSession userSession = new UserSession(user_id: user.id, session_token: "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8")
        userSession.save(flush: true)
        controller.request.method = 'POST'
        controller.session.token = "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        when:
        controller.login()
        then:
        controller.response.status == 302
        //controller.response.json.message == "User already logged in!"
        controller.session.token == "9c560129d2c5258fbaa5fedf6a489653862ff5bc41c17927477e5b98b9529ef4210d49a8d2ca67279fc44af6b559d443ec79b9a1277a4036775b32c230a396d8"
        userSession.count() == 1
        User.count() == 1
        User.deleteAll(User.list())
        UserSession.deleteAll(User.list())
    }

    void "test login invalid username 1"() {
        given:
        new User(username: "pepepe", password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a").save(flush: true)
        controller.request.method = 'POST'
        controller.params.sign_in = "Sign In"
        controller.params.username = "testtest"
        controller.params.password = "testtest"
        controller.session.token = "1"
        when:
        controller.login()
        then:
        controller.response.status == 200
        //controller.response.json.message == "Invalid username or password!"
        controller.session.token == "1"
        User.count() == 1
        User.deleteAll(User.list())
    }

    void "test login invalid username 2"() {
        given:
        new User(username: "pepepe", password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a").save(flush: true)
        controller.request.method = 'POST'
        controller.params.sign_in = "Sign In"
        controller.params.username = "testtest"
        controller.params.password = "testtest"
        controller.session.token = null
        when:
        controller.login()
        then:
        controller.response.status == 200
        //controller.response.json.message == "Invalid username or password!"
        controller.session.token == null
        User.count() == 1
        User.deleteAll(User.list())
    }

    void "test login invalid password"() {
        given:
        new User(username: "pepepe", password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a").save(flush: true)
        controller.request.method = 'POST'
        controller.params.sign_in = "Sign In"
        controller.params.username = "pepepe"
        controller.params.password = "testtest"
        controller.session.token = null
        when:
        controller.login()
        then:
        controller.response.status == 200
        //controller.response.json.message == "Invalid username or password!"
        controller.session.token == null
        User.count() == 1
        User.deleteAll(User.list())
    }

    void "test login fail save userSession"() {
        given:
        new User(username: "pepepe", password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a").save(flush: true)
        controller.request.method = 'POST'
        controller.params.sign_in = "Sign In"
        controller.params.username = "pepepe"
        controller.params.password = "Password1*"
        controller.session.token = null
        controller.loginService.sessionService.metaClass.saveInstance{ def instance ->
            return false
        }
        when:
        controller.login()
        then:
        controller.response.status == 200
        //controller.response.json.message == "Oops! Something went wrong..."
        controller.session.token == null
        User.count() == 1
        User.deleteAll(User.list())
    }

    void "test login ok"() {
        given:
        new User(username: "pepepe", password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a").save(flush: true)
        controller.request.method = 'POST'
        controller.params.sign_in = "Sign In"
        controller.params.username = "pepepe"
        controller.params.password = "Password1*"
        controller.session.token = null
        controller.loginService.sessionService.metaClass.saveInstance{ def instance ->
            return instance.save(flush:true)
        }
        when:
        controller.login()
        then:
        controller.response.status == 302
        //controller.response.json.message == "Login successful!"
        controller.session.token != null
        User.count() == 1
        User.deleteAll(User.list())
    }

    void "test register username already registered"() {
        given:
        new User(username: "pepepe", password: "100000:b9f0cdb48f6dd12694eaf1de44ab4a071da56765498abe8732dcf941966bf81ce839dfa4dae220e656760b8ff0d3a83103913a67bc9685083f445dda464449b2:51e7688ee57d721ad50622f50bb248ca55e34d01d5ee7168db050990585bfffcb49d3a9fa655cd3178ace50b668b201411a6bbdca18b8d4177307a33e842db6a").save(flush: true)
        controller.request.method = 'POST'
        controller.params.sign_up = "Sign Up"
        controller.params.username = "pepepe"
        controller.params.password = "password"
        controller.session.token = null
        when:
        controller.login()
        then:
        controller.response.status == 200
        //controller.response.json.message == "Username already registered!"
        controller.session.token == null
        User.count() == 1
        User.deleteAll(User.list())
    }

    void "test register username cannot be the same as password"() {
        given:
        controller.request.method = 'POST'
        controller.params.sign_up = "Sign Up"
        controller.params.username = "lalala"
        controller.params.password = "lalala"
        controller.session.token = null
        when:
        controller.login()
        then:
        controller.response.status == 200
        //controller.response.json.message == "Username cannot be the same as password!"
        controller.session.token == null
    }

    void "test register insecure username"() {
        given:
        controller.request.method = 'POST'
        controller.params.sign_up = "Sign Up"
        controller.params.username = "short"
        controller.params.password = "lololo"
        controller.session.token = null
        when:
        controller.login()
        then:
        controller.response.status == 200
        //controller.response.json.message == "Insecure username!"
        controller.session.token == null
    }

    void "test register insecure username 2"() {
        given:
        controller.request.method = 'POST'
        controller.params.sign_up = "Sign Up"
        controller.params.username = "sh1rt__"
        controller.params.password = "lololo"
        controller.session.token = null
        when:
        controller.login()
        then:
        controller.response.status == 200
        //controller.response.json.message == "Insecure username!"
        controller.session.token == null
    }

    void "test register insecure username 3"() {
        given:
        controller.request.method = 'POST'
        controller.params.sign_up = "Sign Up"
        controller.params.username = "1sh1rt2"
        controller.params.password = "lololo"
        controller.session.token = null
        when:
        controller.login()
        then:
        controller.response.status == 200
        //controller.response.json.message == "Insecure username!"
        controller.session.token == null
    }

    void "test register insecure password 1"() {
        given:
        controller.request.method = 'POST'
        controller.params.sign_up = "Sign Up"
        controller.params.username = "pepepe"
        controller.params.password = "short"
        controller.session.token = null
        when:
        controller.login()
        then:
        controller.response.status == 200
        //controller.response.json.message == "Insecure password!"
        controller.session.token == null
    }

    void "test register insecure password 2"() {
        given:
        controller.request.method = 'POST'
        controller.params.sign_up = "Sign Up"
        controller.params.username = "pepepe"
        controller.params.password = "sho_rte"
        controller.session.token = null
        when:
        controller.login()
        then:
        controller.response.status == 200
        //controller.response.json.message == "Insecure password!"
        controller.session.token == null
    }

    void "test register insecure password 3"() {
        given:
        controller.request.method = 'POST'
        controller.params.sign_up = "Sign Up"
        controller.params.username = "pepepe"
        controller.params.password = "shO_rte"
        controller.session.token = null
        when:
        controller.login()
        then:
        controller.response.status == 200
        //controller.response.json.message == "Insecure password!"
        controller.session.token == null
    }

    void "test register fail"() {
        given:
        controller.request.method = 'POST'
        controller.params.sign_up = "Sign Up"
        controller.params.username = "pepepe"
        controller.params.password = "Mar1eto*"
        controller.session.token = null
        controller.loginService.metaClass.saveInstance{ _ ->
            return false
        }
        when:
        controller.login()
        then:
        controller.response.status == 200
        //controller.response.json.message == "Oops! Something went wrong..."
        controller.session.token == null
        User.count() == 0
    }

    void "test register ok"() {
        given:
        controller.request.method = 'POST'
        controller.params.sign_up = "Sign Up"
        controller.params.username = "pepepe"
        controller.params.password = "Mar1eto*"
        controller.session.token = null
        controller.loginService.metaClass.saveInstance{ def instance ->
            return instance.save(flush:true)
        }
        when:
        controller.login()
        then:
        controller.response.status == 200
        //controller.response.json.message == "Sign up successful!"
        controller.session.token == null
        User.count() == 1
        User.deleteAll(User.list())
    }
}
