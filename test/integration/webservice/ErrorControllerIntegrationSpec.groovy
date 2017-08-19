package webservice

import grails.test.spock.IntegrationSpec
import org.apache.log4j.Level
import org.apache.log4j.LogManager
import spock.lang.Shared
import webserver.ErrorController

class ErrorControllerIntegrationSpec extends IntegrationSpec{

    @Shared
    ErrorController controller = new ErrorController()

    void setup() {
        org.apache.log4j.BasicConfigurator.configure();
        LogManager.getRootLogger().setLevel(Level.INFO);
    }

    void "test notFound"() {
        given:
        controller.request.method = 'GET'
        when:
        controller.notFound()
        then:
        controller.response.status == 404
    }

    void "test handleError"() {
        given:
        controller.request.method = 'GET'
        controller.request.exception = new Exception("Exception")
        when:
        controller.handleError()
        then:
        controller.response.status == 500
    }

}
