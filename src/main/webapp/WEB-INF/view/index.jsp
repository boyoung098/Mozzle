<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
        />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="swiper-bundle.min.css" />
        <script src="swiper-bundle.min.js"></script>
        <style>
            /* Remove the navbar's default margin-bottom and rounded borders */
            .navbar {
                margin-bottom: 0;
                border-radius: 0;
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
            .card {
                width: 90%;
                height: 100%;
            }

            /* Add a gray background color and some padding to the footer */
            footer {
                background-color: #f2f2f2;
                padding: 25px;
            }

            .carousel-inner img {
                width: 100%; /* Set width to 100% */
                margin: auto;
                min-height: 200px;
            }

            .footer-bs {
                background-color: #3c3d41;
                padding: 60px 40px;
                color: rgba(255, 255, 255, 1);
                margin-bottom: 20px;
                border-bottom-right-radius: 6px;
                border-top-left-radius: 0px;
                border-bottom-left-radius: 6px;
            }
            .footer-bs .footer-brand,
            .footer-bs .footer-nav,
            .footer-bs .footer-social,
            .footer-bs .footer-ns {
                padding: 10px 25px;
            }
            .footer-bs .footer-nav,
            .footer-bs .footer-social,
            .footer-bs .footer-ns {
                border-color: transparent;
            }
            .footer-bs .footer-brand h2 {
                margin: 0px 0px 10px;
            }
            .footer-bs .footer-brand p {
                font-size: 12px;
                color: rgba(255, 255, 255, 0.7);
            }

            .footer-bs .footer-nav ul.pages {
                list-style: none;
                padding: 0px;
            }
            .footer-bs .footer-nav ul.pages li {
                padding: 5px 0px;
            }
            .footer-bs .footer-nav ul.pages a {
                color: rgba(255, 255, 255, 1);
                font-weight: bold;
                text-transform: uppercase;
            }
            .footer-bs .footer-nav ul.pages a:hover {
                color: rgba(255, 255, 255, 0.8);
                text-decoration: none;
            }
            .footer-bs .footer-nav h4 {
                font-size: 11px;
                text-transform: uppercase;
                letter-spacing: 3px;
                margin-bottom: 10px;
            }

            .footer-bs .footer-nav ul.list {
                list-style: none;
                padding: 0px;
            }
            .footer-bs .footer-nav ul.list li {
                padding: 5px 0px;
            }
            .footer-bs .footer-nav ul.list a {
                color: rgba(255, 255, 255, 0.8);
            }
            .footer-bs .footer-nav ul.list a:hover {
                color: rgba(255, 255, 255, 0.6);
                text-decoration: none;
            }

            .footer-bs .footer-social ul {
                list-style: none;
                padding: 0px;
            }
            .footer-bs .footer-social h4 {
                font-size: 11px;
                text-transform: uppercase;
                letter-spacing: 3px;
            }
            .footer-bs .footer-social li {
                padding: 5px 4px;
            }
            .footer-bs .footer-social a {
                color: rgba(255, 255, 255, 1);
            }
            .footer-bs .footer-social a:hover {
                color: rgba(255, 255, 255, 0.8);
                text-decoration: none;
            }

            .footer-bs .footer-ns h4 {
                font-size: 11px;
                text-transform: uppercase;
                letter-spacing: 3px;
                margin-bottom: 10px;
            }
            .footer-bs .footer-ns p {
                font-size: 12px;
                color: rgba(255, 255, 255, 0.7);
            }
            #footer-ul li {
                display: inline-block;
            }

            @media (min-width: 768px) {
                .footer-bs .footer-nav,
                .footer-bs .footer-social,
                .footer-bs .footer-ns {
                    border-left: solid 1px rgba(255, 255, 255, 0.1);
                }
            }
            /* Hide the carousel text when the screen is less than 600 pixels wide */
            @media (max-width: 600px) {
                .carousel-caption {
                    display: none;
                }
            }
            @media (min-width: 768px) {
                .navbar-nav.navbar-center {
                    position: absolute;
                    left: 50%;
                    transform: translatex(-50%);
                }
            }
        </style>
        <script>
            window.onload = function () {
                var swiper_h = new Swiper(".main-bg-img", {
                    slidesPerView: 1,
                    spaceBetween: 50,
                    loop: false,
                });
                var swiper_n = new Swiper(".sw-new-mozzle", {
                    slidesPerView: 3,
                    spaceBetween: 50,
                    loop: false,
                });
                var swiper_n = new Swiper(".sw-new-mozzle2", {
                    slidesPerView: 3,
                    spaceBetween: 50,
                    loop: false,
                });
            };
        </script>
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
                    <a class="navbar-brand" href="#"><img src="logo.png" /></a>
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
                            <a href="#"
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
        <section id="main-bg" class="container mt-3">
            <div class="swiper-container main-bg-img">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <img src="bn.png" />
                    </div>
                    <div class="swiper-slide">
                        <img src="bn.png" />
                    </div>
                </div>
            </div>
        </section>

        <section class="container mt-3" id="new-mozzle">
            <h4>새로 생긴 모즐!</h4>
            <div class="swiper-container sw-new-mozzle">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="#"
                            ><img class="card" src="test.jpg" alt="" /><br />
                            <b>로아 하는 로아인 모여!</b>
                            <p>리더 : 로아로아&nbsp;&nbsp;멤버 : 101</p>
                            <p>
                                혼자하기 어려운 레이드, 던전 같이 해요! 옾톡,
                                디코 필수입니다!!
                            </p>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#"
                            ><img class="card" src="test.jpg" alt="" /><br />
                            <b>로아 하는 로아인 모여!</b>
                            <p>리더 : 로아로아&nbsp;&nbsp;멤버 : 101</p>
                            <p>
                                혼자하기 어려운 레이드, 던전 같이 해요! 옾톡,
                                디코 필수입니다!!
                            </p>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#"
                            ><img class="card" src="test.jpg" alt="" /><br />
                            <b>로아 하는 로아인 모여!</b>
                            <p>리더 : 로아로아&nbsp;&nbsp;멤버 : 101</p>
                            <p>
                                혼자하기 어려운 레이드, 던전 같이 해요! 옾톡,
                                디코 필수입니다!!
                            </p>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#"
                            ><img class="card" src="test.jpg" alt="" /><br />
                            <b>로아 하는 로아인 모여!</b>
                            <p>리더 : 로아로아&nbsp;&nbsp;멤버 : 101</p>
                            <p>
                                혼자하기 어려운 레이드, 던전 같이 해요! 옾톡,
                                디코 필수입니다!!
                            </p></a
                        >
                    </div>
                </div>
            </div>
        </section>
        <br />
        <section class="container mt-3" id="new-mozzle2">
            <h4>새로 생긴 모즐!</h4>
            <div class="swiper-container sw-new-mozzle2">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="#"
                            ><img class="card" src="test.jpg" alt="" /><br />
                            <b>로아 하는 로아인 모여!</b>
                            <p>리더 : 로아로아&nbsp;&nbsp;멤버 : 101</p>
                            <p>
                                혼자하기 어려운 레이드, 던전 같이 해요! 옾톡,
                                디코 필수입니다!!
                            </p>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#"
                            ><img class="card" src="test.jpg" alt="" /><br />
                            <b>로아 하는 로아인 모여!</b>
                            <p>리더 : 로아로아&nbsp;&nbsp;멤버 : 101</p>
                            <p>
                                혼자하기 어려운 레이드, 던전 같이 해요! 옾톡,
                                디코 필수입니다!!
                            </p>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#"
                            ><img class="card" src="test.jpg" alt="" /><br />
                            <b>로아 하는 로아인 모여!</b>
                            <p>리더 : 로아로아&nbsp;&nbsp;멤버 : 101</p>
                            <p>
                                혼자하기 어려운 레이드, 던전 같이 해요! 옾톡,
                                디코 필수입니다!!
                            </p>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#"
                            ><img class="card" src="test.jpg" alt="" /><br />
                            <b>로아 하는 로아인 모여!</b>
                            <p>리더 : 로아로아&nbsp;&nbsp;멤버 : 101</p>
                            <p>
                                혼자하기 어려운 레이드, 던전 같이 해요! 옾톡,
                                디코 필수입니다!!
                            </p></a
                        >
                    </div>
                </div>
            </div>
        </section>
        <section class="container mt-3"><img src="bn2.png" /></section>
        <br /><br />

        <footer class="footer-bs">
            <div class="row">
                <div class="col-md-3 footer-brand animated fadeInLeft">
                    <img src="f_logo.png" />
                </div>
                <div class="col-md-6 footer-nav animated fadeInUp">
                    <div>
                        <p>이용약관 | 개인정보처리방침</p>
                        <p>
                            (주)모즐 | 08505 서울시 금천구 가산디지털2로 115,
                            509호(가산동, 대륭테크노타운3차) | 대표 : 모즐
                        </p>
                        <p>| 사업자등록번호 : 123-12-12345 | help@mozzle.com</p>
                    </div>
                </div>
                <div class="col-md-3 footer-social animated fadeInDown">
                    <ul id="footer-ul">
                        <li><img src="face.png" alt="" /></li>
                        <li><img src="tw.png" alt="" /></li>
                        <li><img src="in.png" alt="" /></li>
                        <li><img src="ut.png" alt="" /></li>
                    </ul>
                </div>
            </div>
        </footer>
    </body>
</html>
