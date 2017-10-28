class UrlMappings {

    static mappings = {

        "/"{
            controller = "home"
            action = [GET: "index"]
        }

        "/home"{
            controller = "home"
            action = [GET: "index"]
        }

        "/login"{
            controller = "login"
            action = [GET:"index", POST: "login"]
        }

        "/registration"{
            controller = "registration"
            action = [GET:"index", POST: "registration"]
        }

        "/logout"{
            controller = "login"
            action = [POST: "logout"]
        }

        "/post" {
            controller = "post"
            action = [GET: "index", POST: "post"]
        }

        "/pet"{
            controller = "pet"
            action = [GET:"index", POST:"finishSearch"]
        }

        "/image"{
            controller = "image"
            action = [GET:"index"]
        }

        "/search"{
            controller = "search"
            action = [GET:"index", POST:"contact"]
        }

        "/activity"{
            controller = "activity"
            action = [GET:"index"]
        }

        "/ping" {
            controller = "ping"
            action = [GET: "index"]
        }

        "500"(controller: "error", action: "handleError")
        "/**"(controller: "error", action: "notFound")
    }
}
