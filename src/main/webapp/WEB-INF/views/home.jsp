<%@ page pageEncoding = "utf-8"%>
<html>
<head>
	<title>Home</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
  	<link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
 	<link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  	
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
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
		
			<div id="contents">
				<%-- <P>  The time on the server is ${serverTime}. </P>
				<p> userInfo : ${sessionInfo.id} </p> --%>
				
				<!-- 로그인 아이디 : ffys0173 save0173 test0173 중 하나<br>
				비밀번호 : 1111<br> -->
				
			</div>
			<div>
				<iframe src="/chat" frameborder="0" width="330" height="600" marginwidth="0" marginheight="0"></iframe>
				<%-- <%@ include file="chat.jsp" %> --%>
			</div>
			
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
		<%--= session.getAttribute("login") --%>
		<%-- int a = 10;
		out.println(a); --%>
	</v-app>
</div>
</body>

<script>
    new Vue({
      el: '#app',
      vuetify: new Vuetify(),
      data: {
    	  login: ${login}
      },
      methods: {
    	  requestLogout : function() {
	    		axios.get('/api/logout')
	    		.then(((res) => {
	    			if(res.data === 1){
	    				window.location.href = '/'
	    			}
	    		}))
	    	}
      },
      computed: {

      },
    })
</script>
<style>
#app{
/*display: inline-block;*/
}
#content{
height: 100%;
}
#chat{
}
</style>
</html>
