<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>chatting</title>
	<meta charset="UTF-8"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	
	
  	<!-- meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui"-->

</head>
<body>
	<div id="app">
		<div id="chatBox" ref="chatBox">
		
		</div>
		<div id="inputBox">
			<form id=inputs>
				<input type="text" ref="message" id="message" autocomplete="off"/>
				<button id="send" @click.prevent="ChatProp">send</button>
			</form>
		</div>
	</div>	
</body>

<script>
	new Vue({
		el: '#app',
		vuetify: new Vuetify(),
		data: {
			messages: null,
			text: "",
			sock: null
		},
		mounted: function() {
			sock = new SockJS("/echo")
			messages = new Array()
			var tempId = ''
			sock.onmessage = function(e){

				$("#chatBox").append('<p class="other">'+e.data+"</p>")
				messages.push(e.data)
				$("#chatBox").scrollTop($("#chatBox")[0].scrollHeight);
			}
			sock.onclose = function(){
				$("#chatBox").append("Disconnected")
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

<style>
 #app { background: gray; width: 315px; height: 500px;}
 #chatBox {padding-left: 5px; width: 315x; height: 500px; overflow-y: auto;}
 #send {
 background-color: #81BEF7; /* Green */
  border: none;
  color: white;
  padding: 10px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  }
 #message {width: 220px;}
 
 .other {color: white}
</style>
</html>
