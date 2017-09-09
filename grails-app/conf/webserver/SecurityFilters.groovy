package webserver

import grails.util.Environment

class SecurityFilters {

    def filters = {
        switchToHttps(uri: "/**") {
            before = {
                if (!request.isSecure() && !Environment.isDevelopmentMode()) {
                    def url = "https://" + request.serverName + request.forwardURI + (request.queryString ? "?" + request.queryString : "")
                    redirect(url: url, permanent: true)
                    return false
                }
            }
        }
    }
}
