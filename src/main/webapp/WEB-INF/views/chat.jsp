<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>chating</title>
	<meta charset="UTF-8"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<style>
	body{
	
	}
	#app{
	width: 300px;
	height: 500px;
	max-height: 500px;
	background-color: yellow;
	display: table;
	}
	form{
	margin: 0;
	}
	#chatBox{
	width: 100%;
	height: 100%;
	display: table-row;
	overflow-y: auto;
	}
	#inputBox{
	display: table-row;
	}
	</style>
</head>
<body>
	<div id="app">
		<div id="chatBox" ref="chatBox">
		</div>
		<div id="inputBox">
			<form>
				<input type="text" id="message" autocomplete="off"/>
				<button @click.prevent="ChatProp">send</button>		
			</form>
		</div>
	</div>	
</body>
<script>
	new Vue({
		el: '#app',
		vuetify: new Vuetify(),
		data: {
			sock: null
		},
		mounted: function() {
			sock = new SockJS("/echo");
			sock.onmessage = function(e){
				$("#chatBox").append(e.data + "<br/>")
			}
			sock.onclose = function(){
				$("#chatBox").append("연결 종료")
			}
		},
		methods: {
			ChatProp() {
				sock.send($("#message").val())
				$("#message").val('').focus()
			}
			
		}
	})
		
</script>
</html>