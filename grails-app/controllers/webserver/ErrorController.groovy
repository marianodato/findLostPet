package webserver

import org.codehaus.groovy.grails.web.errors.GrailsWrappedRuntimeException

class ErrorController {

    def sessionService

    def handleError() {

        def exception = request.exception

        if (exception instanceof GrailsWrappedRuntimeException) {
            while (exception instanceof GrailsWrappedRuntimeException) {
                exception = exception.cause
            }
        }

        log.error("500 " + exception.message)
        log.error("Cause: " + exception.cause)

        response.status = 500
        render (view:"/error/index", model:[exception:exception])
        return
    }

    def notFound() {

        def user = sessionService.getUser(session.token)
        def model = [:]

        if (!user) {
            model.logged = false
        } else {
            log.info("User_id: " + user.id)
            model.logged = true
            model.username = user.username
        }

        log.error("404")
        response.status = 404
        render (view:"/error/not_found", model:model)
        return
    }
}