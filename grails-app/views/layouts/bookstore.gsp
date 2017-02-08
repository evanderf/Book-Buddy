<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Book Buddy</title>

    <!-- Bootstrap Core CSS -->
    <asset:stylesheet src="bootstrap.css" />
    <!--link href="http://localhost:8080/bookstore/css/bootstrap.min.css" rel="stylesheet"-->

    <!-- Custom CSS -->
    <asset:stylesheet src="shop-homepage.css" />
    <!--link href="http://localhost:8080/bookstore/css/shop-homepage.css" rel="stylesheet"-->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <g:link action="index" class="navbar-brand" style="color:white;">Book Buddy</g:link>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <g:link action="getAllCartItems" controller="bookDetail"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></g:link>
                </li>
                <sec:ifNotLoggedIn>
                    <li>
                        <g:link action="displayRegisterPage" controller="bookDetail">Register</g:link>
                    </li>
                    <li>
                        <g:link controller='login' action='auth'>Login</g:link>
                    </li>
                </sec:ifNotLoggedIn>
                <sec:ifLoggedIn>
                    <li class="dropdown">
                        <g:link class="dropdown-toggle" data-toggle="dropdown" action="index">Welcome <sec:username/> <span class="caret"></span></g:link>
                        <ul class="dropdown-menu">
                            <li><g:link action="displayOrders">My orders</g:link></li>
                            <li><g:link controller='logout'>Logout</g:link></li>
                        </ul>
                    </li>
                </sec:ifLoggedIn>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>

<!-- Page Content -->
<div class="container">

    <div class="row">

        <div class="col-md-3">
            <p class="lead">Search</p>
            <div class="list-group">
                <g:form action="searchBook">
                    <g:textField name="searchField" value="" />
                    <g:submitButton name="searchButton" value="search" />
                </g:form>
            </div>

            <p class="lead">Categories</p>
            <div class="list-group">
                <g:link class="list-group-item" action="getBooks" id="1" >Fiction</g:link>
                <g:link class="list-group-item" action="getBooks" id="2">Programming</g:link>
                <g:link class="list-group-item" action="getBooks" id="3">Biography</g:link>
                <g:link class="list-group-item" action="getBooks" id="0" >Show All</g:link>
            </div>

            <p class="lead">Sort by</p>
            <div class="list-group">
                <g:form action="priceSort" >
                    <g:select name="priceSelect"
                        noSelection="${['null':'Select']}"
                        from="${[1:"Price: Low to High",2 : "Price: High to Low"]}"
                        optionValue="value"
                        optionKey="key">
                    </g:select>
                    <g:submitButton name="sort" value="Sort" />
                </g:form>
            </div>

        </div>

        <div class="col-md-9">

            <div class="row carousel-holder">

                <div class="col-md-12">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="item active">
                                <g:img dir="images" file="carousel-1.jpg" style="height:200px" class="slide-image"/>
                            </div>
                            <div class="item">
                                <g:img dir="images" file="carousel-2.jpg" style="height:200px" class="slide-image"/>
                            </div>
                            <div class="item">
                                <g:img dir="images" file="carousel-3.jpg" style="height:200px" class="slide-image"/>
                            </div>
                        </div>
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                </div>

            </div>

            <div class="row">
                <g:layoutBody/>
                <!--
                <div class="col-sm-4 col-lg-4 col-md-4">
                    <div class="thumbnail">
                        <img src="http://placehold.it/320x150" alt="">
                        <div class="caption">
                            <h4 class="pull-right">$24.99</h4>
                            <h4><a href="#">First Product</a>
                            </h4>
                            <p>See more snippets like this online store item at <a target="_blank" href="http://www.bootsnipp.com">Bootsnipp - http://bootsnipp.com</a>.</p>
                        </div>
                        <div class="ratings">
                            <p class="pull-right">15 reviews</p>
                            <p>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                            </p>
                        </div>
                    </div>
                </div>
                -->
            </div>

        </div>

    </div>

</div>
<!-- /.container -->

<div class="container">

    <hr>

    <!-- Footer -->
    <footer>
        <div class="row">
            <div class="col-lg-12">
                <p>Copyright &copy; Book Buddy 2017</p>
            </div>
        </div>
    </footer>

</div>
<!-- /.container -->

<!-- jQuery -->
<asset:javascript src="jquery.js"/>

<!-- Bootstrap Core JavaScript -->
<asset:javascript src="bootstrap.css"/>

</body>

</html>