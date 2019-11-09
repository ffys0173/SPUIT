<%@ page pageEncoding = "utf-8"%>
<html>
<head>
	<title>Home</title>
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
			<div id="contents">
			<h1>Hello world!</h1>
			<P>  The time on the server is ${serverTime}. </P>
			<p> userInfo : ${userInfo} </p>
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
		    </v-bottom-navigation>
	</v-app>
</div>

  <script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
  
  <script>
    new Vue({
      el: '#app',
      vuetify: new Vuetify(),
      data: {
    	  
      },
      method: {
    	  
      },
      computed: {
    	  
      },
    })
  </script>
</body>
</html>
