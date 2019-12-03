<%@ page pageEncoding = "utf-8"%>
<html>
<head>
<!-- 
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
  	<link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
 	<link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
	<!--script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
  	-->
</head>
<body>
<div id="bottombar" ref="window">
	<v-app>
		<div>
		<v-bottom-navigation :absolute="true" :dark="true" fixed="true">
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
		</div>
	</v-app>
</div>
</body>
<script>
new Vue({
	el: '#bottombar',
	vuetify: new Vuetify(),
	data: {
		
	}
})
</script>
</html>