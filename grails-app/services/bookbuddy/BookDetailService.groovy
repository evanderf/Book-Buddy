package bookbuddy

import grails.transaction.Transactional

@Transactional
class BookDetailService {

    def getAllBooks(){
        BookDetail.findAll()
    }
    
    List getBooksBasedOnCategory(categoryId){
        (categoryId == 1)? BookDetail.findAllWhere(bookCategory: "Fiction") : (categoryId == 2)? BookDetail.findAllWhere(bookCategory: "Programming") : (categoryId == 3)? BookDetail.findAllWhere(bookCategory: "Biography") : BookDetail.list()
    }

    List sortBookByPrice(priceSelectorId){
        (priceSelectorId == 1)? BookDetail.list(sort: 'bookPrice', order: 'asc') : BookDetail.list(sort: 'bookPrice', order: 'desc')
    }

    List searchBook(searchQuery){
        BookDetail.where {
            bookTitle =~ "%$searchQuery%" || authorOfBook =~ "%$searchQuery%" || bookPublisher =~ "%$searchQuery%" || bookCategory =~ "%$searchQuery%" || isbnOfBook =~ "$searchQuery" || bookDescription =~ "%$searchQuery%"
        }.list()
    }

    BookDetail getFullBookDetails(bookId){
        BookDetail.get(bookId)
    }

    def addToCart(bookId,userId){
        BookDetail book = getBook(bookId)
        CartItem cartItem = new CartItem(quantity: 1, bookDetail: book).save()
        def cart = getCart(userId)
        if(cart){
            cart.addToCartItem(cartItem)
            cart.save()
        }else{
            new Cart(cartItem: cartItem, user: userId).save()
        }
    }

    BookDetail getBook(bookId){
        BookDetail.get(bookId)
    }

    CartItem getCartItem(bookId){
        CartItem.get(bookId)
    }

    Cart getCart(userId){
        Cart.where { user == User.get(userId)}.get()
    }

    CustomerDetail getCustomerDetail(userId){
        CustomerDetail.where { user == User.get(userId)}.get()
    }

    Boolean bookIsInCart(bookId, Long userId){
        BookDetail bookItem = getBook(bookId)
        def cart=getUserDetailFromCart(userId)
        if(cart == null){
            return false
        }else{
            return cart.cartItem.bookDetail.contains(bookItem)
        }
    }

    void updateQuantity(bookId,quantity) {
        CartItem cartItem = getCartItem(bookId)
        (quantity <= 0) ? (cartItem.quantity = 1) : (cartItem.quantity = quantity)
        cartItem.save()
    }

    void deleteFromCart(bookId,userId){
        CartItem cartItem = getCartItem(bookId)
        def cart = getUserDetailFromCart(userId)
        if (cart.cartItem.size() == 1){
            cart.removeFromCartItem(cartItem)
            cartItem.delete()
            cart.delete()
        }else{
            cart.removeFromCartItem(cartItem)
            cartItem.delete()
            cart.save()
        }
    }

    Cart getAllCartItems(userId){
        getUserDetailFromCart(userId)
    }

    Cart getUserDetailFromCart(userId){
        Cart.where { user == User.get(userId)}.get()
    }

    User getUser(userId){
        User.get(userId)
    }

    def registerUser(username,password,email,firstName,lastName,userRole){
        def newUser = new User(username: username, password: password,email: email).save()
        UserRole.create(newUser,userRole)
        new CustomerDetail(firstName: firstName, lastName: lastName, address: null, phoneNumber: null, user: newUser).save()
    }

    CustomerDetail saveCustomerDetails(firstName,lastName,address,phoneNumber,userId){
        CustomerDetail customerDetails = getCustomerDetail(userId)
        customerDetails.firstName = firstName
        customerDetails.lastName = lastName
        customerDetails.address = address
        customerDetails.phoneNumber = phoneNumber
        customerDetails.save()
        customerDetails
    }

    def confirmOrder(userId){
        Cart cart = getCart(userId)
        String orderIdString = generateOrderNumber(userId)
        cart.cartItem.each {
            def storeOrderLine = new OrderLine(bookDetail: it.bookDetail,quantity: it.quantity,totalAmount: it.bookDetail.bookPrice * it.quantity).save()
            def finalOrder = SalesOrder.where { orderId == orderIdString }.get()
            if(finalOrder != null){
                finalOrder.addToOrderLineList(storeOrderLine)
                finalOrder.save()
            }else{
                new SalesOrder(orderLineList: storeOrderLine,orderId: orderIdString,dateOfOrder: new Date(), user: User.get(userId) ).save()
            }
        }
        cart.delete()
        return orderIdString
    }

    String generateOrderNumber(userId){
        def date = new Date().format('yyyyMMddss-Ms')
        return "OD${date}-${userId}"
    }

    List displayOrders(userId){
        def displayOrders = SalesOrder.where { user == User.get(userId) }.list().reverse()
        return displayOrders
    }

    def customerHasReviewedBook(user,bookId){
        BookDetail bookDetails = getBook(bookId)
        CustomerDetail customerDetails = getCustomerDetail(user)
        return CustomerReview.findAll {
            bookDetail == bookDetails && customerDetail == customerDetails
        }
    }

    def addCustomerReview(user,bookId,reviewText){
        BookDetail bookDetail = getBook(bookId)
        CustomerDetail customerDetail = getCustomerDetail(user)
        new CustomerReview(bookDetail: bookDetail,customerDetail: customerDetail,reviewText: reviewText).save()
    }

    List displayReviews(bookId){
        def bookDetail = getBook(bookId)
        def allReviews = CustomerReview.where {
            bookDetail == bookDetail
        }.findAll()
        return allReviews
    }

    def serviceMethod() {

    }
}
