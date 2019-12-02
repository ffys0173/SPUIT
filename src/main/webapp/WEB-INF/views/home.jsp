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
<div id="app" ref="window">
	<v-app>
		<div>
			<v-toolbar dense :dark="true">
	       		 <v-toolbar-title><a href="/" style="text-decoration: none; color: white">Project SPUIT</a></v-toolbar-title>
	       		 <v-spacer></v-spacer>
			        <v-btn icon @click.stop="dialog = true">
			          <v-icon>mdi-magnify</v-icon>
			        </v-btn>
			        <template v-if="login">
			        ${sessionInfo.name}님 반갑습니다.
			        	<v-btn class="ma-2" outlined color="white" href="/user/mypage">My Page</v-btn>
						<v-btn class="ma-2" outlined color="white" @click="requestLogout">Log-out</v-btn>
			        </template>
			        <template v-else>
						<v-btn class="ma-2" outlined color="white" href="/user/login">Log-in</v-btn>
				        <v-btn class="ma-2" outlined color="white" href="/user/regist">sign-up</v-btn>
					</template>
			</v-toolbar>
		</div>
		
		<v-container id="contents" class="mt-6">
			<v-row no-gutters>
				<v-col cols="5">
					<v-card class="article" flat>
						<v-card-title class="headline font-weight-bold py-0">Recent</v-card-title>
						<v-card class="mx-auto" :href="thread.articleUrl" tile flat v-for="thread in ListofThread">
							<v-list-item three-line>
							<v-img :src="thread.articleThumbnail" class="my-6 me-6" max-width="200" max-height="200"></v-img>
							<v-list-item-content>
								<v-list-item-title class="text-truncate title mb-1">{{thread.articleTitle}}</v-list-item-title>
								<v-list-item-subtitle>{{thread.articleContent}}</v-list-item-subtitle>
							</v-list-item-content>
						</v-card>
					</v-card>
				</v-col>
				<v-col cols="5">
					<v-card class="article" flat>
						<v-card-title class="headline font-weight-bold py-0">Recommend for you</v-card-title>
						<v-card class="mx-auto" :href="thread.articleUrl" tile flat v-for="thread in ListofThread">
							<v-list-item three-line>
							<v-img :src="thread.articleThumbnail" class="my-6 me-6" max-width="200" max-height="200"></v-img>
							<v-list-item-content>
								<v-list-item-title class="title mb-1">{{thread.articleTitle}}</v-list-item-title>
								<v-list-item-subtitle>{{thread.articleContent}}</v-list-item-subtitle>
							</v-list-item-content>
						</v-card>
					</v-card>
				</v-col>	
				<v-col cols="1">
					<iframe id="chatBox" src="/chat" frameborder="0" width="330" height="600" marginwidth="0" marginheight="0"></iframe>
				</v-col>
			</v-row>
		</v-container>
			
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
	
		<!-- 키워드 검색창   -->
		<v-dialog v-model="dialog" max-width="400px">
			<v-card style="padding: 20px;">
				<v-card-title>Enter Search Keyword : </v-card-title>
				<v-text-field label="Search word">...Keyword</v-text-field>
				<v-btn color="primary" @click="dialog = true">Search</v-btn>
			</v-card>
		</v-dialog>
	</v-app>
</div>
</body>
<script>
new Vue({
	el: '#app',
	vuetify: new Vuetify(),
	data: {
		login: ${login},
		ListofThread: null,
		dialog: false
	},
	methods: {
		requestLogout : function() {
			axios.get('/api/user/logout')
	    	.then(((res) => {
	    		if(res.data === 1){
	    			window.location.href = '/'
	    		}
	    	}))
	    },
	    fixChatBox(){
	    	if(window.scrollY >= 47){
		    	document.getElementById("chatBox").setAttribute("style", "position: fixed; top:30px")    		
	    	}
	    	else{
	    		document.getElementById("chatBox").setAttribute("style", "position: relative;")
	    	}
	    }
	},
	mounted() {
    	axios.get('/api/thread/get')
    	.then((res) => {
    		this.ListofThread = res.data
    	})
	},
	created: function() {
		window.addEventListener('scroll', this.fixChatBox)
	},
	destroyed: function() {
		window.removeEventListener('scroll', this.fixChatBox)
	}
})
</script>
</html>
