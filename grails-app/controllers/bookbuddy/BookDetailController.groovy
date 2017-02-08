package bookbuddy

import grails.plugin.springsecurity.annotation.Secured

import java.util.regex.Matcher
import java.util.regex.Pattern

@Secured('permitAll')
class BookDetailController {

    BookDetailService bookDetailService
    def userRole = new Role(authority: 'ROLE_CUSTOMER').save()

    def displayRegisterPage(){
        if (!isLoggedIn()){
            render (view: 'registration')
        }else{
            redirect action: 'index'
        }
    }

    def registerUser(){
        if (!isLoggedIn()){
            String username = params.username
            String password = params.password
            String email = params.email
            String firstName = params.firstName
            String lastName = params.lastName

            bookDetailService.registerUser(username,password,email,firstName,lastName,userRole)
            redirect controller: 'login', action: 'auth'
        }else{
            redirect action: 'index'
        }
    }

    def index() {
        List book=bookDetailService.getAllBooks()
        render (view: 'index', model: [book:book])
    }

    def getBooks(){
        Integer categoryId = Integer.parseInt(params.id)
        List booksByCategory = bookDetailService.getBooksBasedOnCategory(categoryId)
        render (view: 'index', model : [book:booksByCategory])
    }

    def priceSort(){
        Integer priceSelectorId = Integer.parseInt(params.priceSelect)
        List booksSortedByPrice = bookDetailService.sortBookByPrice(priceSelectorId)
        render (view: "index", model : [book:booksSortedByPrice])
    }

    def searchBook(){
        String searchQuery = params.searchField
        List booksMatchingSearch = bookDetailService.searchBook(searchQuery)
        render (view: "index", model: [book :booksMatchingSearch])
    }

    def fullBookDetails(){
        String bookId = params.id
        BookDetail showFullBookDetails = bookDetailService.getFullBookDetails(bookId)
        def showReviews = bookDetailService.displayReviews(bookId)
        render (view: "bookdetails", model: [book:showFullBookDetails,reviews:showReviews])
    }

    @Secured('ROLE_CUSTOMER')
    def addToCart(){
        def user = getPrincipal()
        Integer bookId = Integer.parseInt(params.id)
        def checkBookExistsInCart = bookDetailService.bookIsInCart(bookId,user.id)
        if(checkBookExistsInCart) {
            flash.message = "This book is already in your cart"
            fullBookDetails()
        }else if (params.clickAction == "addToCart"){
            flash.message = "Book added to your cart"
            bookDetailService.addToCart(bookId,user.id)
            fullBookDetails()
        }else{
            bookDetailService.addToCart(bookId,user.id)
            redirect action: 'getAllCartItems'
        }
    }

    @Secured('ROLE_CUSTOMER')
    def updateQuantity(){
        String bookId = params.id
        Integer quantity
        try {
            quantity = Integer.parseInt(params.quantity)
        }catch (NumberFormatException){
            quantity = 1
        }finally{
            bookDetailService.updateQuantity(bookId,quantity)
            redirect action: 'getAllCartItems'
        }
    }

    @Secured('ROLE_CUSTOMER')
    def deleteFromCart() {
        String bookId = params.id
        def user = getPrincipal()
        bookDetailService.deleteFromCart(bookId,user.id)
        redirect action: 'getAllCartItems'
    }

    @Secured('ROLE_CUSTOMER')
    def getAllCartItems(){
        def user = getPrincipal()
        def showCartItems = bookDetailService.getAllCartItems(user.id)

        render (view: "cart", model: [cart: showCartItems])
    }

    @Secured('ROLE_CUSTOMER')
    def checkout(){
        def user = getPrincipal()
        def customerDetails = bookDetailService.getCustomerDetail(user.id)
        render (view: 'checkout', model: [customerDetails: customerDetails])
    }

    @Secured('ROLE_CUSTOMER')
    def saveCustomerDetails(){
        def userId = getPrincipal()
        String firstName = params.firstName
        String lastName = params.lastName
        String address = params.address
        String phoneNumber = params.phoneNumber
        Pattern indianMobileNumberRegex = ~/^((\+){0,1}91(\s){0,1}(\-){0,1}(\s){0,1}){0,1}9[0-9](\s){0,1}(\-){0,1}(\s){0,1}[1-9]{1}[0-9]{7}$/
        Matcher matcher = (phoneNumber =~ indianMobileNumberRegex)
        if(!matcher.matches()){
            flash.message = "Please enter a valid mobile number"
            checkout()
        }else{
            def savedCustomerDetails = bookDetailService.saveCustomerDetails(firstName,lastName,address,phoneNumber,userId.id)
            def cartContents = bookDetailService.getAllCartItems(userId.id)
            render (view: 'confirm-order', model: [customerDetails : savedCustomerDetails, cartContents: cartContents])
        }

    }

    @Secured('ROLE_CUSTOMER')
    def confirmOrder(){
        def userId = getPrincipal()
        def confirmOrder = bookDetailService.confirmOrder(userId.id)
        render view:'order-confirmed',model : [ orderNumber : confirmOrder ]
    }

    @Secured('ROLE_CUSTOMER')
    def displayOrders(){
        def user = getPrincipal()
        List orderDetails = bookDetailService.displayOrders(user.id)
        render view:'my-orders', model:[orderDetail: orderDetails]
    }

    @Secured('ROLE_CUSTOMER')
    def addReview(){
        def user = getPrincipal()
        Integer bookId = Integer.parseInt(params.id)
        String reviewText = params.message
        List reviewExists = bookDetailService.customerHasReviewedBook(user.id,bookId)
        if(reviewExists == []){
            bookDetailService.addCustomerReview(user.id,bookId,reviewText)
            fullBookDetails()
        }else{
            flash.error = "You have already reviewed this book"
            fullBookDetails()
        }

    }
}
