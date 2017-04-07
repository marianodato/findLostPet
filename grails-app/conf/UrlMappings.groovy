class UrlMappings {

    static mappings = {

        "/"{
            controller = "home"
            action = [GET: "index"]
        }

        "/login"{
            controller = "login"
            action = [GET:"index", POST: "login"]
        }

        "/logout"{
            controller = "home"
            action = [POST: "logout"]
        }

        "/ping" {
            controller = "ping"
            action = [GET: "index"]
        }

        "500"(controller: "error", action: "handleError")
        "/**"(controller: "error", action: "notFound")
    }
}
