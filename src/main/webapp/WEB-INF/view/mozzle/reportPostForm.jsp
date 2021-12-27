<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div {
    display: block;
}
body {
    -webkit-text-size-adjust: none;
}
.report_type .tit_report2 {
    padding-top: 19px;
}

dl, li, menu, ol, ul {
    list-style: none;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

li {
    display: list-item;
    text-align: -webkit-match-parent;
}





</style>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
</head>
<body>
<section class="section_popup">
<div class="container">
                <header class="popup_head">
                    <h2 class="tit_popup">신고하기</h2>
                </header>
                <div class="popup_body">
                    <strong class="tit_report tit_report2"><span>신고사유 선택</span></strong>
                    <ul class="list-group">
                        <li id="C" class="list-group-item">
                            <div class="choice_wrap">
                                <input type="radio" name="inpReasonChoice" class="inp_radio" checked="checked" value="욕설, 비방, 차별, 혐오">
                                <label for="inpChoice1" class="lab_radio"><span class="ico_report ico_check"></span><span>욕설, 비방, 차별, 혐오</span><span class="ico_report ico_arr"></span></label>
                            </div>
                            <div class="wrap_additional">
                                <ul class="desc_additional">
                                    <li>욕설을 사용하여 타인을 비방하거나 모욕하는 행위</li>
                                    <li>지역, 장애, 성별 등을 차별하거나 혐오감을 조장하는 행위</li>
                                    <li>타인의 감정을 상하게 하거나 불쾌감을 유발하는 행위</li>
                                </ul>
                            </div>
                        </li>
                        <li id="A" class="list-group-item">
                            <div class="choice_wrap">
                                <input type="radio" name="inpReasonChoice" class="inp_radio" value="홍보, 영리목적">
                                <label for="inpChoice1" class="lab_radio"><span class="ico_report ico_check"></span><span>홍보, 영리목적</span><span class="ico_report ico_arr"></span></label>
                            </div>
                            <div class="wrap_additional">
                                <ul class="desc_additional">
                                    <li>상업적・홍보・영리 목적으로 서비스를 이용하는 행위</li>
                                    <li>상업적・홍보・영리 목적으로 계정을 생성・이용하는 행위</li>
                                </ul>
                            </div>
                        </li>
                        <li id="U" class="list-group-item">
                            <div class="choice_wrap">
                                <input type="radio" name="inpReasonChoice" class="inp_radio" value="불법 정보">
                                <label for="inpChoice1" class="lab_radio"><span class="ico_report ico_check"></span><span>불법 정보</span><span class="ico_report ico_arr"></span></label>
                            </div>
                            <div class="wrap_additional">
                                <ul class="desc_additional">
                                    <li>불법적인 사행성・도박 사이트를 홍보하는 행위</li>
                                    <li>불법 제품을 판매하거나 홍보하는 행위</li>
                                    <li>범법 행위에 대한 정보를 제공하는 행위</li>
                                </ul>
                            </div>
                        </li>
                        <li id="O" class="list-group-item">
                            <div class="choice_wrap">
                                <input type="radio" name="inpReasonChoice" class="inp_radio" value="음란, 청소년 유해">
                                <label for="inpChoice1" class="lab_radio"><span class="ico_report ico_check"></span><span>음란, 청소년 유해</span><span class="ico_report ico_arr"></span></label>
                            </div>
                            <div class="wrap_additional">
                                <ul class="desc_additional">
                                    <li>과도한 신체 노출이나 음란한 행위를 묘사하는 행위</li>
                                    <li>성적 수치심이나 불쾌감을 유발할 수 있는 내용을 게시하는 행위</li>
                                    <li>성매매 관련 정보를 공유하는 행위</li>
                                </ul>
                            </div>
                        </li>
                        <li id="P" class="list-group-item">
                            <div class="choice_wrap">
                                <input type="radio" name="inpReasonChoice" class="inp_radio" value="개인 정보 노출, 유포, 거래">
                                <label for="inpChoice1" class="lab_radio"><span class="ico_report ico_check"></span><span>개인 정보 노출, 유포, 거래</span><span class="ico_report ico_arr"></span></label>
                            </div>
                            <div class="wrap_additional">
                                <ul class="desc_additional">
                                    <li>타인의 개인정보를 탈취・유포・거래하려는 행위</li>
                                    <li>계정을 타인에게 판매・양도・대여하는 행위</li>
                                    <li>타인의 개인정보를 다수에게 공개된 게시판 등에 노출하는 행위</li>
                                </ul>
                            </div>
                        </li>
                        <li id="E" class="list-group-item">
                            <div class="choice_wrap">
                                <input type="radio" name="inpReasonChoice" class="inp_radio" value="도배, 스팸">
                                <label for="inpChoice1" class="lab_radio"><span class="ico_report ico_check"></span><span>도배, 스팸</span><span class="ico_report ico_arr"></span></label>
                            </div>
                            <div class="wrap_additional">
                                <ul class="desc_additional">
                                    <li>동일한 내용을 반복적으로 등록하는 행위</li>
                                    <li>시스템의 취약점을 이용하여 유해한 내용을 게시하는 행위</li>
                                </ul>
                            </div>
                        </li>
                        
                    </ul>
					<span class="txt_guide">※ 허위신고일 경우, 신고자의 서비스 활동이 제한될 수 있으니 유의하시어 신중하게 신고해 주세요.</span>
                    <div class="btn_group">
                        
                        <button type="button" class="btn btn-outline-primary" id="reportPostBtn" onclick="test()">확인</button>
                        <button type="button" class="btn btn-primary"><span class="inner_btn" onclick="self.close();">취소</span></button>
                    </div>
                    
                </div>
                </div>
            </section>
            <% String post_id = request.getParameter("post_id");  %>
            <script type="text/javascript">
          
            
            function test() {
            	var checkChoice = $("input[name=inpReasonChoice]:checked").val();
            	console.log(checkChoice);
        		//ajax처리해서 보내기
        		$.ajax({
        			type:"get",
        			url:"./reportPost.do?post_id="+<%=post_id%>,
        			data:"reason="+checkChoice,
        			success:function(msg){
        				if(msg.count=="true"){
        					alert("신고접수가 성공적으로 처리되었습니다.");
        					window.close();
        					
        				} else{
        					swal("실패","신고접수를 실패하였습니다.");
        					alert("신고접수를 실패하였습니다.");
        					window.close();
        				}
        				},
        			error : function(){
        					alert("문제가 발생하였습니다.");
        				}
        			
        		})    
        		
        		
            }
            
            </script>
</body>
</html>