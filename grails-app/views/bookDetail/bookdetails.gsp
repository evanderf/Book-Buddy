<!doctype html>
<html>
<head>
    <title><g:if env="development">Book Details</g:if><g:else>Error</g:else></title>
    <meta name="layout" content="bookstore-product-layout">
</head>
<body>
<!-- Page Content -->
<div class="container">

    <div class="row">

        <div class="col-md-3">
            <p class="lead">Search</p>
            <div class="list-group">
                <g:form action="searchBook">
                    <g:textField name="searchField" value="" />
                    <g:submitButton name="searchButton" value="search" />
                </g:form>
            </div>
            <p class="lead">See more books</p>
            <div class="list-group">
                <g:link class="list-group-item" action="getBooks" id="1" >Fiction</g:link>
                <g:link class="list-group-item" action="getBooks" id="2">Programming</g:link>
                <g:link class="list-group-item" action="getBooks" id="0" >Show All</g:link>
            </div>
        </div>

        <div class="col-md-9">
            <g:each in="${book}" var="thisBook">
            <div class="thumbnail">
                <g:img dir="images" class="img-responsive" file="${thisBook.bookCoverImage}" style="width:130px; height:200px;"/>
                <div class="caption-full">
                <div class="text-right">
                    <g:link class="btn btn-success" action="addToCart" params="[clickAction: 'addToCart']" id="${thisBook.id}">Add to Cart</g:link>
                    <g:link class="btn btn-primary" action="addToCart" params="[clickAction: 'buyNow']" id="${thisBook.id}">Buy now</g:link>
                    <g:if test="${flash.message}">
                        <div class="message" style="display: block;color: red;">${flash.message}</div>
                    </g:if>
                </div>

                <h4 class="pull-right">₹${thisBook.bookPrice}</h4>
                    <h4><a href="#">${thisBook.bookTitle}</a>
                    </h4>
                    <p><strong>Author: </strong>${thisBook.authorOfBook}<br>
                        <strong>Publisher: </strong>${thisBook.bookPublisher}<br>
                        <strong>ISBN: </strong>${thisBook.isbnOfBook}<br>
                    </p>
                    <p>${thisBook.bookDescription}</p>
                </div>
                <div class="ratings">
                    <p class="pull-right">${reviews.size()} Reviews</p>
                </div>
            </div>
            </g:each>
            <div class="well">
                <div class="row">
                    <g:form action="addReview" id="${book.id}" name="reviews" >
                        <div class="col-md-12">
                            <g:textArea class="form-control" name="message" rows="5" placeholder="Write a review for this book"></g:textArea>
                            <g:if test="${flash.error}">
                                <p style="color: red;">${flash.error}</p>
                            </g:if>
                        </div>
                        <div class="col-md-4">
                            <br/>
                            <g:submitButton name="addReview" value="Leave a Review" class="btn btn-success"/>
                        </div>
                    </g:form>
                </div>
                <g:each in="${reviews}">
                    <hr>

                    <div class="row">
                        <div class="col-md-12">
                            <strong>${it.customerDetail.user.username}</strong>
                            <p>${it.reviewText}</p>
                        </div>
                    </div>
                </g:each>
            </div>

        </div>
    </div>


</div>
</body>
</html>