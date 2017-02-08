<!doctype html>
<html>
<head>
    <title><g:if env="development">My Orders | Book Buddy</g:if><g:else>Error</g:else></title>
    <meta name="layout" content="bookstore-cart-layout">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <g:if test="${orderDetail == null }">
                <p><h1 style="text-align: center">You do not have any orders</h1></p>
            </g:if>
            <g:else>
                <p><h2>My orders</h2></p>
                <g:hiddenField name="total" value="${subtotal=0}"/>
                <g:hiddenField name="total" value="${total=0}"/>
                <g:each in="${orderDetail}" var="order">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                    <g:each in="${order.orderLineList}">
                            <tr>
                                <td class="col-sm-8 col-md-6">
                                <div class="media">
                                    <div class="media-body">
                                        <h4 class="media-heading"><a href="#">${it.bookDetail.bookTitle}</a></h4>
                                        <h5 class="media-heading"> by <a href="#">${it.bookDetail.authorOfBook}</a></h5>
                                    </div>
                                </div>
                                </td>
                                <td class="col-sm-1 col-md-1" style="text-align: center">${it.quantity}</td>
                                <td class="col-sm-1 col-md-1 text-center">₹${it.bookDetail.bookPrice}</td>
                                <g:hiddenField name="calc" value="${subtotal = it.bookDetail.bookPrice * it.quantity}"/>
                                <g:hiddenField name="calc" value="${total= total + subtotal}"/>
                                <td class="col-sm-1 col-md-1 text-center">₹${it.bookDetail.bookPrice * it.quantity}</td>
                            </tr>
                        </g:each>
                        <tr>
                            <td class="col-sm-8 col-md-6">Order Number:<strong> ${order.orderId}</strong>
                                <br>Date of Order: <strong>${order.dateOfOrder.format('dd-MM-yyyy')}</strong>
                            </td>
                            <td></td>
                            <td class="col-sm-1 col-md-1 text-center"><strong>Total</strong></td>
                            <td class="col-sm-1 col-md-1 text-center"><strong>₹${total}</strong></td>
                            <g:hiddenField name="total" value="${total=0}"/>
                        </tr>
                        </tbody>
                    </table>
                    </g:each>
            </g:else>

        </div>
    </div>
</div>
</body>
</html>