package webserver

import grails.converters.JSON

class ErrorController {

    def handleError() {
        def resp = [:]
        resp.message = "Oops! Something went wrong..."
        resp.error = "internal_error"
        resp.status = 500
        resp.cause = []
        log.error("500 " + resp.message)
        response.status = resp.status
        render resp as JSON
        return
    }

    def notFound() {
        def resp = [:]
        resp.message = "Resource $request.forwardURI not found."
        resp.error = "not_found"
        resp.status = 404
        resp.cause = []
        log.error("404 " + resp.message)
        response.status = resp.status
        render resp as JSON
        return
    }
}