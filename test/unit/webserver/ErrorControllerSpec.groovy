package webserver

import grails.test.mixin.TestFor
import org.apache.log4j.Level
import org.apache.log4j.LogManager
import spock.lang.Specification

@TestFor(ErrorController)
class ErrorControllerSpec extends Specification {

    void setup(){
        org.apache.log4j.BasicConfigurator.configure();
        LogManager.getRootLogger().setLevel(Level.INFO);
    }

    void "test 404 not found"() {
        given:
        request.forwardURI = "/test/404"

        when:
        controller.notFound()

        then:
        response.status == 404
        response.json == ["cause": [], "status": 404, "error": "not_found", "message": "Resource /test/404 not found."]
    }

    void "test 500 internal error"() {
        given:
        request.exception = new Exception("Exception")

        when:
        controller.handleError()

        then:
        response.status == 500
        response.json == ["cause": [], "status": 500, "error": "internal_error", "message": "Oops! Something went wrong..."]
    }
}