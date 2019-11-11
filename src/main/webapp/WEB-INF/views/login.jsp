<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login page</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
</head>
<body>
	<div id="app">
		<v-app>
			<div>
			<v-toolbar dense :dark="true">
				 <v-app-bar-nav-icon></v-app-bar-nav-icon>
	       		 <v-toolbar-title>Spuit</v-toolbar-title>
	       		 <v-spacer></v-spacer>
			        <v-btn icon>
			          <v-icon>mdi-magnify</v-icon>
			        </v-btn>
			        <v-btn class="ma-2" outlined color="white" href="/user/login">Sign-in</v-btn> 
					<v-btn class="ma-2" outlined color="white" href="/user/regist">Sign-up</v-btn>
			</v-toolbar>
			</div>
			
			<v-card width="500" height="400">
				<!-- form action="/user/login" method="POST">
					<input name="id" type="text"/><br>
					<input name="pw" type="password"/><br>
					<input type="submit"/>
				</form-->
				<v-card-title>Sign in</v-card-title>
				<v-card-subtitle>welcome to SPUIT</v-card-subtitle>
				
				<v-form method="POST" action="/user/login">
					<v-text-field v-model="id" label="id" :type="text" required></v-text-field>
					
					<v-text-field v-model="pw" label="password" required :type="'Password'"
								  hint="At least 8 characters" ></v-text-field>

					<v-btn v-on:click="requestLogin">Done</v-btn>
				</v-form>
			</v-card>
			
			<v-bottom-navigation absolute="true" :dark="true" fixed="true">
		      <v-btn value="news">
		        <span>Load new</span>
		        <v-icon>mdi-clock-fast</v-icon>
		      </v-btn>
		  
		      <v-btn value="favorites">
		        <span>Favorites</span>
		        <v-icon>mdi-heart</v-icon>
		      </v-btn>
		  
		      <v-btn value="settings">
		        <span>Settings</span>
		        <v-icon>mdi-settings</v-icon>
		      </v-btn>
		    </v-bottom-navigation>
		</v-app>
	</div>
	
<script src="//code.jquery.com/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
	new Vue({
	    el: '#app',
	    vuetify: new Vuetify(),
	    data: {
			id: '',
			pw: '',
	    },
	    methods: {
	    	requestLogin : function() {
	    		axios.post('/api/login', {id:'test0173', pw:'1234'})
	    		.then((res => {
	    			if(res.data === 1){
	    				alert('성공')
	    			}
	    			else{
	    				alert('실패')	    				
	    			}
	    		}))
	    	}
	    
	    },
	    computed: {
	  	  
	    },
	  })
</script>
</body>


</html>