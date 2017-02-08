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
            <h1>Your Order Has Been Received</h1>
            <h2>Thank you for your purchase!</h2>
            <p>Your order number is: ${orderNumber}. You can view your orders or continue shopping for more books.</p>
            <g:link action="displayOrders" style="text-decoration: none;">
                <button type="button" class="btn btn-primary">
                    View Orders <span class="glyphicon glyphicons-list-alt"></span>
                </button>
            </g:link>
            <g:link url="${request.getHeader('/')}">
                <button type="button" class="btn btn-default">
                    Continue Shopping <span class="glyphicon glyphicon-shopping-cart"></span>
                </button>
            </g:link>
        </div>
    </div>
</div>