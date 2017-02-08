<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Confirm Order</title>
</head>
<body>

    <g:each in="${customerDetails}" var="thisCustomer">
        <p>${thisCustomer.firstName} ${thisCustomer.lastName}</p>
        <p>${thisCustomer.address}</p>
        <p>${thisCustomer.phoneNumber}</p>
        <p>${thisCustomer.userReference.email}</p>
        <p>${thisCustomer.cartReference.cartItemReference.bookDetail.bookTitle.join(",")}</p>
        <p>${thisCustomer.cartReference.cartItemReference.bookDetail.authorOfBook.join(",")}</p>
        <p>${thisCustomer.cartReference.cartItemReference.bookDetail.bookPrice.join(",")}</p>
        <p>${thisCustomer.cartReference.cartItemReference.quantity.join(",")}</p>

    </g:each>


</body>
</html>