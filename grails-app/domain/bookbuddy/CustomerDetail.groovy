package bookbuddy

class CustomerDetail {

    User user
    String firstName
    String lastName
    String address
    String phoneNumber


    static constraints = {

        firstName()
        lastName()
        address nullable: true
        phoneNumber nullable: true
    }
}
