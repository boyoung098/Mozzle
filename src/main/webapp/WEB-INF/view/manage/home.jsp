<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html>
  <head>
        <title>메인</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="./js/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="./js/script.js"></script>
        <link rel="stylesheet" href="./css/swiper-bundle.min.css" />
        <link rel="stylesheet" href="./css/style.css"/>
        <link rel="stylesheet" href="./css/common.css"/>
        <link rel="stylesheet" href="./css/popup/popup.css"/>
        <link rel="stylesheet" type="text/css" href="./css/xeicon.min.css">
        <link rel="stylesheet" type="text/css" href="./css/xeicon.css">
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
                    <a class="navbar-brand" href="index.html"><img src="./image//logo.png" /></a>
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
                            <a href="#">모즐 생성</a>
                        </li>
                        <li>
                            <button onclick="location.href='loginPage.do'">로그인하기</button>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

</body>
</html>