package bookbuddy

import java.text.SimpleDateFormat

class SalesOrder {

    List<OrderLine> orderLineList
    String orderId
    Date dateOfOrder
    User user

    static hasMany = [orderLineList : OrderLine]

    static constraints = {
    }
}
