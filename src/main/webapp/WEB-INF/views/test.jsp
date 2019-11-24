<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- %@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"% -->
<html>
<head>
	<title>test</title>
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
 		<v-app>
 		<div>
			<v-toolbar dense :dark="true">
				 <v-app-bar-nav-icon></v-app-bar-nav-icon>
	       		 <v-toolbar-title><a href="/" style="text-decoration: none; color: white">Spuit</a></v-toolbar-title>
	       		 <v-spacer></v-spacer>
			        <v-btn icon>
			          <v-icon>mdi-magnify</v-icon>
			        </v-btn>
			        <template v-if="login">
			        	<v-btn class="ma-2" outlined color="white" href="/user/mypage">My Page</v-btn>
						<v-btn class="ma-2" outlined color="white" @click="requestLogout">Log-out</v-btn>
			        </template>
			        <template v-else>
						<v-btn class="ma-2" outlined color="white" href="/user/login">Log-in</v-btn>
				        <v-btn class="ma-2" outlined color="white" href="/user/regist">sign-up</v-btn>
					</template>
			</v-toolbar>
		</div>
		

			<div id="chatBox" ref="chatBox"></div>
			<v-sheet color="orange lighten-2">{{msg}}</v-sheet>
			<form>
				<!-- input type="text" id="message" autocomplete="off"/>
				<button @click.prevent="ChatProp">send</button-->
				<v-text-field v-model="text" ref="message" label="Send Message"></v-text-field>
				<v-btn @click.prevent="ChatProp" outlined color="pink">Send</v-btn>		
			</form>

		
		<v-bottom-navigation absolute="true" :dark="true" fixed="true">
		      <v-btn value="recent">
		        <span>Load new</span>
		        <v-icon>mdi-clock-fast</v-icon>
		      </v-btn>
		  
		      <v-btn value="favorites">
		        <span>Favorites</span>
		        <v-icon>mdi-heart</v-icon>
		      </v-btn>
		  
		      <v-btn value="nearby">
		        <span>Settings</span>
		        <v-icon>mdi-settings</v-icon>
		      </v-btn>
		      <v-btn value="Chatting" href="/chat">
		      <span>Chatting</span>
		      <v-icon>mdi-comment-text-outline</v-icon>
		      </v-btn>
		    </v-bottom-navigation>
 		</v-app>
 	</div>
</body>

<script>

new Vue({
	el: '#app',
	vuetify: new Vuetify(),
	data: {
		login: ${login},
		messages: null, //[]로 바꾸고 ChatProp에서 this.messages.push(this.text) 는 정상작동 test
		msg: '',
		text: "",
		sock: null
	},
	mounted: function() {
		sock = new SockJS("/echo")
		messages = new Array()
		sock.onmessage = function(e){
			$("#chatBox").append(e.data + "<br/>")
			messages.push(e.data)
			console.log(messages)
		}
		testar.push(test)
		sock.onclose = function(){
			$("#chatBox").append("연결 종료");
		}
	},
	methods: {
		ChatProp() {
			//sock.send($("#message").val())
			//$("#message").val('').focus()
			sock.send(this.$refs.message.value)
			this.$refs.message.value = ""
		}
	}
})

</script>
</html>