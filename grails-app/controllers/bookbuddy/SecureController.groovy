package bookbuddy

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_USER'])
class SecureController {

    def index() {

        String username = getPrincipal().username
        render ("Welome ${username}")
    }
}
