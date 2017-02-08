<!doctype html>
<html>
<head>
    <title><g:if env="development">Book Details</g:if><g:else>Error</g:else></title>
    <meta name="layout" content="main">
</head>
<body>

<table>
    <tr>
        <th> </th>
        <th>Title</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Sub-total</th>
        <th>Actions</th>
    </tr>
<g:each in="${cart}" var="thisBook">
    <tr>
        <td><g:img dir="images" file="${thisBook.cartItemReference.bookDetail.bookCoverImage}" width="90" height="100"/></td>
        <td><b>${thisBook.cartItemReference.bookDetail.bookTitle}</b></td>
        <td><g:form action="updateQuantity" id="${thisBook.cartItemReference.id}">
            <g:textField name="quantity" value="${thisBook.cartItemReference.quantity}"/>
            <g:submitButton name="updateButton" value="save" action="updateQuantity"/>
        </g:form></td>
        <td>Rs.${thisBook.cartItemReference.bookDetail.bookPrice}</td>
        <td>Rs.${thisBook.cartItemReference.bookDetail.bookPrice * thisBook.cartItemReference.quantity}</td>
        <td><g:link action="deleteFromCart" id="${thisBook.cartItemReference.id}">Remove?</g:link></td>
    </tr>
</g:each>
</table>
<g:link action="checkout" >Place Order</g:link>


</body>
</html>