<%@ page pageEncoding = "utf-8"%>

<html>
<head>
	<title>SPUIT - 당신이 찾던 모든 뉴스</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
	
	<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.js"></script>
	
	<style>
	a {
		text-decoration: none;
	}
	.sticky {
		position: sticky;
		top: 10px;
	}
	</style>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
</head>
<body>
<div id="app" v-clock>
	<v-app>
		<v-toolbar dense :dark="true" style="max-height: 50px">
	      		 <v-toolbar-title><router-link to="/app/home" style="text-decoration: none; color: white">Project SPUIT</router-link></v-toolbar-title>
	      		 <v-spacer></v-spacer>
		        <v-btn icon @click.stop="dialog = true">
		          <v-icon>mdi-magnify</v-icon>
		        </v-btn>
		        <template v-if="login">
		        ${sessionInfo.name}님 반갑습니다.
		        <div style="width: 10px"></div>
		        	<router-link to="/app/auth/mypage"><v-btn class="ma-2" outlined color="white">My Page</v-btn></router-link>
		        	<div style="width: 10px"></div>
					<v-btn class="ma-2" outlined color="white" @click="requestLogout">sign-out</v-btn>
		        </template>
		        <template v-else>
					<v-btn class="ma-2" outlined color="white" @click="loginDialogOn">sign-in</v-btn>
					<div style="width: 10px"></div>
			        <router-link to="/app/regist"><v-btn class="ma-2" outlined color="white">sign-up</v-btn></router-link>
				</template>
		</v-toolbar>
		<v-dialog v-model="loginDialog" max-width="500">
			<v-card width="500" height="300" style="padding: 15px" dark>
				<v-card-title>Sign in</v-card-title>
				<v-card-subtitle>welcome back to SPUIT</v-card-subtitle>
				<v-form>
					<v-text-field ref="login" v-model="id" label="id" type="text"></v-text-field>
					<v-text-field v-model="pw" label="password" required :type="'Password'"
						  hint="At least 8 characters" v-on:keyup.enter="requestLogin" style="margin-bottom: 20px"></v-text-field>
					<v-spacer></v-spacer>
				<v-btn v-on:click="requestLogin">Done</v-btn>
				</v-form>
			</v-card>
		</v-dialog>
		
		<v-dialog v-model="dialog" max-width="400px">
			<v-card style="padding: 20px;" dark>
				<v-card-title>Enter Search Keyword : </v-card-title>
				<v-text-field v-model="query" label="Search word" v-on:keyup.enter="requestSearch">...Keyword</v-text-field>
				<v-btn color="primary" @click="requestSearch">Search</v-btn>
			</v-card>
		</v-dialog>
		<v-container class="mt-4">
			<v-row no-gutters>
				<v-col cols="10">
					<router-view :key="viewKey" v-on:true="ChatTrue" v-on:false="ChatFalse" v-on:move-channel="moveChannel"></router-view>
				</v-col>
				<v-col cols="2">
					<div class="sticky" v-if="chat">
						<v-btn class="mx-2" icon @click.stop="hide = true" v-if="!hide">
							<v-icon>mdi-eye-Off</v-icon>
							<span class="mx-2">채팅창 숨기기</span>
				        </v-btn>
				        <v-btn class="mx-2" icon @click.stop="hide = false" v-else>
							<v-icon>mdi-eye</v-icon>
							<span class="mx-2">채팅창 보이기</span>
				        </v-btn>
						<chat-view v-if="hide" ref="chatBox"></chat-view>
					</div>
				</v-col>
			</v-row>
		</v-container>
	</v-app>
</div>
</body>
</html>

<script src="https://unpkg.com/vue-router/dist/vue-router.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue-infinite-loading@2.4.4/dist/vue-infinite-loading.min.js"></script>

<%@include file="_home.jsp" %>
<%@include file="_chat.jsp" %>
<%@include file="_search.jsp" %>
<%@include file="_regist.jsp" %>
<%@include file="_myPage.jsp" %>
<%@include file="_setFavorites.jsp" %>
<%@include file="_article.jsp" %>

<script>
var router = new VueRouter({
	mode: 'history',
	routes: [
		{path: '/app/home', component: homeTemplate},
		{path: '/app/search', component: search},
		{path: '/app/regist', component: regist},
		{path: '/app/auth/mypage', component: mypage},
		{path: '/app/auth/setFavorites', component: setFavorites},
		{path: '/app/article', component: article}// props: (payload) => ({prop : payload})
	]
})

new Vue({
	el: '#app',
	vuetify: new Vuetify({
		theme: { dark: true }
	}),
	router: router,
	data: function () {
		return {
			login: null,
			query: null,
			dialog: false,
			id: '',
			pw: '',
			loginDialog: false,
			chat: ${chat},
			hide: true,
			viewKey: 1
		}
	},
	mounted: function () {
		axios.get('/api/user/isLogin')
		.then((res) => {
			this.login = res.data
		})
		
		var path = "${path}"
		router.push(path)
		
	},
	methods: {
		requestLogout : function() {
			axios.get('/api/user/logout')
	    	.then(((res) => {
	    		if(res.data === 1){
	    			window.location.href = '/app/home'
	    		}
	    	}))
	    },
	    requestSearch : function() {
	    	this.viewKey += 1
	    	router.push('/app/search?query=' + this.query)
	    	this.dialog = false
	    	this.query = ''
	    	ChatTrue()
	    },
	    requestLogin : function() {
    		axios.post('/api/user/login', {id: this.id, pw: this.pw})
    		.then(((res) => {
    			if(res.data === 1){
    				window.location.href = '/app/home'
    			}
    			else{
    				alert('로그인에 실패했습니다.')	    				
    			}
    		}))
    		this.id = this.pw = ''
    	},
    	loginDialogOn: function() {
    		this.loginDialog = true
    		
    	},
    	ChatFalse: function() {
    		this.chat = false
    	},
    	ChatTrue: function() {
    		this.chat = true
    	},
    	moveChannel: function(channel) {
    		this.$refs.chatBox.ChangeChannel(channel)
    	}
	}
})
</script>

