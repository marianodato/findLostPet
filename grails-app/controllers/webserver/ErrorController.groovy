package webserver

import org.codehaus.groovy.grails.web.errors.GrailsWrappedRuntimeException

class ErrorController {

    def sessionService
    def notificationService

    def handleError() {

        try{

            def exception = request.exception

            def user = sessionService.getUser(session.token)
            def model = [:]

            if (!user) {
                model.logged = false
            } else {
                log.info("User_id: " + user.id)
                model.logged = true
                model.username = user.username
                model.pending = notificationService.needToNotify(user)
            }

            if (exception instanceof GrailsWrappedRuntimeException) {
                while (exception instanceof GrailsWrappedRuntimeException) {
                    exception = exception.cause
                }
            }

            log.error("500 " + exception.message)
            log.error("Cause: " + exception.cause)
            model.exception = exception

            response.status = 500
            render (view:"/error/index",  model:model)

        }catch(Exception e)
        {
            response.status = 500
            render (view:"/error/index")
        }
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
            model.pending = notificationService.needToNotify(user)
        }

        log.error("404")
        response.status = 404
        render (view:"/error/not_found", model:model)
        return
    }
}