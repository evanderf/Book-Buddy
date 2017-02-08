<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Register</title>
</head>
<body>

<g:form id="registerUser" action="registerUser" controller="bookDetail" >

    First name: <g:textField name="firstName" placeholder="John" required="" /><br>
    Last name: <g:textField name="lastName" placeholder="Doe" required=""/><br>
    E-mail: <g:textField name="email" placeholder="john@email.com" required="" /><br>
    Username: <g:textField name="username" placeholder="johndoe" required="" /><br>
    Password: <g:textField name="password" placeholder="******" required="" /><br>
    <g:submitButton name="submitButton" type="submit" value="Register" required="" />
</g:form>

</body>
</html>