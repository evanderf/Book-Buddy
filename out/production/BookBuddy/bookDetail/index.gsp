<!doctype html>
<html>
<head>
    <title><g:if env="development">Displaying all books</g:if><g:else>Error</g:else></title>
    <meta name="layout" content="bookstore">
</head>
<body>
            <g:each in="${book}" var="thisBook">

                <div class="col-sm-4 col-lg-4 col-md-4">
                    <div class="thumbnail">
                        <g:img dir="images" file="${thisBook.bookCoverImage}" width="320" height="100"/>
                        <div class="caption">
                            <h4 class="pull-right">₹${thisBook.bookPrice}</h4>
                            <h4><g:link action="fullBookDetails" id="${thisBook.id}" >${thisBook.bookTitle}</g:link></h4>
                            <p><b>Author</b>: ${thisBook.authorOfBook}<br><b>Category</b>: ${thisBook.bookCategory}</p>
                        </div>
                    </div>
                </div>
            </g:each>
</body>
</html>