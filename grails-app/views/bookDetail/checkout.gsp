<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="bookstore-cart-layout" />
    <title>Checkout</title>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <h3 class="col-lg-offset-4 col-xs-offset-3 col-sm-offset-4">Shipping Address</h3>
        <div class="col-md-4 col-xs-1"></div>
        <div class="col-md-4 col-xs-10">
            <g:form class="form-horizontal" id="customerDetails" action="saveCustomerDetails" controller="bookDetail" >
                <fieldset>
                    <div class="form-group">
                        <!-- First Name -->
                        <label class="control-label"  for="firstName">First name</label>
                        <div class="controls">
                            <g:textField type="text" id="firstName" name="firstName" required="" placeholder="" class="form-control" value="${customerDetails.firstName}" />
                            <p class="help-block">Please enter your first name</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <!-- Last Name -->
                        <label class="control-label"  for="lastName">Last name</label>
                        <div class="controls">
                            <g:textField type="text" id="lastName" name="lastName" required="" placeholder="" class="form-control" value="${customerDetails.lastName}" />
                            <p class="help-block">Please enter your last name</p>
                        </div>
                    </div>
                    <g:if test="${customerDetails.address != null && customerDetails.phoneNumber != null }">
                        <g:hiddenField name="addressValue" value="${address = customerDetails.address}"/>
                        <g:hiddenField name="phoneNumberValue" value="${phoneNumber = customerDetails.phoneNumber}"/>
                    </g:if>
                    <g:else>
                        <g:hiddenField name="addressValue" value="${address = ""}"/>
                        <g:hiddenField name="phoneNumberValue" value="${phoneNumber = ""}"/>
                    </g:else>
                    <div class="form-group">
                        <!-- Address -->
                        <label class="control-label"  for="address">Address</label>
                        <div class="controls">
                            <g:textArea id="address" name="address" required="" placeholder="Type your address here" class="form-control" rows="5" value="${address}" />
                            <p class="help-block">Please enter your residential address</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <!-- Phone number -->
                        <label class="control-label"  for="phoneNumber">Phone number</label>
                        <div class="controls">
                            <g:textField id="phoneNumber" name="phoneNumber" placeholder="" required="" class="form-control" value="${phoneNumber}"/>
                            <g:if test="${flash.message}">
                                <p class="help-block" style="color: red;">${flash.message}</p>
                            </g:if>
                            <g:else>
                                <p class="help-block">Please enter your mobile number</p>
                            </g:else>
                        </div>
                    </div>

                    <div class="form-group">
                        <!-- Button -->
                        <div class="controls">
                            <g:submitButton name="submitButton" type="submit" value="Save Customer Details" class="btn btn-success"/>
                        </div>
                    </div>

                </fieldset>
            </g:form>
        </div>
        <div class="col-md-4 col-xs-1"></div>
    </div>

</div>
</body>
</html>