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
	
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
  	<link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
 	<link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
	
  	<!-- meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui"-->
</head>
<body>
	<div id="app">
		<!-- top bar -->
	
		<!-- comtent -->
		<div id="chatBox" ref="chatBox"></div>
		<form>
			<!-- input type="text" id="message" autocomplete="off"/>
			<button @click.prevent="ChatProp">send</button-->
			<v-text-field v-model="text" label="Send Message"></v-text-field>
			<v-btn @click="ChatProp" outlined color="pink">Send</v-btn>		
		</form>
		
		<!-- bottom bar -->
	</div>	
</body>

<script>
	new Vue({
		el: '#app',
		vuetify: new Vuetify(),
		data: {
			messages: [],
			text: "",
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
				//sock.send($("#message").val())
				//$("#message").val('').focus()
				sock.send(this.text)
				this.text = ""
			}
		}
	})

</script>
</html>
