<!doctype html>
<html>
<head>
    <title><g:if env="development">Book Details</g:if><g:else>Error</g:else></title>
    <meta name="layout" content="bookstore">
</head>
<body>
<div class="container" style="width: 100% ">
    <div class="body" style="width:50%; margin: 0 auto">
        <g:each in="${book}" var="thisBook">
            <g:img dir="images" file="${thisBook.bookCoverImage}" width="130" height="200"/><br>
            <p><b>${thisBook.bookTitle}</b></p><br>
            <p><b>Author:</b> ${thisBook.authorOfBook}</p><br>
            <p><b>Publisher</b> ${thisBook.bookPublisher}</p><br>
            <p><b>Price:</b> Rs.${thisBook.bookPrice}</p><br>
            <p><b>ISBN:</b> ${thisBook.isbnOfBook}</p><br>
            <p><b>Category:</b> ${thisBook.bookCategory}</p><br>
            <p><b>Description:</b> ${thisBook.bookDescription}</p><br>

            <g:link action="addToCart" id="${thisBook.id}">Add to Cart</g:link>&nbsp;
            <g:link action="#" id="${thisBook.id}">Buy</g:link>
        </g:each>


    </div>
</div>
</body>
</html>