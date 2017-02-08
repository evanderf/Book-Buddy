<!doctype html>
<html>
<head>
    <title><g:if env="development">Book Details</g:if><g:else>Error</g:else></title>
    <meta name="layout" content="bookstore-cart-layout">
</head>
<body>

    <div class="col-lg-11 col-lg-offset-1">
            <g:if test="${cart == null}">
                <h2 class="col-md-offset-3">Your cart is Empty! <g:link url="${request.getHeader('/')}">Click here to shop</g:link></h2>
            </g:if>
            <g:else>
                <div class="table-responsive col-xs-9 col-lg-11">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>Product</th>
                            <th>Quantity</th>
                            <th class="text-center">Price</th>
                            <th class="text-center">Total</th>
                            <th> </th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:hiddenField name="total" value="${total=0}"/>
                        <g:each in="${cart.cartItem}" var="thisBook">
                            <tr>
                                <td class="col-sm-8 col-md-6">
                                    <div class="media">
                                        <a class="thumbnail pull-left" href="#"> <g:img dir="images" file="${thisBook.bookDetail.bookCoverImage}" class="media-object" style="width: 72px; height: 100px;"/></a>
                                        <div class="media-body">
                                            <h4 class="media-heading"><a href="#">${thisBook.bookDetail.bookTitle}</a></h4>
                                            <h5 class="media-heading"> by <a href="#">${thisBook.bookDetail.authorOfBook}</a></h5>
                                            <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
                                        </div>
                                    </div></td>
                            <td class="col-sm-1 col-md-1" style="text-align: center">
                                <g:form action="updateQuantity" id="${thisBook.id}" class="form-group-sm">
                                    <g:textField name="quantity" class="form-control" value="${thisBook.quantity}"/>
                                %{--<input type="email" class="form-control" id="exampleInputEmail1" value="${thisBook.cartItem.quantity}">--}%
                                    </td>
                                    <td class="col-sm-1 col-md-1 text-center"><strong>₹${thisBook.bookDetail.bookPrice}</strong></td>
                                    <td class="col-sm-1 col-md-1 text-center"><strong>₹${thisBook.bookDetail.bookPrice * thisBook.quantity}</strong></td>
                                    <g:hiddenField name="calc" value="${total+=thisBook.bookDetail.bookPrice * thisBook.quantity}"/>
                                    <td class="col-sm-1 col-md-3">
                                    <g:submitButton name="updateButton" value="save" action="updateQuantity" class="btn btn-warning"/>
                                    <g:link style="color: white; text-decoration: none;" action="deleteFromCart" id="${thisBook.id}">
                                        <button type="button" class="btn btn-danger">
                                            Remove
                                        </button></g:link>
                                </g:form>
                            </td>

                            </tr>
                        </g:each>
                        <tr>
                            <td>   </td>
                            <td>   </td>
                            <td>   </td>
                            <td><h3>Total</h3></td>
                            <td class="text-right"><h3><strong>₹${total}</strong></h3></td>
                        </tr>
                        <tr>
                            <td>   </td>
                            <td>   </td>
                            <td>   </td>
                            <td>
                                <button type="button" class="btn btn-default">
                                    <span class="glyphicon glyphicon-shopping-cart"></span><g:link url="${request.getHeader('referer')}"> Continue Shopping </g:link>
                                </button></td>
                            <td>
                                <g:link action="checkout" style="color: white; text-decoration: none;">
                                    <button type="button" class="btn btn-success">
                                        Checkout <span class="glyphicon glyphicon-play"></span>
                                    </button>
                                </g:link>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </g:else>
    </div>
</body>
</html>