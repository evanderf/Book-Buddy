package bookbuddy


class Cart {
    List<CartItem> cartItem
    User user

    static hasMany = [cartItem: CartItem]

    static mapping = { cartItem cascade: 'all-delete-orphan' }

    static constraints = {

    }
}
