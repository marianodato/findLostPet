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
                    log.error("Error: Error saving to User table: " + it + " .User: " + user)
                }
            }
        }
    }

    def destroy = {
    }
}