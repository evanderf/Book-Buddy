<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Checkout</title>
</head>
<body>

<g:form id="customerDetails" action="saveCustomerDetails" controller="bookDetail" >

    First name: <g:textField name="firstName" placeholder="John"/><br>
    Last name: <g:textField name="lastName" placeholder="Doe"/><br>
    Address: <g:textArea name="address" placeholder="Type your address here"/><br>
    Phone number: <g:textField name="phoneNumber" placeholder="9922123456"/><br>
    <g:submitButton name="submitButton" type="submit" value="Save Customer Details"/>
</g:form>

</body>
</html>