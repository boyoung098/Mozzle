<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>

        <style>
            /* Remove the navbar's default margin-bottom and rounded borders */
            .navbar {
                margin-bottom: 0;
                border-radius: 0;
            }
            .navbar-default{
            	background-color: #fffljp !important;
            }
            nav.navbar {
                height: 75px;
                border: none;
            }
            .nav-hr {
                margin: 0;
                padding: 0;
                border-bottom: 1px solid #ddd;
            }


            @media (min-width: 768px) {
                .navbar-nav.navbar-center {
                    position: absolute;
                    left: 50%;
                    transform: translatex(-50%);
                }
            }
        </style>
        
    </head>
    <body>
        <nav class="navbar navbar-default container mt-3">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button
                        type="button"
                        class="navbar-toggle"
                        data-toggle="collapse"
                        data-target="#myNavbar"
                    >
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="./"><img src="<%=request.getContextPath() %>/resources/images/logo/logo.png" /></a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-center">
                        <li>
                            <form action="#">
                                <input type="text" />
                                <input type="submit" />
                            </form>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="./loginPage.do"
                                ><span
                                    class="glyphicon glyphicon-log-in"
                                ></span>
                                Login</a
                            >
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <hr class="nav-hr" />


    </body>
</html>
