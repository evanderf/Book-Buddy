<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="bookstore-cart-layout" />
    <title>Register</title>
</head>
<body>
<h3 class="col-lg-offset-4 col-xs-offset-4">Registration</h3>
<div class="col-md-4 col-xs-1"></div>
<div class="col-md-4 col-xs-10">
    <g:form id="registerUser" class="form-horizontal" action="registerUser" controller="bookDetail" >
        <fieldset>
            <div class="form-group">
                <!-- First Name -->
                <label class="control-label"  for="firstName">First name</label>
                <div class="controls">
                    <g:textField type="text" id="firstName" name="firstName" required="" placeholder="" class="form-control" />
                    <p class="help-block">Please enter your first name</p>
                </div>
            </div>

            <div class="form-group">
                <!-- Last Name -->
                <label class="control-label"  for="lastName">Last name</label>
                <div class="controls">
                    <g:textField type="text" id="lastName" name="lastName" required="" placeholder="" class="form-control" />
                    <p class="help-block">Please enter your last name</p>
                </div>
            </div>

            <div class="form-group">
                <!-- E-mail -->
                <label class="control-label" for="email">E-mail</label>
                <div class="controls">
                    <g:textField name="email" id="email" placeholder="" required="" class="form-control" />
                    <p class="help-block">Please provide your E-mail</p>
                </div>
            </div>

            <div class="form-group">
                <!-- Username -->
                <label class="control-label"  for="username">Username</label>
                <div class="controls">
                    <g:textField id="username" name="username" placeholder="" required="" class="form-control" />
                    <p class="help-block">Username can contain any letters or numbers, without spaces</p>
                </div>
            </div>

            <div class="form-group">
                <!-- Password-->
                <label class="control-label" for="password">Password</label>
                <div class="controls">
                    <g:field type="password" id="password" name="password" placeholder="" required="" class="form-control" />
                    <p class="help-block">Password should be at least 4 characters</p>
                </div>
            </div>

            <div class="form-group">
                <!-- Button -->
                <div class="controls">
                    <g:submitButton name="submitButton" class="btn btn-success" type="submit" value="Register"/>
                </div>
            </div>

        </fieldset>
    </g:form>
</div>
<div class="col-md-4 col-xs-1"></div>

</body>
</html>