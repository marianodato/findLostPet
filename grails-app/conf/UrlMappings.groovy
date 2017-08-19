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

        "/info"{
            controller = "info"
            action = [GET: "index"]
        }

        "/contact"{
            controller = "contact"
            action = [GET: "index"]
        }

        "/photos"{
            controller = "photos"
            action = [GET: "index"]
        }

        "/blogs"{
            controller = "blogs"
            action = [GET: "index"]
        }

        "/blog"{
            controller = "blog"
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

        "/ping" {
            controller = "ping"
            action = [GET: "index"]
        }

        "500"(controller: "error", action: "handleError")
        "/**"(controller: "error", action: "notFound")
    }
}
