<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registration</title>
</head>
<body>

<form name="insert">
<input id="id" name="id" type="text"/><br>
<input id="pw" name="pw" type="password"/><br>
<input id="name" name="name" type="text"/><br>
<input id="email" name="email" type="email"/><br>
</form>

<button onclick=insert_action()>submit</button>


</body>
<script src="//code.jquery.com/jquery.js"></script>
<script type="text/javascript">
  function insert_action(){
	var mForm = document.insert; // form의 값을 가져오기 위함
   var obj = new Object(); // JSON형식으로 변환 할 오브젝트
   obj.id = mForm.id.value; // form의 값을 오브젝트에 저장
   obj.pw = mForm.pw.value;
   obj.name = mForm.name.value;
   obj.email = mForm.email.value;
    
   var json_data = JSON.stringify(obj);
    
   var request = $.ajax({
    url:"/user/regist",
    type:"POST",
    data:json_data,
    contentType:"application/json",
    success: function(data) {
        alert("성공");
    }
   });
  }
   
</script>

</html>