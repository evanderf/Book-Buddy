package bookbuddy

class BookDetail {

    String bookTitle
    String authorOfBook
    String isbnOfBook
    String bookPublisher
    BigDecimal bookPrice
    String bookCategory
    String bookDescription
    String bookCoverImage

    static constraints = {

        bookTitle()
        authorOfBook()
        isbnOfBook()
        bookPublisher()
        bookPrice()
        bookCategory()
        bookDescription()
        bookCoverImage()

    }
}
