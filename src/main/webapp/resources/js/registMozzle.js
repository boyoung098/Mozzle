var dataList = [];
$(document).ready(function() {
	console.log('ready');
				
	$.ajax({
		url: "./searchCategory.do",
		type: "POST",
		dataType: "JSON",
		success: function(result) {
			console.log("성공");
			var categoryList = result.cList;
			for (var i = 0; i < categoryList.length; i++) {
				var Obj = {};
				Obj.id = categoryList[i].category_code;
				Obj.text = categoryList[i].category_name;
				dataList.push(Obj);
			}	
		}
	});

	console.log(dataList);
				
	$("#category").select2({
		data : dataList,
		multiple : true
	});
			
	if($('#save_result').val() != '') {
		console.log($('#save_result').val());
				
		if($('#save_result').val() == 'true') {
			alert('모즐이 성공적으로 수정되었습니다.');
			$('#save_result').val('');
			
			location.href = "../board.do?mozzle_id=" + $('#save_info').val();
		} else {
			alert('수정을 실패했습니다.');
			$('#save_result').val('');
		} 
	}
});
		
//mozzle 이름 중복 검사
$('#mozzle_name').focusout(function() {	
	console.log(성공);
});


//load시 원래 지정된 커버 사진을 띄움
window.onload = function() {
	document.getElementById("image").src = "../resources/images/img.png";
		
	document.getElementById("img").onchange = function() {
		var reader = new FileReader();
		
		reader.onload = function(e) {
		// get loaded data and render thumbnail.
			document.getElementById("image").src = e.target.result;
		};
		
		// read the image file as a data URL.
		if(this.files != undefined && this.files[0] != null) {
			reader.readAsDataURL(this.files[0]);
		} else {
			document.getElementById("image").src = "../images/img.png";			
		}
	};
		
	function checkSubmit() {
		alert($('#submitMozzleForm').val());
	}
}
