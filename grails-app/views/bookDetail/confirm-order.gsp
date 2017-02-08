<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="bookstore-cart-layout" />
    <title>Confirm Order</title>
</head>
<body>
    <div class="col-md-10 col-md-offset-1">
        <g:hiddenField name="total" value="${total=0}"/>
        <strong>Shipping to:</strong>
        <g:each in="${customerDetails}" var="thisCustomer">
            <p><strong>Name: </strong>${thisCustomer.firstName} ${thisCustomer.lastName}</p>
            <p><strong>Address: </strong>${thisCustomer.address}</p>
            <p><strong>Phone Number: </strong>${thisCustomer.phoneNumber}</p>
            <p><strong>Email: </strong>${thisCustomer.user.email}</p>
        </g:each>
        <div class="table-responsive">
            <br>
            <table class="table table-bordered">
                <thead>
                <th>
                    Book Title
                </th>
                <th>
                    Author
                </th>
                <th>
                    Quantity
                </th>
                <th>
                    Price
                </th>
                <th>
                    Total
                </th>
                </thead>
                <tbody>
                <g:each in="${cartContents.cartItem}">
                    <tr>
                        <td>${it.bookDetail.bookTitle}</td>
                        <td>${it.bookDetail.authorOfBook}</td>
                        <td>${it.quantity}</td>
                        <td>₹${it.bookDetail.bookPrice}</td>
                        <td>₹${it.bookDetail.bookPrice * it.quantity}</td>
                        <g:hiddenField name="calc" value="${total+=it.bookDetail.bookPrice * it.quantity}"/>
                    </tr>
                </g:each>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><strong>Total</strong></td>
                    <td><strong>₹${total}</strong></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><g:link class="btn btn-success" action="confirmOrder" id="${cartContents.cartItem}">Place Order</g:link></td>
                </tr>
                </tbody>
            </table>
        </div>

    </div>
</body>
</html>