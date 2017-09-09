package webserver

import grails.util.Environment

class SecurityFilters {

    def filters = {
        switchToHttps(controller:'*', action:'*') {
            before = {

                log.info("isSecure: " + request.isSecure())
                log.info("isDevelopmentMode : " + Environment.isDevelopmentMode())
                log.info("serverName: " +  request.serverName)
                log.info("forwardURI: " +  request.forwardURI)
                log.info("queryString: " +  request.queryString)

                if (!request.isSecure() && !Environment.isDevelopmentMode()) {
                    def url = "https://" + request.serverName + request.forwardURI + (request.queryString ? "?" + request.queryString : "")
                    log.info("Redirect url: " +  url)
                    redirect(url: url, permanent: true)
                    return false
                }
            }
        }
    }
}
