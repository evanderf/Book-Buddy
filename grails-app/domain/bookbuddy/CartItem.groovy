package bookbuddy

class CartItem {
    BookDetail bookDetail
    Integer quantity

    static belongsTo = Cart

    static constraints = {
    }
}
