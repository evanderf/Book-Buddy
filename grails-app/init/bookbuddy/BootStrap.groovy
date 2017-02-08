package bookbuddy

class BootStrap {

    def init = { servletContext ->
        //Spring Security

        def adminRole = new Role(authority: 'ROLE_ADMIN').save()
        //def userRole = new Role(authority: 'ROLE_USER').save()
        //def userRole = new Role(authority: 'ROLE_CUSTOMER').save()

        def testAdminUser = new User(username: 'evander', password: 'password',email: "evander@email.com").save()
        //def testUser = new User(username: 'johnwick', password: 'password',email: "johnwick@email.com").save()

        UserRole.create testAdminUser, adminRole
        //UserRole.create (testUser, userRole)

        UserRole.withSession {
            it.flush()
            it.clear()
        }

        assert User.count() == 1
        assert Role.count() == 1
        assert UserRole.count() == 1

        //Books initialized below

        BookDetail bookDetail=new BookDetail(
                bookTitle: "Groovy Recipes",
                authorOfBook: "Scott Davis",
                isbnOfBook: "81-8404-638",
                bookPublisher: "Shroff Publishers",
                bookPrice: 325,
                bookCategory: "Programming",
                bookDescription: "If you're a busy Java professional who needs quick solutions to everyday problems then Groovy is for you",
                bookCoverImage: "groovy-recipes.jpg").save()
        
        bookDetail=new BookDetail(
                bookTitle: "Practices of an Agile Developer",
                authorOfBook: "Venkat",
                isbnOfBook: "81-8404-640",
                bookPublisher: "Shroff Publishers",
                bookPrice: 325,
                bookCategory: "Programming",
                bookDescription: "If you're a busy Java professional who needs quick solutions to everyday problems then Groovy is for you",
                bookCoverImage: "practices-of-an-agile-developer.jpg").save()
        
        bookDetail=new BookDetail(
                bookTitle: "Let Us C",
                authorOfBook: "Balaguruswamy",
                isbnOfBook: "81-8404-645",
                bookPublisher: "Tata Publishers",
                bookPrice: 325,
                bookCategory: "Programming",
                bookDescription: "If you're a busy Java professional who needs quick solutions to everyday problems then Groovy is for you",
                bookCoverImage: "let-us-c.jpg").save()
            
        bookDetail=new BookDetail(
                bookTitle: "Fifth Mountain",
                authorOfBook: "Paulo Cohelho",
                isbnOfBook: "81-8404-649",
                bookPublisher: "Gill Publishers",
                bookPrice: 160,
                bookCategory: "Fiction",
                bookDescription: "It's about finding your inner self",
                bookCoverImage: "fifth-mountain.jpg").save()
        
        bookDetail=new BookDetail(
                bookTitle: "The Alchemist",
                authorOfBook: "Paulo Cohelho",
                isbnOfBook: "81-8404-650",
                bookPublisher: "Gill Publishers",
                bookPrice: 160,
                bookCategory: "Fiction",
                bookDescription: "A shepard boy from rural Spain discovers his treasure",
                bookCoverImage: "the-alchemist.jpg" ).save()

        bookDetail=new BookDetail(
                bookTitle: "Steve Jobs",
                authorOfBook: "Walter Issacson",
                isbnOfBook: "1451648537",
                bookPublisher: "Simon & Schuster",
                bookPrice: 100,
                bookCategory: "Biography",
                bookDescription: "Based on more than forty interviews with Jobs conducted over two years—as well as interviews with more than a hundred family",
                bookCoverImage: "steve-jobs.jpg").save()
    }



    def destroy = {
    }
}
