<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
    </head>
    <body>
        <nav class="navbar container">
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
                <div class="collapse navbar-collapse select_bar" id="myNavbar">
                    <ul class="nav navbar-nav navbar-center">
                        <li>
                            <form action="#">
                                <div class="input-group intput-width search">
                                    <input type="text" class="form-control search-input" placeholder=" 찾으시는 모임이 있나요?"/>
                                    <span class="input-group-btn">
                                        <input type="submit" class="search-btn"/>
                                    </span>
                                </div>
                            </form>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="./loginPage.do">
                            <span class="glyphicon glyphicon-log-in"></span>Login</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <hr class="nav-hr" />


    </body>
</html>
