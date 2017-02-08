package bookbuddy

class OrderLine {

    BookDetail bookDetail
    Integer quantity
    BigDecimal totalAmount

    static belongsTo = SalesOrder

    static constraints = {
    }
}
