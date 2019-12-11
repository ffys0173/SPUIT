<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>registration</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
	
	<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
</head>
<body>

	<%@include file="_topbar.jsp" %>
	
	<div id="app">
		<v-app>
			<v-container class="d-flex justify-center mt-6">
				<v-card width="500" height="430" style="margin-bottom: 40px; padding: 15px">
					<v-card-title>Sign Up</v-card-title>
					<v-card-subtitle>welcome to SPUIT</v-card-subtitle>
					
					<v-form method="POST" action="/user/regist">
						<v-text-field v-model="id" label="ID" :type="text" required></v-text-field>
						
						<v-text-field v-model="pw" label="Password" required :type="'Password'"
									  hint="At least 8 characters" ></v-text-field>
									  
						<v-text-field v-model="name" label="Name" required :type="text"
									  hint="At least 1 characters" ></v-text-field>
									  
						<v-text-field v-model="email" label="E-mail" required :type="'email'"
									  hint="input your email" ></v-text-field>
	
						<v-btn  outlined color="primary" v-on:click="requestRegist">Done</v-btn>
					</v-form>	
				</v-card>
			</v-container>
			
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

</body>

<script src="/resources/scripts/topbar.js"></script>
<script>

new Vue({
    el: '#app',
    vuetify: new Vuetify({
    	theme: { dark: true }
    }),
    data: {
  	  id: "",
  	  pw: "",
  	  name: "",
  	  email: "",
  	  chips: []
    },
    methods: {
  	  requestRegist: function() {
  		  axios.post('/api/user/regist', {id: this.id, pw: this.pw, name: this.name, email: this.email})
  		  .then (((res) => {
  			  if(res.data === 1){
  				alert("성공")
				window.location.href = '/user/auth/setFavorites'
  			  }
  			  else alert("실패")
  		}))
  	  }
    },
    computed: {
  	  
    }
  }) 

  
  
</script>

</html>